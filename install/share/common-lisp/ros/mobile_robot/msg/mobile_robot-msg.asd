
(cl:in-package :asdf)

(defsystem "mobile_robot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "PlanInstance" :depends-on ("_package_PlanInstance"))
    (:file "_package_PlanInstance" :depends-on ("_package"))
  ))