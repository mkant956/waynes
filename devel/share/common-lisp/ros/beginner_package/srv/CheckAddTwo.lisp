; Auto-generated. Do not edit!


(cl:in-package beginner_package-srv)


;//! \htmlinclude CheckAddTwo-request.msg.html

(cl:defclass <CheckAddTwo-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0)
   (n
    :reader n
    :initarg :n
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CheckAddTwo-request (<CheckAddTwo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckAddTwo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckAddTwo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_package-srv:<CheckAddTwo-request> is deprecated: use beginner_package-srv:CheckAddTwo-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <CheckAddTwo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_package-srv:x-val is deprecated.  Use beginner_package-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <CheckAddTwo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_package-srv:y-val is deprecated.  Use beginner_package-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'n-val :lambda-list '(m))
(cl:defmethod n-val ((m <CheckAddTwo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_package-srv:n-val is deprecated.  Use beginner_package-srv:n instead.")
  (n m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckAddTwo-request>) ostream)
  "Serializes a message object of type '<CheckAddTwo-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'n)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckAddTwo-request>) istream)
  "Deserializes a message object of type '<CheckAddTwo-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckAddTwo-request>)))
  "Returns string type for a service object of type '<CheckAddTwo-request>"
  "beginner_package/CheckAddTwoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckAddTwo-request)))
  "Returns string type for a service object of type 'CheckAddTwo-request"
  "beginner_package/CheckAddTwoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckAddTwo-request>)))
  "Returns md5sum for a message object of type '<CheckAddTwo-request>"
  "670e8ca138898ad7e5338b42a76db5c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckAddTwo-request)))
  "Returns md5sum for a message object of type 'CheckAddTwo-request"
  "670e8ca138898ad7e5338b42a76db5c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckAddTwo-request>)))
  "Returns full string definition for message of type '<CheckAddTwo-request>"
  (cl:format cl:nil "int16 x~%int16 y~%int16 n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckAddTwo-request)))
  "Returns full string definition for message of type 'CheckAddTwo-request"
  (cl:format cl:nil "int16 x~%int16 y~%int16 n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckAddTwo-request>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckAddTwo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckAddTwo-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':n (n msg))
))
;//! \htmlinclude CheckAddTwo-response.msg.html

(cl:defclass <CheckAddTwo-response> (roslisp-msg-protocol:ros-message)
  ((done
    :reader done
    :initarg :done
    :type cl:integer
    :initform 0))
)

(cl:defclass CheckAddTwo-response (<CheckAddTwo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckAddTwo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckAddTwo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_package-srv:<CheckAddTwo-response> is deprecated: use beginner_package-srv:CheckAddTwo-response instead.")))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <CheckAddTwo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_package-srv:done-val is deprecated.  Use beginner_package-srv:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckAddTwo-response>) ostream)
  "Serializes a message object of type '<CheckAddTwo-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckAddTwo-response>) istream)
  "Deserializes a message object of type '<CheckAddTwo-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckAddTwo-response>)))
  "Returns string type for a service object of type '<CheckAddTwo-response>"
  "beginner_package/CheckAddTwoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckAddTwo-response)))
  "Returns string type for a service object of type 'CheckAddTwo-response"
  "beginner_package/CheckAddTwoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckAddTwo-response>)))
  "Returns md5sum for a message object of type '<CheckAddTwo-response>"
  "670e8ca138898ad7e5338b42a76db5c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckAddTwo-response)))
  "Returns md5sum for a message object of type 'CheckAddTwo-response"
  "670e8ca138898ad7e5338b42a76db5c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckAddTwo-response>)))
  "Returns full string definition for message of type '<CheckAddTwo-response>"
  (cl:format cl:nil "int64 done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckAddTwo-response)))
  "Returns full string definition for message of type 'CheckAddTwo-response"
  (cl:format cl:nil "int64 done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckAddTwo-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckAddTwo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckAddTwo-response
    (cl:cons ':done (done msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckAddTwo)))
  'CheckAddTwo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckAddTwo)))
  'CheckAddTwo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckAddTwo)))
  "Returns string type for a service object of type '<CheckAddTwo>"
  "beginner_package/CheckAddTwo")