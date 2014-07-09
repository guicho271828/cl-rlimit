
(defsystem cl-rlimit
  :author "guicho"
  :defsystem-depends-on (:cffi-grovel)
  :depends-on (:cffi)
  :components
  ((:module :src
            :components
            ((:file :packages)
             (cffi-grovel:grovel-file "grovel")
             (:file :rlimit)))))
