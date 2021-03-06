
(in-package :cl-rlimit)

;; (print rlimit-type)


(cffi:defcfun (%getrlimit "getrlimit") :int
  (resource :int)
  (rlimit :pointer))

(cffi:defcfun (%setrlimit "setrlimit") :int
  (resource :int)
  (rlimit :pointer))

(defun rlimit (resource)
  (with-foreign-object (rlimit '(:struct rlimit))
    (case (%getrlimit resource rlimit)
      (+efault+ :efault)
      (+einval+ :einval)
      (+eperm+ :eperm)
      (+esrch+ :esrch)
      (t
       (with-foreign-slots ((max current) rlimit (:struct rlimit))
         (values (if (= current +rlim-infinity+)
                     :infinity
                     current)
                 (if (= max +rlim-infinity+)
                     :infinity
                     max)))))))

(defun set-rlimit (resource size)
  (with-foreign-object (rlimit '(:struct rlimit))
    (case (%getrlimit resource rlimit)
      (+efault+ :efault)
      (+einval+ :einval)
      (+eperm+ :eperm)
      (+esrch+ :esrch)
      (t
       (with-foreign-slots ((current) rlimit (:struct rlimit))
         (setf current size))
       (case (%setrlimit resource rlimit)
         (+efault+ :efault)
         (+einval+ :einval)
         (+eperm+ :eperm)
         (+esrch+ :esrch)
         (t size))))))

(defsetf rlimit set-rlimit)
