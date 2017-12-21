;; Auto-generated. Do not edit!


(when (boundp 'mobile_robot::ShareLocalInformation)
  (if (not (find-package "MOBILE_ROBOT"))
    (make-package "MOBILE_ROBOT"))
  (shadow 'ShareLocalInformation (find-package "MOBILE_ROBOT")))
(unless (find-package "MOBILE_ROBOT::SHARELOCALINFORMATION")
  (make-package "MOBILE_ROBOT::SHARELOCALINFORMATION"))
(unless (find-package "MOBILE_ROBOT::SHARELOCALINFORMATIONREQUEST")
  (make-package "MOBILE_ROBOT::SHARELOCALINFORMATIONREQUEST"))
(unless (find-package "MOBILE_ROBOT::SHARELOCALINFORMATIONRESPONSE")
  (make-package "MOBILE_ROBOT::SHARELOCALINFORMATIONRESPONSE"))

(in-package "ROS")





(defclass mobile_robot::ShareLocalInformationRequest
  :super ros::object
  :slots (_robot_id _horizon _x _y _theta _workspace ))

(defmethod mobile_robot::ShareLocalInformationRequest
  (:init
   (&key
    ((:robot_id __robot_id) 0)
    ((:horizon __horizon) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:workspace __workspace) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _robot_id (round __robot_id))
   (setq _horizon (round __horizon))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _workspace __workspace)
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:horizon
   (&optional __horizon)
   (if __horizon (setq _horizon __horizon)) _horizon)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:workspace
   (&optional __workspace)
   (if __workspace (setq _workspace __workspace)) _workspace)
  (:serialization-length
   ()
   (+
    ;; int16 _robot_id
    2
    ;; int16 _horizon
    2
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; float32[] _workspace
    (* 4    (length _workspace)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _robot_id
       (write-word _robot_id s)
     ;; int16 _horizon
       (write-word _horizon s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _workspace
     (write-long (length _workspace) s)
     (dotimes (i (length _workspace))
       (sys::poke (elt _workspace i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _robot_id
     (setq _robot_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _horizon
     (setq _horizon (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _workspace
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _workspace (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _workspace i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass mobile_robot::ShareLocalInformationResponse
  :super ros::object
  :slots (_next_horizon ))

(defmethod mobile_robot::ShareLocalInformationResponse
  (:init
   (&key
    ((:next_horizon __next_horizon) 0)
    )
   (send-super :init)
   (setq _next_horizon (round __next_horizon))
   self)
  (:next_horizon
   (&optional __next_horizon)
   (if __next_horizon (setq _next_horizon __next_horizon)) _next_horizon)
  (:serialization-length
   ()
   (+
    ;; int16 _next_horizon
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _next_horizon
       (write-word _next_horizon s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _next_horizon
     (setq _next_horizon (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass mobile_robot::ShareLocalInformation
  :super ros::object
  :slots ())

(setf (get mobile_robot::ShareLocalInformation :md5sum-) "1ee98618110ac3e0511341f8c0d6d3a0")
(setf (get mobile_robot::ShareLocalInformation :datatype-) "mobile_robot/ShareLocalInformation")
(setf (get mobile_robot::ShareLocalInformation :request) mobile_robot::ShareLocalInformationRequest)
(setf (get mobile_robot::ShareLocalInformation :response) mobile_robot::ShareLocalInformationResponse)

(defmethod mobile_robot::ShareLocalInformationRequest
  (:response () (instance mobile_robot::ShareLocalInformationResponse :init)))

(setf (get mobile_robot::ShareLocalInformationRequest :md5sum-) "1ee98618110ac3e0511341f8c0d6d3a0")
(setf (get mobile_robot::ShareLocalInformationRequest :datatype-) "mobile_robot/ShareLocalInformationRequest")
(setf (get mobile_robot::ShareLocalInformationRequest :definition-)
      "int16 robot_id
int16 horizon
float32 x
float32 y
float32 theta
float32[] workspace
---
int16 next_horizon

")

(setf (get mobile_robot::ShareLocalInformationResponse :md5sum-) "1ee98618110ac3e0511341f8c0d6d3a0")
(setf (get mobile_robot::ShareLocalInformationResponse :datatype-) "mobile_robot/ShareLocalInformationResponse")
(setf (get mobile_robot::ShareLocalInformationResponse :definition-)
      "int16 robot_id
int16 horizon
float32 x
float32 y
float32 theta
float32[] workspace
---
int16 next_horizon

")



(provide :mobile_robot/ShareLocalInformation "1ee98618110ac3e0511341f8c0d6d3a0")


