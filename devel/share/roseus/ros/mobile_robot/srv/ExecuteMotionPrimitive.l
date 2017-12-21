;; Auto-generated. Do not edit!


(when (boundp 'mobile_robot::ExecuteMotionPrimitive)
  (if (not (find-package "MOBILE_ROBOT"))
    (make-package "MOBILE_ROBOT"))
  (shadow 'ExecuteMotionPrimitive (find-package "MOBILE_ROBOT")))
(unless (find-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVE")
  (make-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVE"))
(unless (find-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVEREQUEST")
  (make-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVEREQUEST"))
(unless (find-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVERESPONSE")
  (make-package "MOBILE_ROBOT::EXECUTEMOTIONPRIMITIVERESPONSE"))

(in-package "ROS")





(defclass mobile_robot::ExecuteMotionPrimitiveRequest
  :super ros::object
  :slots (_x _y _n ))

(defmethod mobile_robot::ExecuteMotionPrimitiveRequest
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
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; int64 _n
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;; int64 _n
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _n (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _n) (= (length (_n . bv)) 2)) ;; bignum
              (write-long (ash (elt (_n . bv) 0) 0) s)
              (write-long (ash (elt (_n . bv) 1) -1) s))
             ((and (class _n) (= (length (_n . bv)) 1)) ;; big1
              (write-long (elt (_n . bv) 0) s)
              (write-long (if (>= _n 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _n s)(write-long (if (>= _n 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _n
#+(or :alpha :irix6 :x86_64)
      (setf _n (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _n (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass mobile_robot::ExecuteMotionPrimitiveResponse
  :super ros::object
  :slots (_done ))

(defmethod mobile_robot::ExecuteMotionPrimitiveResponse
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

(defclass mobile_robot::ExecuteMotionPrimitive
  :super ros::object
  :slots ())

(setf (get mobile_robot::ExecuteMotionPrimitive :md5sum-) "68a20426c883aaf1dc5948a790ae4bc0")
(setf (get mobile_robot::ExecuteMotionPrimitive :datatype-) "mobile_robot/ExecuteMotionPrimitive")
(setf (get mobile_robot::ExecuteMotionPrimitive :request) mobile_robot::ExecuteMotionPrimitiveRequest)
(setf (get mobile_robot::ExecuteMotionPrimitive :response) mobile_robot::ExecuteMotionPrimitiveResponse)

(defmethod mobile_robot::ExecuteMotionPrimitiveRequest
  (:response () (instance mobile_robot::ExecuteMotionPrimitiveResponse :init)))

(setf (get mobile_robot::ExecuteMotionPrimitiveRequest :md5sum-) "68a20426c883aaf1dc5948a790ae4bc0")
(setf (get mobile_robot::ExecuteMotionPrimitiveRequest :datatype-) "mobile_robot/ExecuteMotionPrimitiveRequest")
(setf (get mobile_robot::ExecuteMotionPrimitiveRequest :definition-)
      "int64 x
int64 y
int64 n
---
int64 done

")

(setf (get mobile_robot::ExecuteMotionPrimitiveResponse :md5sum-) "68a20426c883aaf1dc5948a790ae4bc0")
(setf (get mobile_robot::ExecuteMotionPrimitiveResponse :datatype-) "mobile_robot/ExecuteMotionPrimitiveResponse")
(setf (get mobile_robot::ExecuteMotionPrimitiveResponse :definition-)
      "int64 x
int64 y
int64 n
---
int64 done

")



(provide :mobile_robot/ExecuteMotionPrimitive "68a20426c883aaf1dc5948a790ae4bc0")


