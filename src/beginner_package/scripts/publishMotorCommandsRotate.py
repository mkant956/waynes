#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Revision $Id$

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
from std_msgs.msg import String
import contextlib
import sys
import termios

global keypress
global initial
target=90
# factor = 10
# global flag
flag=0
@contextlib.contextmanager
def raw_mode(file):
    old_attrs = termios.tcgetattr(file.fileno())
    new_attrs = old_attrs[:]
    new_attrs[3] = new_attrs[3] & ~(termios.ECHO | termios.ICANON)
    try:
        termios.tcsetattr(file.fileno(), termios.TCSADRAIN, new_attrs)
        yield
    finally:
        termios.tcsetattr(file.fileno(), termios.TCSADRAIN, old_attrs)

pub = rospy.Publisher('motor_cmd', String, queue_size=10)

def callback(data):
    rospy.init_node('motor_cmd_teller', anonymous=True)
    global flag
    if(flag==0):
        flag=1
        initial=int(float(data.data))
    rate = rospy.Rate(10) # 10hz
    # while not rospy.is_shutdown():
    # with raw_mode(sys.stdin):
        # rospy.loginfo("ok\n")
        # keypress=sys.stdin.read(1)
        # if(keypress=='w'):
        #     hello_str = "forward"
        # elif(keypress=='s'):
        #     hello_str="backward"
        # elif(keypress == 'a'):
        #     hello_str = "left"
        # elif(keypress == 'd'):
        #     hello_str = "right"
        # elif(keypress == 'x'):
        #     hello_str = "stop"
        # elif(keypress == '/'):
        #     print "motion stopped\n"
        #     hello_str = "quit"

    global target



    cur_bear=int(float(data.data))
    global initial
    global t_factor

    pwml=14
    pwmr=14

    if(abs(target-cur_bear)>3):
        if((target-cur_bear)>3):
            keypress='d'
        else:
            keypress='a'
    else:
        keypress='x'
        pwml=0
        pwmr=0
        # keypress = '/'

    if(initial-cur_bear<-300):
        cur_bear=cur_bear-360
    elif(initial-cur_bear>300):
        cur_bear=cur_bear+360

    if(abs(initial-cur_bear)<=2):
        t_factor=factor
    else:
        t_factor=t_factor+0.005
    
    topub=keypress+" "+str(pwml)+" "+str(pwmr)
    rospy.loginfo(topub+" " +data.data)
    pub.publish(topub)
    rate.sleep()
    if(keypress=='x'):
        quit()



def cmd_teller():
    
    rospy.init_node('motor_cmd_teller', anonymous=True)

    rate = rospy.Rate(200) # 10hz
    # while not rospy.is_shutdown():
    with raw_mode(sys.stdin):
        # rospy.loginfo("ok\n")
        keypress=sys.stdin.read(1)
        # rospy.Subscriber('bearing', String, callback)
        
            # break;


        # hello_str=main()
        # rospy.loginfo(hello_str)
        

def listen_bearing():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('motor_cmd_teller', anonymous=True)

    rospy.Subscriber('bearing', String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    factor=1.3
    flag=0
    try:
        listen_bearing()
    except rospy.ROSInterruptException:
        pass
