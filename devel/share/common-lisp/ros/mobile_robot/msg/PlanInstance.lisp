; Auto-generated. Do not edit!


(cl:in-package mobile_robot-msg)


;//! \htmlinclude PlanInstance.msg.html

(cl:defclass <PlanInstance> (roslisp-msg-protocol:ros-message)
  ((robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:fixnum
    :initform 0)
   (horizon_step
    :reader horizon_step
    :initarg :horizon_step
    :type cl:fixnum
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass PlanInstance (<PlanInstance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanInstance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanInstance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-msg:<PlanInstance> is deprecated: use mobile_robot-msg:PlanInstance instead.")))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <PlanInstance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-msg:robot_id-val is deprecated.  Use mobile_robot-msg:robot_id instead.")
  (robot_id m))

(cl:ensure-generic-function 'horizon_step-val :lambda-list '(m))
(cl:defmethod horizon_step-val ((m <PlanInstance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-msg:horizon_step-val is deprecated.  Use mobile_robot-msg:horizon_step instead.")
  (horizon_step m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PlanInstance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-msg:x-val is deprecated.  Use mobile_robot-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PlanInstance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-msg:y-val is deprecated.  Use mobile_robot-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <PlanInstance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-msg:theta-val is deprecated.  Use mobile_robot-msg:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanInstance>) ostream)
  "Serializes a message object of type '<PlanInstance>"
  (cl:let* ((signed (cl:slot-value msg 'robot_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'horizon_step)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanInstance>) istream)
  "Deserializes a message object of type '<PlanInstance>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'horizon_step) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanInstance>)))
  "Returns string type for a message object of type '<PlanInstance>"
  "mobile_robot/PlanInstance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanInstance)))
  "Returns string type for a message object of type 'PlanInstance"
  "mobile_robot/PlanInstance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanInstance>)))
  "Returns md5sum for a message object of type '<PlanInstance>"
  "96ac8a4684b342746e9a5d5c6e606a85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanInstance)))
  "Returns md5sum for a message object of type 'PlanInstance"
  "96ac8a4684b342746e9a5d5c6e606a85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanInstance>)))
  "Returns full string definition for message of type '<PlanInstance>"
  (cl:format cl:nil "int16 robot_id~%int16 horizon_step~%float32 x~%float32 y~%float32 theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanInstance)))
  "Returns full string definition for message of type 'PlanInstance"
  (cl:format cl:nil "int16 robot_id~%int16 horizon_step~%float32 x~%float32 y~%float32 theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanInstance>))
  (cl:+ 0
     2
     2
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanInstance>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanInstance
    (cl:cons ':robot_id (robot_id msg))
    (cl:cons ':horizon_step (horizon_step msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
))
