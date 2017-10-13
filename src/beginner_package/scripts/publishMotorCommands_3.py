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
global target_encd
global keypress
global initial
global target

angle=0
def callback(bear_data,encoder_data):
    # rospy.loginfo(bear_data.data+" "+encoder_data.data)
    # time.sleep(2)
    encd=encoder_data.data
    bear=bear_data.data

    # if(int(encd)<=tomove):
    #     rospy.loginfo(bear_data.data+" "+encoder_data.data)

    global flag
    if(flag==0):
        flag=1
        global initial_bear
        global initial_encd
        global target_encd
        initial_bear=int(float(bear))
        initial_encd=int(encd)
        target_encd=initial_encd+tomove
    rate = rospy.Rate(10) # 10hz
    
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
    rospy.loginfo(topub+" " +str(cur_encd)+" "+str(cur_bear))
    pub.publish(topub)
    rate.sleep()
    # if(abs(cur_encd-initial_encd)<5):
        # bear_data.unregister()
        # ts.unregister()
        # rospy.loginfo(subforw)
        # ts.disconnect()
        # encoder_data.unregister()
    


def move():
    global bear_data
    global encoder_data
    bear_data=message_filters.Subscriber('bearing', String)
    encoder_data=message_filters.Subscriber('encoderl', String)

    global subforw
    global ts
    ts = message_filters.ApproximateTimeSynchronizer([bear_data, encoder_data], 10, 0.1, allow_headerless=True)
    subforw=ts.registerCallback(callback)
    rospy.loginfo("ok11\n")
    return
    # rospy.spin()

def callbackRotate(data):
    global flag
    global angle
    if(flag==0):
        global target
        global keypress
        flag=1
        initial=int(float(data.data))
        if(keypress[0]=='d'):
            target=initial+int(float(angle))
            if(target>=360):
                target=target-360
        elif(keypress[0]=='a'):
            target=initial-int(float(angle))
            if(target<0):
                target=target+360
        
    rate = rospy.Rate(10) # 10hz
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
        
        keypress='x'
        topub=keypress+" "+str(pwml)+" "+str(pwmr)
        rospy.loginfo(topub+" " +data.data+" "+str(target))
        pub.publish(topub)
        rate.sleep()
        subonce.unregister()

def rotate():
    global subonce
    subonce=rospy.Subscriber('bearing', String, callbackRotate)

def callback0(data):
    initial_enc=data.data
    global keypress
    s1=keypress[2:].find(' ')
    dist=keypress[s2+1:]
    final_enc_reading=int(dist)*1.2
    move(final_enc_reading)
    return

def takeCommand():
    global keypress
    rospy.init_node('motor_cmd_teller', anonymous=True)
    while True:
        keypress=raw_input('hh: ')
        rospy.loginfo("enter\n")
        if(keypress[0]=='w'):
            global flag
            flag=0
            # rospy.Subscriber('encoderl',String,callback0)
            dist=keypress[2:]
            global tomove
            tomove=int(dist)*1.2 #assign target encoder reading
            rospy.loginfo(str(tomove))
            move()
        elif(keypress[0]=='s'):
            dist=keypress[2:]
            global tomove
            tomove=int(dist)*1.2 #assign target encoder reading
            rospy.loginfo(str(tomove))
            move()
        elif(keypress[0]=='a' or keypress[0]=='d'):
            global flag
            flag=0
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
