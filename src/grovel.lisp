
(in-package :cl-rlimit)

;; See Man getrlimit (2)
;; /usr/include/linux/resource.h

(include "sys/time.h" "sys/resource.h")

(constant (+rlim-infinity+ "RLIM_INFINITY"))
(progn
  (constant (+rlimit-as+ "RLIMIT_AS"))
  (constant (+rlimit-address-space+ "RLIMIT_AS")))
(constant (+rlimit-core+ "RLIMIT_CORE"))
(progn
  (constant (+rlimit-cpu-time+ "RLIMIT_CPU"))
  (constant (+rlimit-cpu+ "RLIMIT_CPU")))
(constant (+rlimit-data+ "RLIMIT_DATA"))
(progn
  (constant (+rlimit-file-size+ "RLIMIT_FSIZE"))
  (constant (+rlimit-fsize+ "RLIMIT_FSIZE")))
;; only on early linux, ignored
;; (constant +rlimit-locks+ "RLIMIT_LOCKS")
(constant (+rlimit-memlock+ "RLIMIT_MEMLOCK"))
(constant (+rlimit-msgqueue+ "RLIMIT_MSGQUEUE"))
(constant (+rlimit-nice+ "RLIMIT_NICE"))
(progn
  (constant (+rlimit-number-of-files+ "RLIMIT_NOFILE"))
  (constant (+rlimit-nofile+ "RLIMIT_NOFILE")))
(progn
  (constant (+rlimit-nproc+ "RLIMIT_NPROC"))
  (constant (+rlimit-number-of-processes+ "RLIMIT_NPROC")))
(constant (+rlimit-rss+ "RLIMIT_RSS"))
(progn
  (constant (+rlimit-real-time-priority+ "RLIMIT_RTPRIO"))
  (constant (+rlimit-rtprio+ "RLIMIT_RTPRIO")))
(constant (+rlimit-sigpending+ "RLIMIT_SIGPENDING"))
(constant (+rlimit-stack+ "RLIMIT_STACK"))
(constant (+rlimit-ofile+ "RLIMIT_OFILE"))

(ctype rlimit-type "rlim_t")

(cstruct rlimit "struct rlimit"
 (current "rlim_cur" :type :unsigned-long-long) ;;  "the current (soft) limit"
 (max "rlim_max" :type :unsigned-long-long)) ;;"the hard limit"

(cstruct timeval "struct timeval"
   (sec "tv_sec" :type :long)
   (usec "tv_usec" :type :long))

(cstruct rusage "struct rusage"
   (utime "ru_utime" :type (:struct timeval))
   (stime "ru_stime" :type (:struct timeval))
   (maxrss "ru_maxrss" :type :long)
   (ixrss "ru_ixrss" :type :long)
   (idrss "ru_idrss" :type :long)
   (isrss "ru_isrss" :type :long)
   (minflt "ru_minflt" :type :long)
   (majflt "ru_majflt" :type :long)
   (nswap "ru_nswap" :type :long)
   (inblock "ru_inblock" :type :long)
   (oublock "ru_oublock" :type :long)
   (msgsnd "ru_msgsnd" :type :long)
   (msgrcv "ru_msgrcv" :type :long)
   (nsignals "ru_nsignals" :type :long)
   (nvcsw "ru_nvcsw" :type :long)
   (nivcsw "ru_nivcsw" :type :long))

(include "errno.h")

(constant (+EFAULT+ "EFAULT"))
(constant (+EINVAL+ "EINVAL"))
(constant (+EPERM+ "EPERM"))
(constant (+ESRCH+ "ESRCH"))

