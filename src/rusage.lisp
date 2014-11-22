
(in-package :cl-rlimit)

(cffi:defcfun (%getrusage "getrusage") :int
  (who :int)
  (rusage :pointer))

(cffi:defcfun (%setrusage "setrusage") :int
  (who :int)
  (rusage :pointer))

;; (cstruct rusage "struct rusage"
;;    (utime "ru_utime" :type (:struct timeval))
;;    (stime "ru_stime" :type (:struct timeval))
;;    (maxrss "ru_maxrss" :type :long)
;;    (ixrss "ru_ixrss" :type :long)
;;    (idrss "ru_idrss" :type :long)
;;    (isrss "ru_isrss" :type :long)
;;    (minflt "ru_minflt" :type :long)
;;    (majflt "ru_majflt" :type :long)
;;    (nswap "ru_nswap" :type :long)
;;    (inblock "ru_inblock" :type :long)
;;    (oublock "ru_oublock" :type :long)
;;    (msgsnd "ru_msgsnd" :type :long)
;;    (msgrcv "ru_msgrcv" :type :long)
;;    (nsignals "ru_nsignals" :type :long)
;;    (nvcsw "ru_nvcsw" :type :long)
;;    (nivcsw "ru_nivcsw" :type :long))

;; (cstruct timeval "struct timeval"
;;    (sec "tv_sec" :type :long)
;;    (usec "tv_usec" :type :long))


;;       struct timeval {
;;               time_t          tv_sec;
;;               suseconds_t     tv_usec;
;;       };

;; The tv_sec member represents the elapsed time, in whole seconds.
;; The tv_usec member captures rest of the elapsed time, represented
;; as the number of microseconds.

(defstruct rusage
  (utime 0 :type integer)
  (stime 0 :type integer)
  (maxrss 0 :type integer)
  (ixrss 0 :type integer)    ;x on linux
  (idrss 0 :type integer)    ;x on linux
  (isrss 0 :type integer)    ;x on linux
  (minflt 0 :type integer)
  (majflt 0 :type integer)
  (nswap 0 :type integer)    ;x on linux
  (inblock 0 :type integer)
  (oublock 0 :type integer)
  (msgsnd 0 :type integer)   ;x on linux
  (msgrcv 0 :type integer)   ;x on linux
  (nsignals 0 :type integer) ;x on linux
  (nvcsw 0 :type integer)
  (nivcsw 0 :type integer))

(defun rusage (&optional (who +RUSAGE-SELF+))
  (with-foreign-object (rusage '(:struct rusage))
    (case (%getrusage who rusage)
      (+efault+ :efault)
      (+einval+ :einval)
      (t
       (with-foreign-slots ((utime
                             stime
                             maxrss
                             ixrss    ;x on linux
                             idrss    ;x on linux
                             isrss    ;x on linux
                             minflt
                             majflt
                             nswap    ;x on linux
                             inblock
                             oublock
                             msgsnd   ;x on linux
                             msgrcv   ;x on linux
                             nsignals ;x on linux
                             nvcsw
                             nivcsw) rusage (:struct rusage))
         (make-rusage
          :utime (timeval->microsec utime)
          :stime (timeval->microsec stime)
          :maxrss maxrss
          :ixrss ixrss
          :idrss idrss
          :isrss isrss
          :minflt minflt
          :majflt majflt
          :nswap nswap
          :inblock inblock
          :oublock oublock
          :msgsnd msgsnd
          :msgrcv msgrcv
          :nsignals nsignals
          :nvcsw nvcsw
          :nivcsw nivcsw))))))

(defun timeval->microsec (timeval)
  (destructuring-bind (sec secval usec usecval) timeval
    (declare (ignore sec usec))
    (+ (* 1000000 secval) usecval)))
