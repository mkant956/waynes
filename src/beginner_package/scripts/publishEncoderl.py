#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import sys
import time
import re
import RPi.GPIO as GPIO
import smbus
import math


clk = 4
dt = 22

GPIO.setmode(GPIO.BCM)
GPIO.setup(clk, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(dt, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

counter = 0
clkLastState = GPIO.input(clk)

def readEncoderl():
    global clkLastState
    global counter
    clkState = GPIO.input(clk)
    dtState = GPIO.input(dt)
    if clkState != clkLastState:
            if dtState != clkState:
                    counter += 1
            else:
                    counter -= 1
    clkLastState = clkState
    return counter

def encoderlPublish():
    pub = rospy.Publisher('encoderl', String, queue_size=10)
    rospy.init_node('left_encoder', anonymous=True)
    rate=rospy.Rate(10)
    while not rospy.is_shutdown():
        hello_str = readEncoderl()
        rospy.loginfo(repr(hello_str))
        pub.publish(str(hello_str))
        rate.sleep()


if __name__ == '__main__':
    try:
        encoderlPublish()
    except rospy.ROSInterruptException:
        pass
