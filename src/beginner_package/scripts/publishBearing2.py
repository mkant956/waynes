#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import sys
import time
import re
import RPi.GPIO as GPIO
import smbus
import math


bus = smbus.SMBus(1)
address = 0x1e

minx=-482.0
maxx=427.0
miny=-462.0
maxy=506.0

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

def read_byte(adr):
    return bus.read_byte_data(address, adr)

def read_word(adr):
    high = bus.read_byte_data(address, adr)
    low = bus.read_byte_data(address, adr+1)
    val = (high << 8) + low
    return val

def read_word_2c(adr):
    val = read_word(adr)
    if (val >= 0x8000):
        return -((65535 - val) + 1)
    else:
        return val

def write_byte(adr, value):
    bus.write_byte_data(address, adr, value)

write_byte(0, 0b01110000) # Set to 8 samples @ 15Hz
write_byte(1, 0b00100000) # 1.3 gain LSb / Gauss 1090 (default)
write_byte(2, 0b00000000) # Continuous sampling

scale = 0.92

def getBearingData():
    x_out = read_word_2c(3) * scale
    y_out = read_word_2c(7) * scale
    z_out = read_word_2c(5) * scale

    #x_out=(x_out+(minx+maxx)/2)/(maxx-minx)
    #y_out=(y_out+450+(miny+maxy)/2)/(maxy-miny)
    y_out=y_out+500
    x_out=(x_out-251.99)/942.0
    y_out=(y_out-748.84)/976.0
    bearing  = math.atan2(y_out, x_out)
    if (bearing < 0):
        bearing += 2 * math.pi

    return math.degrees(bearing)


def bearingPublish():
    pub = rospy.Publisher('bear_encd', String, queue_size=10)
    rospy.init_node('bear_encoder', anonymous=True)
    f=open('/home/pi/catkin_ws/src/beginner_package/scripts/encdl','r')
    rate=rospy.Rate(10)
    while not rospy.is_shutdown():
        bear = str(getBearingData())
        f.seek(0)
        encd = f.read()
        rospy.loginfo(repr(bear+" "+encd))
        pub.publish(bear+" "+encd)
        rate.sleep()


if __name__ == '__main__':
    try:
        bearingPublish()
    except rospy.ROSInterruptException:
        pass
