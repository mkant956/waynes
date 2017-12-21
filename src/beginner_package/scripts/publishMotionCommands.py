#!/usr/bin/env python



import rospy
from std_msgs.msg import String
from std_msgs.msg import Float32
import paramiko
import sys
import time
from time import sleep
import sys, tty, termios

#motor1 == rightmotor
#motor2 == leftmotor

#motorl == forward
#motorr == backward

import RPi.GPIO as GPIO # always needed with RPi.GPIO
# from time import sleep  # pull in the sleep function from time module

GPIO.setmode(GPIO.BCM)  # choose BCM or BOARD numbering schemes. I use BCM
moto1l=18
moto1r=23
moto2l=24
moto2r=25

#power=1  #2/3 b
power=1.2
pwml=80.0
#factor=640.0/657.0 #2/3 battery
factor=(299.0/325.0)*(653.0/670.0) #full battery
pwmr=pwml*(factor**power)

global target
GPIO.setup(moto1r, GPIO.OUT)# set GPIO 25 as output for white led
GPIO.setup(moto1l, GPIO.OUT)# set GPIO 24 as output for red led

GPIO.setup(moto2r, GPIO.OUT)# set GPIO 25 as output for white led
GPIO.setup(moto2l, GPIO.OUT)# set GPIO 24 as output for red led

motor1l = GPIO.PWM(18, 55)
motor1r = GPIO.PWM(23, 55)
motor2l = GPIO.PWM(24, 55)
motor2r = GPIO.PWM(25, 55) 
pub = rospy.Publisher('motor_cmd', String, queue_size=10)
rospy.init_node('motion_cmd_teller', anonymous=True)
motor1l.start(100)
motor1r.start(100)
motor2l.start(100)
motor2r.start(100)
global subonce
def callbackRotate(data):
	cur_bear=data.data
	global target 
	pwml="15"
	pwmr="15"
	if(abs(target-cur_bear)%360>3):
		rospy.loginfo("publishing motion \n"+str(target)+"  "+str(cur_bear)+"\n")
		if(target < cur_bear):
			pub.publish("a "+pwml+" "+pwmr)
		if(target>cur_bear):
			pub.publish("d "+pwml+" "+pwmr)
	else:
		rospy.loginfo("publishing x\n")
		global subonce
		pub.publish("x 0 0")
		subonce.unregister()
#		pub.publish("x 0 0")
		
	

def rotate():
	global subonce
	subonce = rospy.Subscriber('bear_encd', Float32, callbackRotate)
	
	
def takeCommand():
    global keypress
    #rospy.init_node('motor_cmd_teller', anonymous=True)
    while True:
        keypress=raw_input('hh: ')
        # rospy.loginfo("enter\n")
        if(keypress[0]=='w'):
            global flagw_encd
            flagw_encd=0
            # rospy.Subscriber('encoderl',String,callback0)
            dist=keypress[2:]
            global tomove
            tomove=int(dist)*1 #assign target encoder reading
            rospy.loginfo(str(tomove))
            move()
        elif(keypress[0]=='s'):
            dist=keypress[2:]
            global flagw_encd
            flagw_encd=0
            global tomove
            tomove=int(int(dist)*1) #assign target encoder reading
            rospy.loginfo("tomove= "+str(tomove))
            move()
        elif(keypress[0]=='a' or keypress[0]=='d'):
            #global flagr
            #flagr=0
            #global angle
            angle=keypress[2:]
            global target
            target=float(angle)
            rotate()
        elif(keypress[0]=='/'):
            break;

if __name__ == '__main__':
    
    try:
        takeCommand()
    except rospy.ROSInterruptException:
        pass
