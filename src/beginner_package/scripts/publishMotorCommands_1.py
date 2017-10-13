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

# def xyz(data):
keypress='x'
pkey='x'
def callback2(data):
    if(data.data)

def runBot(dir,param,initialBear):
    if(dir=='w'):
        dist=param
        while True:
            rospy.Subscriber('wheel_left_rot', String, callback2)

    elif(dir=='s'):

    elif(dir=='a'):

    elif(dir=='d'):

    elif(dir=='x'):

    elif(dir=='/'):
        quit()
        return


def callback(data):
    pub = rospy.Publisher('motor_cmd', String, queue_size=10)
    # rospy.init_node('motor_cmd_teller', anonymous=True)

    rate = rospy.Rate(200) # 10hz
    # while not rospy.is_shutdown():

    global keypress
    if(keypress=='w'):
        hello_str = "forward"
    elif(keypress=='s'):
        hello_str="backward"
    elif(keypress == 'a'):
        hello_str = "left"
    elif(keypress == 'd'):
        hello_str = "right"
    elif(keypress == 'x'):
        hello_str = "stop"
    elif(keypress == '/'):
        print "motion stopped\n"
        hello_str = "quit"


    runBot(keypress[0],keypress[2:],data.data)

    # hello_str=main()
    # rospy.loginfo(hello_str)
    # global pkey
    # if(pkey<>keypress):
    topub=keypress+" 100"+" 50"
    rospy.loginfo(topub+" "+data.data)
    pub.publish(topub)
    rate.sleep()
    # pkey=keypress
    if(keypress=='/'):
        quit()

def listen_bearing():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('motor_cmd_teller', anonymous=True)

    # while True:
    # with raw_mode(sys.stdin):
    global keypress
    while True:
        keypress=raw_input()
        rospy.Subscriber('bearing', String, callback)
        if(keypress=='/'):
            break;

    # spin() simply keeps python from exiting until this node is stopped
    # rospy.spin()

def move(enc_reading):
    

def callback0(data):
    initial_enc=data.data
    global keypress
    s1=keypress[2:].find(' ')
    dist=keypress[s2+1:]
    final_enc_reading=int(dist*1.2)
    move(final_enc_reading)

def takeCommand():
    global keypress
    while True:
        keypress=raw_input()
        if(keypress[0]=='w'):
            rospy.Subscriber('wheel_left_rot',String,callback0)
        if(keypress[0]=='/'):
            break;

if __name__ == '__main__':
    try:
        # while True:
        takeCommand()
    except rospy.ROSInterruptException:
        pass

