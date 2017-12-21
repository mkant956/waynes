;; Auto-generated. Do not edit!


(when (boundp 'mobile_robot::PlanInstance)
  (if (not (find-package "MOBILE_ROBOT"))
    (make-package "MOBILE_ROBOT"))
  (shadow 'PlanInstance (find-package "MOBILE_ROBOT")))
(unless (find-package "MOBILE_ROBOT::PLANINSTANCE")
  (make-package "MOBILE_ROBOT::PLANINSTANCE"))

(in-package "ROS")
;;//! \htmlinclude PlanInstance.msg.html


(defclass mobile_robot::PlanInstance
  :super ros::object
  :slots (_robot_id _horizon_step _x _y _theta ))

(defmethod mobile_robot::PlanInstance
  (:init
   (&key
    ((:robot_id __robot_id) 0)
    ((:horizon_step __horizon_step) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _robot_id (round __robot_id))
   (setq _horizon_step (round __horizon_step))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:horizon_step
   (&optional __horizon_step)
   (if __horizon_step (setq _horizon_step __horizon_step)) _horizon_step)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; int16 _robot_id
    2
    ;; int16 _horizon_step
    2
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _robot_id
       (write-word _robot_id s)
     ;; int16 _horizon_step
       (write-word _horizon_step s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _robot_id
     (setq _robot_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _horizon_step
     (setq _horizon_step (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mobile_robot::PlanInstance :md5sum-) "96ac8a4684b342746e9a5d5c6e606a85")
(setf (get mobile_robot::PlanInstance :datatype-) "mobile_robot/PlanInstance")
(setf (get mobile_robot::PlanInstance :definition-)
      "int16 robot_id
int16 horizon_step
float32 x
float32 y
float32 theta


")



(provide :mobile_robot/PlanInstance "96ac8a4684b342746e9a5d5c6e606a85")


