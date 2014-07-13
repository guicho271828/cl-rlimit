(defsystem cl-rlimit
  :author "guicho"
  :defsystem-depends-on (:cffi-grovel)
  :depends-on (:cffi)
  :components
  ((:module :src
            :serial t
            :components
            ((:file :packages)
             (:cffi-grovel-file :grovel)
             (:file :rlimit)))))
