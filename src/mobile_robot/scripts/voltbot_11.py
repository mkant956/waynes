#!/usr/bin/env python

# license removed for brevity
import threading
import math
from collections import namedtuple
import rospy
import roslib; roslib.load_manifest('mobile_robot')
from std_msgs.msg import String
from std_msgs.msg import Float32
from mobile_robot.srv import *
import time
global position
global distance
distance = (0,0,0)
global flag
flag=0
global check_left
check_left=0

global check_right
check_right=0
global check_front
check_front=0
def callback_location(data):
	global position
	global flag
	position = data.data
	
	flag=1
	#rospy.loginfo("calling "+str(data)+"\t"+str(flag)+"\n")
	#return
def callback_front_ultrasonic(data):
	global distance
	global check_front
	check_front = 1
	rospy.loginfo("f "+str(distance))
	distance=(distance[0],data.data,distance[2])
def callback_left_ultrasonic(data):
	global check_left
	check_left=1
	global distance
	rospy.loginfo("l "+str(distance))
	distance=(data.data,distance[1],distance[2])
def callback_right_ultrasonic(data):
	global distance
	global check_right
	check_right = 1
	distance=(distance[0],distance[1],data.data)
	rospy.loginfo("r "+str(distance)+str(data.data))
class voltbot():
    Position = namedtuple('Position', ['x', 'y', 'value'])

    def __init__(self):
        rospy.init_node('voltbot_controller', anonymous=True)
        self.rate = rospy.Rate(10)
        self.robot_id = 0
	self.robot_x = 0
	self.robot_y = 0
	self.robot_theta = 0
	self.workspace_x = 5
        self.workspace_y = 5
        self.workspace = [[-1 for y in range(5)] for x in range(5)]
        self.current_horizon = 0
	rospy.Subscriber('pose',String,callback_location)
	rospy.Subscriber('front_dist',Float32,callback_front_ultrasonic)
	rospy.Subscriber('left_dist',Float32,callback_left_ultrasonic)
	rospy.Subscriber('right_dist',Float32,callback_right_ultrasonic)

	#rospy.spin()
		

    def printWorkspace(self):
        print("Print local view of Robot:%d"%self.robot_id)
        print
        for j in range(self.workspace_y-1, -1, -1):
            print("%d \t" %j),
            for i in range(self.workspace_x):
                print("%lf \t" % self.workspace[i][j]),
            print
        print("")
        for i in range(self.workspace_x):
                print("\t %d \t" % i),
        print
    
    # Estimate the intended theta from the actual location
    def check_intended_theta(self, theta):
       if(theta < 0):
           theta = 2*math.pi + theta
       intended_theta = int(round((theta/(math.pi/2)%4)))
       #print("Actual Theta: %lf, Intended Theta: %lf"%(theta,intended_theta))
       return intended_theta

    def get_rotated_location(self,temp_x,temp_y,cell_x,cell_y,theta):
        tmp_theta = theta*(math.pi/2)
        next_x = round(((temp_x * math.cos(tmp_theta) - temp_y * math.sin(tmp_theta))))
        next_y = round(((temp_x * math.sin(tmp_theta) + temp_y * math.cos(tmp_theta))))
        sensed_x =  next_x + cell_x
        sensed_y =  next_y + cell_y
        #print("X: %lf Y: %lf Theta: %lf"%(next_x,next_y,tmp_theta))
        return (sensed_x,sensed_y)

    # Get the visible cells
    def get_visible_cells(self,cell_x,cell_y,theta):
        [front,left,right] = self.getUltraSonicValue()
        visible_cells = []
        if(front >= 40):
            [loc_x,loc_y] = self.get_rotated_location(1,0,cell_x,cell_y,theta)
            #print("Cell_x: %d Cell_Y: %d, Theta: %d Location at front Direction: X: %d Y: %d"%(cell_x,cell_y,theta,loc_x,loc_y))
            if((loc_x >= 0 and loc_x < self.workspace_x) and ((loc_y >= 0 and loc_y < self.workspace_y))):
                temp_position = self.Position(loc_x,loc_y,0.5)
                visible_cells.append(temp_position)
        if(left >= 40):
            [loc_x,loc_y] = self.get_rotated_location(0,1,cell_x,cell_y,theta)
            #print("Cell_x: %d Cell_Y: %d, Theta: %d Location at left Direction: X: %d Y: %d"%(cell_x,cell_y,theta,loc_x,loc_y))
            if((loc_x >= 0 and loc_x < self.workspace_x) and ((loc_y >= 0 and loc_y < self.workspace_y))):
                temp_position = self.Position(loc_x,loc_y,0.5)
                visible_cells.append(temp_position)
        if(right >= 40):
            [loc_x,loc_y] = self.get_rotated_location(0,-1,cell_x,cell_y,theta)
            #print("Cell_x: %d Cell_Y: %d, Theta: %d Location at right Direction: X: %d Y: %d"%(cell_x,cell_y,theta,loc_x,loc_y))
            if((loc_x >= 0 and loc_x < self.workspace_x) and ((loc_y >= 0 and loc_y < self.workspace_y))):
                temp_position = self.Position(loc_x,loc_y,0.5)
                visible_cells.append(temp_position)
        return visible_cells

    def check_visible_region(self, loc_x,loc_y,theta):
        cell_x = int(loc_x)
        cell_y = int(loc_y)
        intended_theta = self.check_intended_theta(theta)
        print("Actual Pose: X: %lf Y: %lf Theta: %lf Cell Pose: X: %d, Y: %d, Theta: %d"%(loc_x,loc_y,theta,cell_x,cell_y,intended_theta))
        visible_cells = self.get_visible_cells(cell_x,cell_y,intended_theta)
        total_visible_cells = len(visible_cells)
        for i in range(total_visible_cells):
            print("Visible Cell: %d Location: X: %d Y: %d Value: %lf"%(i,visible_cells[i].x,visible_cells[i].y,visible_cells[i].value))
        return visible_cells
            
     # Update the workspace based on the current location and visibility           
    def updateWorkspace(self):
    	
        [loc_x, loc_y, theta] = self.getPose()
        print("Location: X: %lf Y: %lf Theta: %lf"% (loc_x, loc_y, theta))
        cell_x = int(loc_x)
        cell_y = int(loc_y)
        self.workspace[cell_x][cell_y] = 1.0
        visible_cells = self.check_visible_region(loc_x,loc_y,theta)
        total_visible_cells = len(visible_cells)
        for i in range(total_visible_cells):
            temp_x = int(visible_cells[i].x)
            temp_y = int(visible_cells[i].y)
            temp_value = visible_cells[i].value
            if(self.workspace[temp_x][temp_y] < temp_value):
                self.workspace[temp_x][temp_y] = temp_value


    def shareWorkspaceInformation(self):
        rospy.wait_for_service('share_workspace')
        [loc_x,loc_y,theta] = self.getPose()
        
        try:
            share_local_information = rospy.ServiceProxy('share_workspace', ShareLocalInformation)
            temp_request = mobile_robot.srv.ShareLocalInformation()
            temp_request.robot_id = self.robot_id
            temp_request.horizon = self.current_horizon
            temp_request.x = loc_x
            temp_request.y = loc_y
            temp_request.theta = theta
            temp_request.workspace = []
            for i in range(self.workspace_x):
                for j in range(self.workspace_y):
                    temp_request.workspace.append(self.workspace[i][j])
            #temp_request.robot_pose = Pose2D(loc_x,loc_y,theta)
            #resp = share_local_information(temp_request.robot_id,temp_request.horizon, temp_request.workspace, temp_request.robot_pose)
            resp = share_local_information(temp_request.robot_id,temp_request.horizon, temp_request.x, temp_request.y, temp_request.theta, temp_request.workspace)
            print("Robot Id: %d Current Horizon: %d"% (self.robot_id, resp.next_horizon))
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e



    def getPose(self):
        #loc_x = self.robot_x
        #loc_y = self.robot_y
        #theta = self.robot_theta
        global position
        global flag
        while(flag==0):
#        	rospy.loginfo(str(flag)+"flag \n")
        	time.sleep(0)
        s1=position.find(' ')
	x = float(position[:s1])
	position=position[s1+1:]
	s2=position.find(' ')
	y = float(position[:s2])
	position = position[s2+1:]
	theta=float(position)*180.0/math.pi
        return (x, y, theta)

    def getUltraSonicValue(self):
        global distance
	print(distance)
	while(check_front+check_left+check_right < 3):
		time.sleep(0)
        return distance


    
if __name__ == '__main__':
    try:
    	global robot
        robot = voltbot()
        robot.updateWorkspace()
        robot.printWorkspace()
        robot.shareWorkspaceInformation()
    except rospy.ROSInterruptException:
        pass


