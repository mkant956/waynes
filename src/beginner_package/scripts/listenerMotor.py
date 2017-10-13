#!/usr/bin/env python



import rospy
from std_msgs.msg import String
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
    print "forward"
    motor1l.ChangeDutyCycle(pwmr)
    motor1r.ChangeDutyCycle(0)
    motor2l.ChangeDutyCycle(pwml)
    motor2r.ChangeDutyCycle(0)

def backward(pwml,pwmr):
    print "backward"
    motor1l.ChangeDutyCycle(0)
    motor1r.ChangeDutyCycle(pwmr)
    motor2l.ChangeDutyCycle(0)
    motor2r.ChangeDutyCycle(pwml)

def left(pwml,pwmr):
    print "left"
    motor1l.ChangeDutyCycle(pwmr)
    motor1r.ChangeDutyCycle(0)
    motor2l.ChangeDutyCycle(0)
    motor2r.ChangeDutyCycle(pwml)

def right(pwml,pwmr):
    print "right"
    motor1l.ChangeDutyCycle(0)
    motor1r.ChangeDutyCycle(pwmr)
    motor2l.ChangeDutyCycle(pwml)
    motor2r.ChangeDutyCycle(0)

def stop():
    print "stop"
    motor1l.ChangeDutyCycle(100)
    motor1r.ChangeDutyCycle(100)
    motor2l.ChangeDutyCycle(100)
    motor2r.ChangeDutyCycle(100)

def callback(data):
    # new=(data.data).strip()
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', repr(data.data))
    read=(data.data).strip()

    s1=read.find(' ')
    cmd=read[:s1]
    read=read[s1+1:]
    s2=read.find(' ')
    pwml=read[:s2]
    pwml=float(pwml)
    pwmr=read[s2+1:]
    pwmr=float(pwmr)


    if(cmd=='w'):
        forward(pwml,pwmr)
    elif(cmd=='s'):
        backward(pwml,pwmr)
    elif(cmd=='a'):
        left(pwml,pwmr)
    elif(cmd=='d'):
        right(pwml,pwmr)
    elif(cmd=='/'):
        GPIO.cleanup()
        exit()
    elif(cmd=='x'):
        stop()
    #new=new+'\n'
    #new=float(new)
    
    #new=float(new)
    #new=str(new)
    # ledChannel.send(new+'\n')
    

def listen_motor():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listen_motor', anonymous=True)
    # str="mindok"
    rospy.Subscriber('motor_cmd', String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    stop()
    try:
        listen_motor()
    except rospy.ROSInterruptException:
        pass
