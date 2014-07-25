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
           :+RLIMIT-INFINITY+
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
           :+RLIMIT-STACK+))
