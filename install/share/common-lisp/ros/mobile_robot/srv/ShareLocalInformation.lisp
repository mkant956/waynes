; Auto-generated. Do not edit!


(cl:in-package mobile_robot-srv)


;//! \htmlinclude ShareLocalInformation-request.msg.html

(cl:defclass <ShareLocalInformation-request> (roslisp-msg-protocol:ros-message)
  ((robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:fixnum
    :initform 0)
   (horizon
    :reader horizon
    :initarg :horizon
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
    :initform 0.0)
   (workspace
    :reader workspace
    :initarg :workspace
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ShareLocalInformation-request (<ShareLocalInformation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShareLocalInformation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShareLocalInformation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<ShareLocalInformation-request> is deprecated: use mobile_robot-srv:ShareLocalInformation-request instead.")))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:robot_id-val is deprecated.  Use mobile_robot-srv:robot_id instead.")
  (robot_id m))

(cl:ensure-generic-function 'horizon-val :lambda-list '(m))
(cl:defmethod horizon-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:horizon-val is deprecated.  Use mobile_robot-srv:horizon instead.")
  (horizon m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:x-val is deprecated.  Use mobile_robot-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:y-val is deprecated.  Use mobile_robot-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:theta-val is deprecated.  Use mobile_robot-srv:theta instead.")
  (theta m))

(cl:ensure-generic-function 'workspace-val :lambda-list '(m))
(cl:defmethod workspace-val ((m <ShareLocalInformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:workspace-val is deprecated.  Use mobile_robot-srv:workspace instead.")
  (workspace m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShareLocalInformation-request>) ostream)
  "Serializes a message object of type '<ShareLocalInformation-request>"
  (cl:let* ((signed (cl:slot-value msg 'robot_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'horizon)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'workspace))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'workspace))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShareLocalInformation-request>) istream)
  "Deserializes a message object of type '<ShareLocalInformation-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'horizon) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'workspace) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'workspace)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShareLocalInformation-request>)))
  "Returns string type for a service object of type '<ShareLocalInformation-request>"
  "mobile_robot/ShareLocalInformationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShareLocalInformation-request)))
  "Returns string type for a service object of type 'ShareLocalInformation-request"
  "mobile_robot/ShareLocalInformationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShareLocalInformation-request>)))
  "Returns md5sum for a message object of type '<ShareLocalInformation-request>"
  "1ee98618110ac3e0511341f8c0d6d3a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShareLocalInformation-request)))
  "Returns md5sum for a message object of type 'ShareLocalInformation-request"
  "1ee98618110ac3e0511341f8c0d6d3a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShareLocalInformation-request>)))
  "Returns full string definition for message of type '<ShareLocalInformation-request>"
  (cl:format cl:nil "int16 robot_id~%int16 horizon~%float32 x~%float32 y~%float32 theta~%float32[] workspace~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShareLocalInformation-request)))
  "Returns full string definition for message of type 'ShareLocalInformation-request"
  (cl:format cl:nil "int16 robot_id~%int16 horizon~%float32 x~%float32 y~%float32 theta~%float32[] workspace~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShareLocalInformation-request>))
  (cl:+ 0
     2
     2
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'workspace) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShareLocalInformation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ShareLocalInformation-request
    (cl:cons ':robot_id (robot_id msg))
    (cl:cons ':horizon (horizon msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':workspace (workspace msg))
))
;//! \htmlinclude ShareLocalInformation-response.msg.html

(cl:defclass <ShareLocalInformation-response> (roslisp-msg-protocol:ros-message)
  ((next_horizon
    :reader next_horizon
    :initarg :next_horizon
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ShareLocalInformation-response (<ShareLocalInformation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShareLocalInformation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShareLocalInformation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobile_robot-srv:<ShareLocalInformation-response> is deprecated: use mobile_robot-srv:ShareLocalInformation-response instead.")))

(cl:ensure-generic-function 'next_horizon-val :lambda-list '(m))
(cl:defmethod next_horizon-val ((m <ShareLocalInformation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobile_robot-srv:next_horizon-val is deprecated.  Use mobile_robot-srv:next_horizon instead.")
  (next_horizon m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShareLocalInformation-response>) ostream)
  "Serializes a message object of type '<ShareLocalInformation-response>"
  (cl:let* ((signed (cl:slot-value msg 'next_horizon)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShareLocalInformation-response>) istream)
  "Deserializes a message object of type '<ShareLocalInformation-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'next_horizon) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShareLocalInformation-response>)))
  "Returns string type for a service object of type '<ShareLocalInformation-response>"
  "mobile_robot/ShareLocalInformationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShareLocalInformation-response)))
  "Returns string type for a service object of type 'ShareLocalInformation-response"
  "mobile_robot/ShareLocalInformationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShareLocalInformation-response>)))
  "Returns md5sum for a message object of type '<ShareLocalInformation-response>"
  "1ee98618110ac3e0511341f8c0d6d3a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShareLocalInformation-response)))
  "Returns md5sum for a message object of type 'ShareLocalInformation-response"
  "1ee98618110ac3e0511341f8c0d6d3a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShareLocalInformation-response>)))
  "Returns full string definition for message of type '<ShareLocalInformation-response>"
  (cl:format cl:nil "int16 next_horizon~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShareLocalInformation-response)))
  "Returns full string definition for message of type 'ShareLocalInformation-response"
  (cl:format cl:nil "int16 next_horizon~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShareLocalInformation-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShareLocalInformation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ShareLocalInformation-response
    (cl:cons ':next_horizon (next_horizon msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ShareLocalInformation)))
  'ShareLocalInformation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ShareLocalInformation)))
  'ShareLocalInformation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShareLocalInformation)))
  "Returns string type for a service object of type '<ShareLocalInformation>"
  "mobile_robot/ShareLocalInformation")