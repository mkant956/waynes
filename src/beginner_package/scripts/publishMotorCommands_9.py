#!/usr/bin/env python


import rospy
from std_msgs.msg import String
import contextlib
import sys
import termios
import time
import message_filters
import os

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

pub = rospy.Publisher('motor_cmd', String, queue_size=10)
pwml=50
pwmr=50
tomove=0
target =90
initial=0
global bear
global encd
global target_encd
global keypress
global initial
global target
global flagw_encd
global flagw_bear
flagw_bear=0
flagw_encd=0

pub = rospy.Publisher('motor_cmd', String, queue_size=10)

angle=0

def callbackLinear(data):
    combinedr=data.data
    s1=combinedr.find(' ')
    encd=combinedr[s1+1:]
    bear=combinedr[:s1]
    global flagw_encd
    if(flagw_encd==0):
        flagw_encd=1
        global initial_encd
        global target_encd
        initial_encd=abs(int(encd))
        target_encd=initial_encd+tomove

    global flagw_bear
    if(flagw_bear==0):
    	initial_bear=int(float(bear))
    	flagw_bear=1
    rate = rospy.Rate(10) # 10hz
    
    # keypress='w'
    cur_bear=int(float(bear))
    cur_encd=abs(int(encd))
    global initial
    global t_factor
    global keypress
    global initial_bear
    if(initial_bear-cur_bear<-300):
        cur_bear=cur_bear-360
    elif(initial_bear-cur_bear>300):
        cur_bear=cur_bear+360

    if(abs(initial_bear-cur_bear)<=2):
        t_factor=factor
    else:
        t_factor=t_factor+0.005
    if(keypress[0]=='w'):
        pwml=50+(initial_bear-cur_bear)*t_factor
        pwmr=50+(cur_bear-initial_bear)*t_factor
    elif(keypress[0]=='s'):
        pwml=50-(initial_bear-cur_bear)*t_factor
        pwmr=50-(cur_bear-initial_bear)*t_factor
    else:
        return;
    if(abs(cur_encd-initial_encd)>tomove):
        keypress='x'
        pwmr=0
        pwml=0
    # rospy.loginfo(keypress)
    topub=keypress[0]+" "+str(pwml)+" "+str(pwmr)
    rospy.loginfo(topub+": encd :" +str(cur_encd)+" :iencd: "+str(initial_encd)+" :tomove: "+str(tomove)+"i.bear: "+str(initial_bear))
    pub.publish(topub)
    rate.sleep()
    if(abs(cur_encd-initial_encd)>tomove):
        subonce_linear.unregister()

def move():
    global subonce_linear
    subonce_linear=rospy.Subscriber('bear_encd', String, callbackLinear)


def callbackRotate(data):
    global flagr
    global angle
    combinedr=data.data
    s1=combinedr.find(' ')
    cur_bear_str=combinedr[:s1]
    if(flagr==0):
        global target
        global keypress
        flagr=1
        
        #initial=int(float(cur_bear_str))
        if(keypress[0]=='d'):
            target=initial_bear+int(float(angle))
            if(target>=360):
                target=target-360
        elif(keypress[0]=='a'):
            target=initial_bear-int(float(angle))
            if(target<0):
                target=target+360
        
    rate = rospy.Rate(100) # 10hz
    global target
    cur_bear=int(float(cur_bear_str))
    
    global t_factor
    global initial_bear
    pwml=13
    pwmr=23
    if(abs(target-cur_bear)>3):
        if((target-cur_bear)>3):
            keypress='d'
        else:
            keypress='a'
        global initial_bear
        if(initial_bear-cur_bear<-300):
            cur_bear=cur_bear-360
        elif(initial_bear-cur_bear>300):
            cur_bear=cur_bear+360

        if(abs(initial_bear-cur_bear)<=2):
            t_factor=factor
        else:
            t_factor=t_factor+0.005
        
        topub=keypress+" "+str(pwml)+" "+str(pwmr)
        rospy.loginfo(topub+" " +cur_bear_str+" "+str(target)+" "+str(initial_bear))
        pub.publish(topub)
        rate.sleep()
    else:
        global subonce
        keypress='x'
        topub=keypress+" "+str(pwml)+" "+str(pwmr)
        rospy.loginfo(topub+" " +cur_bear_str+" "+str(target))
        pub.publish(topub)
        global initial_bear
        if(keypress[0]=='d'):
        	initial_bear=int(float(target))
        	if(initial_bear>360):
        		initial_bear=initial_bear-360
        else:
        	initial_bear=int(float(target))
        	if(initial_bear<0):
        		initial_bear=initial_bear+360

        rate.sleep()
        subonce.unregister()

def rotate():
    global subonce
    subonce=rospy.Subscriber('bear_encd', String, callbackRotate)


def takeCommand():
    global keypress
    rospy.init_node('motor_cmd_teller', anonymous=True)
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
            global flagr
            flagr=0
            global angle
            angle=keypress[2:]
            rotate()
        elif(keypress[0]=='/'):
            break;

if __name__ == '__main__':
	factor=1.3
	flag=0
	try:
	    # while True:
	    takeCommand()
	except rospy.ROSInterruptException:
	    pass
