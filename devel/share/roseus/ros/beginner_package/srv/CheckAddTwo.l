;; Auto-generated. Do not edit!


(when (boundp 'beginner_package::CheckAddTwo)
  (if (not (find-package "BEGINNER_PACKAGE"))
    (make-package "BEGINNER_PACKAGE"))
  (shadow 'CheckAddTwo (find-package "BEGINNER_PACKAGE")))
(unless (find-package "BEGINNER_PACKAGE::CHECKADDTWO")
  (make-package "BEGINNER_PACKAGE::CHECKADDTWO"))
(unless (find-package "BEGINNER_PACKAGE::CHECKADDTWOREQUEST")
  (make-package "BEGINNER_PACKAGE::CHECKADDTWOREQUEST"))
(unless (find-package "BEGINNER_PACKAGE::CHECKADDTWORESPONSE")
  (make-package "BEGINNER_PACKAGE::CHECKADDTWORESPONSE"))

(in-package "ROS")





(defclass beginner_package::CheckAddTwoRequest
  :super ros::object
  :slots (_x _y _n ))

(defmethod beginner_package::CheckAddTwoRequest
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

(defclass beginner_package::CheckAddTwoResponse
  :super ros::object
  :slots (_done ))

(defmethod beginner_package::CheckAddTwoResponse
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

(defclass beginner_package::CheckAddTwo
  :super ros::object
  :slots ())

(setf (get beginner_package::CheckAddTwo :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::CheckAddTwo :datatype-) "beginner_package/CheckAddTwo")
(setf (get beginner_package::CheckAddTwo :request) beginner_package::CheckAddTwoRequest)
(setf (get beginner_package::CheckAddTwo :response) beginner_package::CheckAddTwoResponse)

(defmethod beginner_package::CheckAddTwoRequest
  (:response () (instance beginner_package::CheckAddTwoResponse :init)))

(setf (get beginner_package::CheckAddTwoRequest :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::CheckAddTwoRequest :datatype-) "beginner_package/CheckAddTwoRequest")
(setf (get beginner_package::CheckAddTwoRequest :definition-)
      "int16 x
int16 y
int16 n
---
int64 done

")

(setf (get beginner_package::CheckAddTwoResponse :md5sum-) "670e8ca138898ad7e5338b42a76db5c8")
(setf (get beginner_package::CheckAddTwoResponse :datatype-) "beginner_package/CheckAddTwoResponse")
(setf (get beginner_package::CheckAddTwoResponse :definition-)
      "int16 x
int16 y
int16 n
---
int64 done

")



(provide :beginner_package/CheckAddTwo "670e8ca138898ad7e5338b42a76db5c8")


