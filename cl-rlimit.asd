(defsystem cl-rlimit
  :author "Masataro Asai"
  :license "LLGPL"
  :defsystem-depends-on (:cffi-grovel)
  :depends-on (:cffi)
  :components
  ((:module :src
            :serial t
            :components
            ((:file :packages)
             (:cffi-grovel-file :grovel)
             (:file :rlimit)
             (:file :rusage)))))
