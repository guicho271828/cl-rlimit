(defpackage :cl-rlimit
  (:use :cl :cffi)
  (:export :rlimit
           :+RLIMIT-ADDRESS-SPACE+
           :+RLIMIT-AS+
           :+RLIMIT-CORE+
           :+RLIMIT-CPU+
           :+RLIMIT-CPU-TIME+
           :+RLIMIT-DATA+
           :+RLIMIT-FILE-SIZE+
           :+RLIMIT-FSIZE+
           :+RLIMIT-MEMLOCK+
           :+RLIMIT-MSGQUEUE+
           :+RLIMIT-NICE+
           :+RLIMIT-NOFILE+
           :+RLIMIT-NPROC+
           :+RLIMIT-NUMBER-OF-FILES+
           :+RLIMIT-NUMBER-OF-PROCESSES+
           :+RLIMIT-OFILE+
           :+RLIMIT-REAL-TIME-PRIORITY+
           :+RLIMIT-RSS+
           :+RLIMIT-RTPRIO+
           :+RLIMIT-SIGPENDING+
           :+RLIMIT-STACK+

           :+RLIM-INFINITY+
           
           :rusage
           :rusage-utime
           :rusage-stime
           :rusage-maxrss
           :rusage-ixrss
           :rusage-idrss
           :rusage-isrss
           :rusage-minflt
           :rusage-majflt
           :rusage-nswap
           :rusage-inblock
           :rusage-oublock
           :rusage-msgsnd
           :rusage-msgrcv
           :rusage-nsignals
           :rusage-nvcsw
           :rusage-nivcsw

           :+RUSAGE-SELF+
           :+RUSAGE-CHILDREN+
           :+RUSAGE-THREAD+))
