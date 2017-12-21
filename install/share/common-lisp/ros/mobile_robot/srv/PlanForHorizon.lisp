; Auto-generated. Do not edit!


(cl:in-package mobile_robot-srv)


;//! \htmlinclude PlanForHorizon-request.msg.html

(cl:defclass <PlanForHorizon-request> (roslisp-msg-protocol:ros-message)
  ((total_robots
    :reader total_robots
    :initarg :total_robots
    :type cl:fixnum
    :initform 0)
   (horizon_length
    :reader horizon_length
    :initarg :horizon_length
    :type cl:fixnum
    :initform 0)
   (plans
    :reader plans
    :initarg :plans
    :type (cl:vector mobile_robot-msg:PlanInstance)
   :initform (cl:make-array 0 :element-type 'mobile_robot-msg:PlanInstance :initial-element (cl:make-instance 'mobile_robot-msg:PlanInstance))))
)

(cl:defclass PlanForHorizon-request (<PlanForHorizon-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanForHorizon-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanForHorizon-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<PlanForHorizon-request> is deprecated: use mobile_robot-srv:PlanForHorizon-request instead.")))

(cl:ensure-generic-function 'total_robots-val :lambda-list '(m))
(cl:defmethod total_robots-val ((m <PlanForHorizon-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:total_robots-val is deprecated.  Use mobile_robot-srv:total_robots instead.")
  (total_robots m))

(cl:ensure-generic-function 'horizon_length-val :lambda-list '(m))
(cl:defmethod horizon_length-val ((m <PlanForHorizon-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:horizon_length-val is deprecated.  Use mobile_robot-srv:horizon_length instead.")
  (horizon_length m))

(cl:ensure-generic-function 'plans-val :lambda-list '(m))
(cl:defmethod plans-val ((m <PlanForHorizon-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:plans-val is deprecated.  Use mobile_robot-srv:plans instead.")
  (plans m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanForHorizon-request>) ostream)
  "Serializes a message object of type '<PlanForHorizon-request>"
  (cl:let* ((signed (cl:slot-value msg 'total_robots)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'horizon_length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plans))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'plans))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanForHorizon-request>) istream)
  "Deserializes a message object of type '<PlanForHorizon-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'total_robots) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'horizon_length) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plans) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plans)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mobile_robot-msg:PlanInstance))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanForHorizon-request>)))
  "Returns string type for a service object of type '<PlanForHorizon-request>"
  "mobile_robot/PlanForHorizonRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanForHorizon-request)))
  "Returns string type for a service object of type 'PlanForHorizon-request"
  "mobile_robot/PlanForHorizonRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanForHorizon-request>)))
  "Returns md5sum for a message object of type '<PlanForHorizon-request>"
  "6087eeac782002dae0e0d755723c10aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanForHorizon-request)))
  "Returns md5sum for a message object of type 'PlanForHorizon-request"
  "6087eeac782002dae0e0d755723c10aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanForHorizon-request>)))
  "Returns full string definition for message of type '<PlanForHorizon-request>"
  (cl:format cl:nil "int16 total_robots~%int16 horizon_length~%PlanInstance[] plans~%~%================================================================================~%MSG: mobile_robot/PlanInstance~%int16 robot_id~%int16 horizon_step~%float32 x~%float32 y~%float32 theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanForHorizon-request)))
  "Returns full string definition for message of type 'PlanForHorizon-request"
  (cl:format cl:nil "int16 total_robots~%int16 horizon_length~%PlanInstance[] plans~%~%================================================================================~%MSG: mobile_robot/PlanInstance~%int16 robot_id~%int16 horizon_step~%float32 x~%float32 y~%float32 theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanForHorizon-request>))
  (cl:+ 0
     2
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plans) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanForHorizon-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanForHorizon-request
    (cl:cons ':total_robots (total_robots msg))
    (cl:cons ':horizon_length (horizon_length msg))
    (cl:cons ':plans (plans msg))
))
;//! \htmlinclude PlanForHorizon-response.msg.html

(cl:defclass <PlanForHorizon-response> (roslisp-msg-protocol:ros-message)
  ((next_horizon
    :reader next_horizon
    :initarg :next_horizon
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PlanForHorizon-response (<PlanForHorizon-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanForHorizon-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanForHorizon-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<PlanForHorizon-response> is deprecated: use mobile_robot-srv:PlanForHorizon-response instead.")))

(cl:ensure-generic-function 'next_horizon-val :lambda-list '(m))
(cl:defmethod next_horizon-val ((m <PlanForHorizon-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:next_horizon-val is deprecated.  Use mobile_robot-srv:next_horizon instead.")
  (next_horizon m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanForHorizon-response>) ostream)
  "Serializes a message object of type '<PlanForHorizon-response>"
  (cl:let* ((signed (cl:slot-value msg 'next_horizon)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanForHorizon-response>) istream)
  "Deserializes a message object of type '<PlanForHorizon-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'next_horizon) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanForHorizon-response>)))
  "Returns string type for a service object of type '<PlanForHorizon-response>"
  "mobile_robot/PlanForHorizonResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanForHorizon-response)))
  "Returns string type for a service object of type 'PlanForHorizon-response"
  "mobile_robot/PlanForHorizonResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanForHorizon-response>)))
  "Returns md5sum for a message object of type '<PlanForHorizon-response>"
  "6087eeac782002dae0e0d755723c10aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanForHorizon-response)))
  "Returns md5sum for a message object of type 'PlanForHorizon-response"
  "6087eeac782002dae0e0d755723c10aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanForHorizon-response>)))
  "Returns full string definition for message of type '<PlanForHorizon-response>"
  (cl:format cl:nil "int16 next_horizon~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanForHorizon-response)))
  "Returns full string definition for message of type 'PlanForHorizon-response"
  (cl:format cl:nil "int16 next_horizon~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanForHorizon-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanForHorizon-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanForHorizon-response
    (cl:cons ':next_horizon (next_horizon msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PlanForHorizon)))
  'PlanForHorizon-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PlanForHorizon)))
  'PlanForHorizon-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanForHorizon)))
  "Returns string type for a service object of type '<PlanForHorizon>"
  "mobile_robot/PlanForHorizon")