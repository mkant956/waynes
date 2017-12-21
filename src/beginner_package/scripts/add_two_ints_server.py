#!/usr/bin/env python

from beginner_package.srv import *
#from publishMotionCommandv1 import goForward
import rospy

def handle_add_two_ints(req):
	print(req)
	print "Returning [%s + %s = %s]"%(req.x, req.y, (req.x + req.y))
	return AddTwoIntsResponse(req.x + req.y)

def execute_command_server():
    rospy.init_node('execute_command_server')
    s = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
    print "Ready to add two ints."
    rospy.spin()

if __name__ == "__main__":
    execute_command_server()
