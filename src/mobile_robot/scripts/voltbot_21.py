#!/usr/bin/env python

# license removed for brevity
import threading
import math
from collections import namedtuple
import rospy
import roslib; roslib.load_manifest('global_planner')
from std_msgs.msg import String
from global_planner.srv import *

class voltbot():
    Position = namedtuple('Position', ['x', 'y', 'value'])
    PlanInstance = namedtuple('PlanInstance',['robot_id','horizon_instance','x','y','theta'])
    def __init__(self):
        rospy.init_node('voltbot_controller', anonymous=True)
        self.rate = rospy.Rate(10)
        self.robot_id = 0
        self.workspace_x = 5
        self.workspace_y = 5
        self.workspace = [[-1 for y in range(5)] for x in range(5)]
        self.current_horizon = 0
        self.share_plan_service = 0
        #try:
        #   threading.Thread(target=self.getPlanServer, args=()).start()
        #except:
        #    print "Error: unable to start thread"
        self.getPlanServer()

        
        
    ## Up the service which recives plan from the global planner   
    def getPlanServer(self):
        plan_service_name = "robot_";
        plan_service_name += str(self.robot_id);
        plan_service_name += "/share_plan";
        self.share_plan_service = rospy.Service(plan_service_name, global_planner.srv.PlanForHorizon, self.getPlan)
        #print("Service Name " + plan_service_name)
        print("Robot %d ready to receive plan from global planner"%self.robot_id)
        


    def printWorkspace(self):
        print("Print local view of Robot:%d"%self.robot_id)
        
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
            temp_request = global_planner.srv.ShareLocalInformation()
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

    def getPlan(self,req):
        plan_for_horizon = []
        for i in range(len(req.plans)):
          print("Robot id: %d, Horizon_instance: %d, X: %lf Y: %lf, Theta: %lf"%(req.plans[i].robot_id,req.plans[i].horizon_step, req.plans[i].x,req.plans[i].y,req.plans[i].theta))
          if(req.plans[i].robot_id == self.robot_id):
            temp_plan_instance = self.PlanInstance(req.plans[i].robot_id,req.plans[i].horizon_step, req.plans[i].x,req.plans[i].y,req.plans[i].theta)
            plan_for_horizon.append(temp_plan_instance)
        try:
            threading.Thread(target=self.executeTotalPlan, args=(plan_for_horizon,)).start()
        except:
            print "Error: unable to start thread"
        return global_planner.srv.PlanForHorizonResponse(self.current_horizon)

    def executeTotalPlan(self,plan_for_horizon):
        print("Robot: %d Ready to execute received plan in Horizon %d"%(self.robot_id,self.current_horizon))
        if(len(plan_for_horizon) == 0):
            print("Coverage Completed.......Robot %d is shutting down.")
        for i in range(1, len(plan_for_horizon)):
          print("Robot id: %d, Horizon_instance: %d, X: %lf Y: %lf, Theta: %lf"%(plan_for_horizon[i].robot_id,plan_for_horizon[i].horizon_instance, plan_for_horizon[i].x,plan_for_horizon[i].y,plan_for_horizon[i].theta))
          #self.updateWorkspace()
          #self.printWorkspace()

        #self.updateHorizonInformation()  
        #self.shareWorkspaceInformation()
        

    def updateHorizonInformation(self):
        self.current_horizon = self.current_horizon + 1
        print("Next Horizon: %d"%self.current_horizon)




    def getPose(self):
        loc_x = 0
        loc_y = 4
        theta = 0.140
        return (loc_x, loc_y, theta)

    def getUltraSonicValue(self):
        front = 55
        left = 60
        right = 65
        return (front,left,right)


    
if __name__ == '__main__':
    try:
        robot = voltbot()
        robot.updateWorkspace()
        robot.printWorkspace()
        robot.shareWorkspaceInformation()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


