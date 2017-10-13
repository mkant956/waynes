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

rospy.init_node('left_encoder_file', anonymous=True)
# rate=rospy.Rate(100)

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
	f=open('/home/pi/catkin_ws/src/beginner_package/scripts/encdl','w')
	f.write("")
	f=open('/home/pi/catkin_ws/src/beginner_package/scripts/encdl','r+')
	# f.write("0")
	while True:
		encd=str(readEncoderl())
		f.seek(0)
		f.write(encd+"           ")
		rospy.loginfo(encd)
		time.sleep(0.0001)
		

# #!/usr/bin/env python
# import subprocess
# with open("output.txt", "w+") as output:
#     subprocess.call(["python", "./script.py"], stdout=output);

if __name__ == '__main__':
    try:
    	
        encoderlPublish()
    except rospy.ROSInterruptException:
        pass
