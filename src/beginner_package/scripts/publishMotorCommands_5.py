#!/usr/bin/env python


import rospy
from std_msgs.msg import String
import contextlib
import sys
import termios
import time
import message_filters

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
# bear=50
# encd=0
global target_encd
global keypress
global initial
global target



angle=0

def callbackEncd(data):
    global encd
    encd=data.data

def callbackBear(data):
    global bear
    bear=data.data


def move2():
    subencd=rospy.Subscriber('encoderl', String, callbackEncd)
    subbear=rospy.Subscriber('bearing', String, callbackBear)

    global encd
    global bear

    # bear=bear_data.data
    # encd=encd_data

    global flagw
    if(flagw==0):
        global encd
        global bear
        flagw=1
        global initial_bear
        global initial_encd
        global target_encd
        global tomove
        initial_bear=int(float(bear))
        initial_encd=int(encd)
        target_encd=initial_encd+tomove
    rate = rospy.Rate(100) # 10hz
    
    # keypress='w'
    cur_bear=int(float(bear))
    cur_encd=int(float(encd))
    global initial
    global t_factor
    global keypress
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
    if(abs(cur_encd-initial_encd)>tomove):
        keypress='x'
        pwmr=100
        pwml=100
    # rospy.loginfo(keypress)
    topub=keypress[0]+" "+str(pwml)+" "+str(pwmr)
    rospy.loginfo(topub+" " +str(encd)+" "+str(bear))
    pub.publish(topub)
    rate.sleep()
    if(abs(cur_encd-initial_encd)>tomove):
    #     global bear_data
    #     global encoder_data
        subbear.unregister()
        subencd.unregister()
    #     # rospy.loginfo(subforw)
    #     # ts.disconnect()


def callbackRotate(data):
    global flagr
    global angle
    if(flagr==0):
        global target
        global keypress
        flagr=1
        initial=int(float(data.data))
        if(keypress[0]=='d'):
            target=initial+int(float(angle))
            if(target>=360):
                target=target-360
        elif(keypress[0]=='a'):
            target=initial-int(float(angle))
            if(target<0):
                target=target+360
        
    rate = rospy.Rate(100) # 10hz
    global target
    cur_bear=int(float(data.data))
    
    global t_factor

    pwml=13
    pwmr=13

    if(abs(target-cur_bear)>3):
        if((target-cur_bear)>3):
            keypress='d'
        else:
            keypress='a'
        global initial
        if(initial-cur_bear<-300):
            cur_bear=cur_bear-360
        elif(initial-cur_bear>300):
            cur_bear=cur_bear+360

        if(abs(initial-cur_bear)<=2):
            t_factor=factor
        else:
            t_factor=t_factor+0.005
        
        topub=keypress+" "+str(pwml)+" "+str(pwmr)
        rospy.loginfo(topub+" " +data.data+" "+str(target))
        pub.publish(topub)
        rate.sleep()
    else:
        global subonce
        keypress='x'
        topub=keypress+" "+str(pwml)+" "+str(pwmr)
        rospy.loginfo(topub+" " +data.data+" "+str(target))
        pub.publish(topub)
        rate.sleep()
        subonce.unregister()

def rotate():
    global subonce
    subonce=rospy.Subscriber('bearing', String, callbackRotate)


def takeCommand():
    global keypress
    rospy.init_node('motor_cmd_teller', anonymous=True)
    while True:
        keypress=raw_input('hh: ')
        rospy.loginfo("enter\n")
        if(keypress[0]=='w'):
            global flagw
            flagw=0
            # rospy.Subscriber('encoderl',String,callback0)
            dist=keypress[2:]
            global tomove
            tomove=int(dist)*1.2 #assign target encoder reading
            rospy.loginfo(str(tomove))
            move2()
        elif(keypress[0]=='s'):
            dist=keypress[2:]
            global tomove
            tomove=int(dist)*1.2 #assign target encoder reading
            rospy.loginfo(str(tomove))
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
