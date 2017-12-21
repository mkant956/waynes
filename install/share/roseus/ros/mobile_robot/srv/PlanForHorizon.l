;; Auto-generated. Do not edit!


(when (boundp 'mobile_robot::PlanForHorizon)
  (if (not (find-package "MOBILE_ROBOT"))
    (make-package "MOBILE_ROBOT"))
  (shadow 'PlanForHorizon (find-package "MOBILE_ROBOT")))
(unless (find-package "MOBILE_ROBOT::PLANFORHORIZON")
  (make-package "MOBILE_ROBOT::PLANFORHORIZON"))
(unless (find-package "MOBILE_ROBOT::PLANFORHORIZONREQUEST")
  (make-package "MOBILE_ROBOT::PLANFORHORIZONREQUEST"))
(unless (find-package "MOBILE_ROBOT::PLANFORHORIZONRESPONSE")
  (make-package "MOBILE_ROBOT::PLANFORHORIZONRESPONSE"))

(in-package "ROS")





(defclass mobile_robot::PlanForHorizonRequest
  :super ros::object
  :slots (_total_robots _horizon_length _plans ))

(defmethod mobile_robot::PlanForHorizonRequest
  (:init
   (&key
    ((:total_robots __total_robots) 0)
    ((:horizon_length __horizon_length) 0)
    ((:plans __plans) (let (r) (dotimes (i 0) (push (instance mobile_robot::PlanInstance :init) r)) r))
    )
   (send-super :init)
   (setq _total_robots (round __total_robots))
   (setq _horizon_length (round __horizon_length))
   (setq _plans __plans)
   self)
  (:total_robots
   (&optional __total_robots)
   (if __total_robots (setq _total_robots __total_robots)) _total_robots)
  (:horizon_length
   (&optional __horizon_length)
   (if __horizon_length (setq _horizon_length __horizon_length)) _horizon_length)
  (:plans
   (&rest __plans)
   (if (keywordp (car __plans))
       (send* _plans __plans)
     (progn
       (if __plans (setq _plans (car __plans)))
       _plans)))
  (:serialization-length
   ()
   (+
    ;; int16 _total_robots
    2
    ;; int16 _horizon_length
    2
    ;; mobile_robot/PlanInstance[] _plans
    (apply #'+ (send-all _plans :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _total_robots
       (write-word _total_robots s)
     ;; int16 _horizon_length
       (write-word _horizon_length s)
     ;; mobile_robot/PlanInstance[] _plans
     (write-long (length _plans) s)
     (dolist (elem _plans)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _total_robots
     (setq _total_robots (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _horizon_length
     (setq _horizon_length (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; mobile_robot/PlanInstance[] _plans
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plans (let (r) (dotimes (i n) (push (instance mobile_robot::PlanInstance :init) r)) r))
     (dolist (elem- _plans)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass mobile_robot::PlanForHorizonResponse
  :super ros::object
  :slots (_next_horizon ))

(defmethod mobile_robot::PlanForHorizonResponse
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

(defclass mobile_robot::PlanForHorizon
  :super ros::object
  :slots ())

(setf (get mobile_robot::PlanForHorizon :md5sum-) "6087eeac782002dae0e0d755723c10aa")
(setf (get mobile_robot::PlanForHorizon :datatype-) "mobile_robot/PlanForHorizon")
(setf (get mobile_robot::PlanForHorizon :request) mobile_robot::PlanForHorizonRequest)
(setf (get mobile_robot::PlanForHorizon :response) mobile_robot::PlanForHorizonResponse)

(defmethod mobile_robot::PlanForHorizonRequest
  (:response () (instance mobile_robot::PlanForHorizonResponse :init)))

(setf (get mobile_robot::PlanForHorizonRequest :md5sum-) "6087eeac782002dae0e0d755723c10aa")
(setf (get mobile_robot::PlanForHorizonRequest :datatype-) "mobile_robot/PlanForHorizonRequest")
(setf (get mobile_robot::PlanForHorizonRequest :definition-)
      "int16 total_robots
int16 horizon_length
PlanInstance[] plans

================================================================================
MSG: mobile_robot/PlanInstance
int16 robot_id
int16 horizon_step
float32 x
float32 y
float32 theta

---
int16 next_horizon

")

(setf (get mobile_robot::PlanForHorizonResponse :md5sum-) "6087eeac782002dae0e0d755723c10aa")
(setf (get mobile_robot::PlanForHorizonResponse :datatype-) "mobile_robot/PlanForHorizonResponse")
(setf (get mobile_robot::PlanForHorizonResponse :definition-)
      "int16 total_robots
int16 horizon_length
PlanInstance[] plans

================================================================================
MSG: mobile_robot/PlanInstance
int16 robot_id
int16 horizon_step
float32 x
float32 y
float32 theta

---
int16 next_horizon

")



(provide :mobile_robot/PlanForHorizon "6087eeac782002dae0e0d755723c10aa")


