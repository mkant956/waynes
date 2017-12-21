;; Auto-generated. Do not edit!


(when (boundp 'beginner_package::AddTwoInts)
  (if (not (find-package "BEGINNER_PACKAGE"))
    (make-package "BEGINNER_PACKAGE"))
  (shadow 'AddTwoInts (find-package "BEGINNER_PACKAGE")))
(unless (find-package "BEGINNER_PACKAGE::ADDTWOINTS")
  (make-package "BEGINNER_PACKAGE::ADDTWOINTS"))
(unless (find-package "BEGINNER_PACKAGE::ADDTWOINTSREQUEST")
  (make-package "BEGINNER_PACKAGE::ADDTWOINTSREQUEST"))
(unless (find-package "BEGINNER_PACKAGE::ADDTWOINTSRESPONSE")
  (make-package "BEGINNER_PACKAGE::ADDTWOINTSRESPONSE"))

(in-package "ROS")





(defclass beginner_package::AddTwoIntsRequest
  :super ros::object
  :slots (_x _y _n ))

(defmethod beginner_package::AddTwoIntsRequest
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:n __n) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _n (round __n))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:n
   (&optional __n)
   (if __n (setq _n __n)) _n)
  (:serialization-length
   ()
   (+
    ;; int16 _x
    2
    ;; int16 _y
    2
    ;; int16 _n
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _x
       (write-word _x s)
     ;; int16 _y
       (write-word _y s)
     ;; int16 _n
       (write-word _n s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _x
     (setq _x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _y
     (setq _y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _n
     (setq _n (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass beginner_package::AddTwoIntsResponse
  :super ros::object
  :slots (_done ))

(defmethod beginner_package::AddTwoIntsResponse
  (:init
   (&key
    ((:done __done) 0)
    )
   (send-super :init)
   (setq _done (round __done))
   self)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:serialization-length
   ()
   (+
    ;; int64 _done
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _done
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _done (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _done) (= (length (_done . bv)) 2)) ;; bignum
              (write-long (ash (elt (_done . bv) 0) 0) s)
              (write-long (ash (elt (_done . bv) 1) -1) s))
             ((and (class _done) (= (length (_done . bv)) 1)) ;; big1
              (write-long (elt (_done . bv) 0) s)
              (write-long (if (>= _done 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _done s)(write-long (if (>= _done 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _done
#+(or :alpha :irix6 :x86_64)
      (setf _done (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _done (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass beginner_package::AddTwoInts
  :super ros::object
  :slots ())

(setf (get beginner_package::AddTwoInts :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::AddTwoInts :datatype-) "beginner_package/AddTwoInts")
(setf (get beginner_package::AddTwoInts :request) beginner_package::AddTwoIntsRequest)
(setf (get beginner_package::AddTwoInts :response) beginner_package::AddTwoIntsResponse)

(defmethod beginner_package::AddTwoIntsRequest
  (:response () (instance beginner_package::AddTwoIntsResponse :init)))

(setf (get beginner_package::AddTwoIntsRequest :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::AddTwoIntsRequest :datatype-) "beginner_package/AddTwoIntsRequest")
(setf (get beginner_package::AddTwoIntsRequest :definition-)
      "int16 x
int16 y
int16 n
---
int64 done

")

(setf (get beginner_package::AddTwoIntsResponse :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::AddTwoIntsResponse :datatype-) "beginner_package/AddTwoIntsResponse")
(setf (get beginner_package::AddTwoIntsResponse :definition-)
      "int16 x
int16 y
int16 n
---
int64 done

")



(provide :beginner_package/AddTwoInts "670e8ca138898ad7e5338b42a76db5c8")


