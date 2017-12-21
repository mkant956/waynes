#!/usr/bin/env python

import sys
import rospy
from beginner_package.srv import *

def add_two_ints_client(x, y, n):
    rospy.wait_for_service('execute_command')
    try:
        add_two = rospy.ServiceProxy('execute_command', AddTwoInts)
        resp1 = add_two(x,y,n)
        print(resp1)
        return resp1.done
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def usage():
    return "%s [x y]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 4:
        x = float(sys.argv[1])
        y = float(sys.argv[2])
        n=float(sys.argv[3])
    else:
        print usage()
        sys.exit(1)
    print "Requesting %s,%s,%s"%(x, y, n)
    print "%s + %s = %s"%(x, y, add_two_ints_client(x, y, n))
