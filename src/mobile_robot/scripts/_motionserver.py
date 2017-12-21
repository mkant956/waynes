#!/usr/bin/env python



import rospy
from std_msgs.msg import String
from std_msgs.msg import Float32
import paramiko
import sys
import time
from time import sleep
import sys, tty, termios
import math
from beginner_package.srv import *

import RPi.GPIO as GPIO # always needed with RPi.GPIO
# from time import sleep  # pull in the sleep function from time module

GPIO.setmode(GPIO.BCM)  # choose BCM or BOARD numbering schemes. I use BCM
moto1l=18
moto1r=23
moto2l=24
moto2r=25
GPIO.setwarnings(False)
#power=1  #2/3 b
power=1.2
pwml=80.0
#factor=640.0/657.0 #2/3 battery
factor=(299.0/325.0)*(653.0/670.0) #full battery
pwmr=pwml*(factor**power)

GPIO.setup(moto1r, GPIO.OUT)# set GPIO 25 as output for white led
GPIO.setup(moto1l, GPIO.OUT)# set GPIO 24 as output for red led

GPIO.setup(moto2r, GPIO.OUT)# set GPIO 25 as output for white led
GPIO.setup(moto2l, GPIO.OUT)# set GPIO 24 as output for red led

motor1l = GPIO.PWM(18, 55)
motor1r = GPIO.PWM(23, 55)
motor2l = GPIO.PWM(24, 55)
motor2r = GPIO.PWM(25, 55) 

motor1l.start(100)
motor1r.start(100)
motor2l.start(100)
motor2r.start(100)

lvel=0
rvel=0
def forward(pwml,pwmr):
    #print "forward"
    motor1l.ChangeDutyCycle(pwmr)
    motor1r.ChangeDutyCycle(0)
    motor2l.ChangeDutyCycle(pwml)
    motor2r.ChangeDutyCycle(0)

def backward(pwml,pwmr):
    #print "backward"
    motor1l.ChangeDutyCycle(0)
    motor1r.ChangeDutyCycle(pwmr)
    motor2l.ChangeDutyCycle(0)
    motor2r.ChangeDutyCycle(pwml)

def left(pwml,pwmr):
    #print "left"
    motor1l.ChangeDutyCycle(pwmr)
    motor1r.ChangeDutyCycle(0)
    motor2l.ChangeDutyCycle(0)
    motor2r.ChangeDutyCycle(pwml)

def right(pwml,pwmr):
    #print "right"
    motor1l.ChangeDutyCycle(0)
    motor1r.ChangeDutyCycle(pwmr)
    motor2l.ChangeDutyCycle(pwml)
    motor2r.ChangeDutyCycle(0)

def stop():
    #print "stop"
    motor1l.ChangeDutyCycle(100)
    motor1r.ChangeDutyCycle(100)
    motor2l.ChangeDutyCycle(100)
    motor2r.ChangeDutyCycle(100)
    
global rotateSubscribe
def setTarget(xc,yc,xt,yt):

	var  = (math.atan2((yt-yc+0.5),(xt-xc + 0.5)))*180.0/3.141592653
	return var

def distance(xc,yc,xt,yt):
	return abs(yc-yt-0.5) +abs(xc-xt-0.5)
global c
c=0
global xt
global yt
global n
def computeN(cur_pose):
	if(cur_pose<45 and cur_pose>-45):
		return 0
	elif(cur_pose<135 and cur_pose>45):
		return 1
	elif(cur_pose>135 or cur_pose<-135):
		return 2
	elif(cur_pose<-45 and cur_pose>-135):
		return 3

def decideDir(t1,t2):
	if(t1*t2>0):
		if(t1>t2):
			return True
		else:
			return False
	else:
		cross0=abs(t1)+abs(t2)
		if(t1>0):
			cross180=abs(180-t1)+abs(180+t2)
		else:
			cross180=abs(180+t1)+abs(180-t2)
		if(cross0>cross180):
			if(t1>0):
				return False
			else:
				return True
		else:
			if(t1>0):
				return True
			else:
				return False
