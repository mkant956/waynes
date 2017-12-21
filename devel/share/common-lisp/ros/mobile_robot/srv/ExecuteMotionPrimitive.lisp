; Auto-generated. Do not edit!


(cl:in-package mobile_robot-srv)


;//! \htmlinclude ExecuteMotionPrimitive-request.msg.html

(cl:defclass <ExecuteMotionPrimitive-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (n
    :reader n
    :initarg :n
    :type cl:integer
    :initform 0))
)

(cl:defclass ExecuteMotionPrimitive-request (<ExecuteMotionPrimitive-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteMotionPrimitive-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteMotionPrimitive-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<ExecuteMotionPrimitive-request> is deprecated: use mobile_robot-srv:ExecuteMotionPrimitive-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ExecuteMotionPrimitive-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:x-val is deprecated.  Use mobile_robot-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ExecuteMotionPrimitive-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:y-val is deprecated.  Use mobile_robot-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'n-val :lambda-list '(m))
(cl:defmethod n-val ((m <ExecuteMotionPrimitive-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:n-val is deprecated.  Use mobile_robot-srv:n instead.")
  (n m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteMotionPrimitive-request>) ostream)
  "Serializes a message object of type '<ExecuteMotionPrimitive-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'n)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteMotionPrimitive-request>) istream)
  "Deserializes a message object of type '<ExecuteMotionPrimitive-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteMotionPrimitive-request>)))
  "Returns string type for a service object of type '<ExecuteMotionPrimitive-request>"
  "mobile_robot/ExecuteMotionPrimitiveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteMotionPrimitive-request)))
  "Returns string type for a service object of type 'ExecuteMotionPrimitive-request"
  "mobile_robot/ExecuteMotionPrimitiveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteMotionPrimitive-request>)))
  "Returns md5sum for a message object of type '<ExecuteMotionPrimitive-request>"
  "68a20426c883aaf1dc5948a790ae4bc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteMotionPrimitive-request)))
  "Returns md5sum for a message object of type 'ExecuteMotionPrimitive-request"
  "68a20426c883aaf1dc5948a790ae4bc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteMotionPrimitive-request>)))
  "Returns full string definition for message of type '<ExecuteMotionPrimitive-request>"
  (cl:format cl:nil "int64 x~%int64 y~%int64 n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteMotionPrimitive-request)))
  "Returns full string definition for message of type 'ExecuteMotionPrimitive-request"
  (cl:format cl:nil "int64 x~%int64 y~%int64 n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteMotionPrimitive-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteMotionPrimitive-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteMotionPrimitive-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':n (n msg))
))
;//! \htmlinclude ExecuteMotionPrimitive-response.msg.html

(cl:defclass <ExecuteMotionPrimitive-response> (roslisp-msg-protocol:ros-message)
  ((done
    :reader done
    :initarg :done
    :type cl:integer
    :initform 0))
)

(cl:defclass ExecuteMotionPrimitive-response (<ExecuteMotionPrimitive-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteMotionPrimitive-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteMotionPrimitive-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<ExecuteMotionPrimitive-response> is deprecated: use mobile_robot-srv:ExecuteMotionPrimitive-response instead.")))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <ExecuteMotionPrimitive-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:done-val is deprecated.  Use mobile_robot-srv:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteMotionPrimitive-response>) ostream)
  "Serializes a message object of type '<ExecuteMotionPrimitive-response>"
  (cl:let* ((signed (cl:slot-value msg 'done)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteMotionPrimitive-response>) istream)
  "Deserializes a message object of type '<ExecuteMotionPrimitive-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'done) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteMotionPrimitive-response>)))
  "Returns string type for a service object of type '<ExecuteMotionPrimitive-response>"
  "mobile_robot/ExecuteMotionPrimitiveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteMotionPrimitive-response)))
  "Returns string type for a service object of type 'ExecuteMotionPrimitive-response"
  "mobile_robot/ExecuteMotionPrimitiveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteMotionPrimitive-response>)))
  "Returns md5sum for a message object of type '<ExecuteMotionPrimitive-response>"
  "68a20426c883aaf1dc5948a790ae4bc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteMotionPrimitive-response)))
  "Returns md5sum for a message object of type 'ExecuteMotionPrimitive-response"
  "68a20426c883aaf1dc5948a790ae4bc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteMotionPrimitive-response>)))
  "Returns full string definition for message of type '<ExecuteMotionPrimitive-response>"
  (cl:format cl:nil "int64 done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteMotionPrimitive-response)))
  "Returns full string definition for message of type 'ExecuteMotionPrimitive-response"
  (cl:format cl:nil "int64 done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteMotionPrimitive-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteMotionPrimitive-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteMotionPrimitive-response
    (cl:cons ':done (done msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecuteMotionPrimitive)))
  'ExecuteMotionPrimitive-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecuteMotionPrimitive)))
  'ExecuteMotionPrimitive-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteMotionPrimitive)))
  "Returns string type for a service object of type '<ExecuteMotionPrimitive>"
  "mobile_robot/ExecuteMotionPrimitive")