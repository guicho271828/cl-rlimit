(defsystem cl-rlimit
  :author "Masataro Asai"
  :license "LLGPL"
  :mailto "guicho2.71828@gmail.com"
  :description "Simple interface to Unix getrlimit and setrlimit."
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