targets = [0,90,180,-90]
global flag
global execute
execute=0
flag=0
global isRotate
global isTranslate
isRotate=True
isTranslate=False
def callback(data):
	read = data.data
	s1=read.find(' ')
	xc = float(read[:s1])
	read=read[s1+1:]
	s2=read.find(' ')
	yc = float(read[:s2])
	read = read[s2+1:]
	cur_bear=float(read)
	target  = setTarget(xc,yc,xt,yt)
	
	#rospy.loginfo(str(xc)+" "+str(yc)+" "+str(cur_bear)+ " "+ str(target))
	global isRotate
	global isTranslate
	global execute
	global flag
	global xt
	global yt
	global n
	pwm_turn_l = 15
	pwm_turn_r = 20
	if(flag==0):
		flag=1
		#if(distance(xc,yc,xt,yt)>0.15):
		if(abs(cur_bear-targets[n])<45 or abs(abs(cur_bear-targets[n])-360 ) <45):
			isRotate=False
		else: 
			isRotate=True
		if(int(xc)==int(xt) and int(yc)==int(yt)):
			isTranslate=False
		elif(isRotate == False):
			isTranslate=True
	global c

	#if((abs(cur_bear-targets[n])<5 or abs(abs(cur_bear-targets[n])-360 )<5) and distance(xc,yc,xt,yt)<=0.05):
	if(isRotate == False and isTranslate == False):
	        stop()
                rospy.loginfo(str(c))
                global rotateSubscribe
                print("subscriber unresgistered\n")
		rotateSubscribe.unregister()
		global flag
	        flag=0
                execute=1
	#elif(abs(cur_bear-targets[n])%360 >= 3):# and distance(xc,yc,xt,yt)<=0.05):
	elif(isRotate):
		rospy.loginfo("rotating : c_a =  %lf n = %d\n",cur_bear,n)

		#target=targets[n]
               	if(not decideDir(cur_bear,targets[n])):
                       	left(pwm_turn_l,pwm_turn_r)
                       	c=c+1
                else:
                        right(pwm_turn_l,pwm_turn_r)
		if(abs(cur_bear-targets[n])<=5 or abs(abs(cur_bear-targets[n])-360)<=5):

		#else:
                        stop()
                        #rospy.loginfo(str(c))
	                print("subscriber unresgistered\n")

                        global rotateSubscribe
                        #moveToPose()
                        rotateSubscribe.unregister()
        		global flag
		        flag=0
		        execute = 1
                        #stop()

	elif(isTranslate):

		if(abs(cur_bear-target)>5 and abs(abs(cur_bear-target)-360 )>5  and distance(xc,yc,xt,yt)>0.05):
			print("going forward : ",cur_bear,target,xc,yc,xt,yt)
			
			if(not decideDir(cur_bear,target)):
				left(pwm_turn_l,pwm_turn_r)
				c=c+1
			else:
				right(pwm_turn_l,pwm_turn_r)
		elif(distance(xc,yc,xt,yt)>0.05):
			forward(55,48)
		else:
			stop()
			
			#rospy.loginfo(str(c))
			global rotateSubscribe
	                print("subscriber unresgistered\n")
		
			#moveToPose()
			rotateSubscribe.unregister()
			global flag
		        flag=0

			execute = 1
			#stop()

	else:
                stop()
                rospy.loginfo(str(c))
                global rotateSubscribe
                print("subscriber unresgistered\n")
                rotateSubscribe.unregister()
		global flag
	        flag=0
                execute=1

def goForward(req):
	#rospy.init_node('moveForward', anonymous=True)
	global xt
	global yt
	global n
	global execute
	xt=req.x
	yt=req.y
	n=req.n
    # str="mindok"
	global rotateSubscribe
	print("target : ",xt,yt,n,execute)
	rotateSubscribe = rospy.Subscriber('pose', String, callback)
	while(execute==0):
		time.sleep(0.1)
	execute = 0
	rotateSubscribe.unregister()
	global flag
	flag=0
	print("goForward executed")
	#print(xt,yt,n)

	return AddTwoIntsResponse(req.x + req.y)    

def handle_add_two_ints(req):
	print(req)
	print "Returning [%s + %s = %s]"%(req.x, req.y, (req.x + req.y))
	return AddTwoIntsResponse(req.x + req.y)

def execute_command_server():
    rospy.init_node('execute_command_server')
    s = rospy.Service('execute_command', AddTwoInts, goForward)
    print "Ready to execute plans."
    global flag
    flag=0
#    print(flag)
    rospy.spin()

#if __name__ == "__main__":
  #  execute_command_server()
if __name__ == '__main__':
    stop()
    
    try:
        execute_command_server()
        #goForward()
    except rospy.ROSInterruptException:
        pass
