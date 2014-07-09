
(in-package :cl-rlimit)

;; (print rlimit-type)


(cffi:defcfun (%getrlimit "getrlimit") :int
  (resource :int)
  (rlimit :pointer))

(cffi:defcfun (%setrlimit "setrlimit") :int
  (resource :int)
  (rlimit :pointer))

(defun getrlimit (resource)
  (with-foreign-object (rlimit '(:struct rlimit))
    (case (%getrlimit resource rlimit)
      (+efault+ :efault)
      (+einval+ :einval)
      (+eperm+ :eperm)
      (+esrch+ :esrch)
      (t (convert-from-foreign rlimit '(:struct rlimit))))))

(defun setrlimit (resource size)
  (with-foreign-object (rlimit '(:struct rlimit))
    (case (%getrlimit resource rlimit)
      (+efault+ :efault)
      (+einval+ :einval)
      (+eperm+ :eperm)
      (+esrch+ :esrch)
      (t
       (with-foreign-slots ((current) rlimit (:struct rlimit))
         (assert (> current size) nil
                 "You can't extend the current allocation! current: ~a specified: ~a"
                 current size)
         (setf current size))
       (case (%setrlimit resource rlimit)
         (+efault+ :efault)
         (+einval+ :einval)
         (+eperm+ :eperm)
         (+esrch+ :esrch)
         (t
          (convert-from-foreign rlimit '(:struct rlimit))))))))
