#|
  This file is a part of caveman project.
  Copyright (c) 2013 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage caveman2-test-asd
  (:use :cl :asdf))
(in-package :caveman2-test-asd)

(defsystem caveman2-test
  :author "Eitarow Fukamachi"
  :license "LLGPL"
  :depends-on (:caveman2
               :cl-fad
               :usocket
               :drakma
               :cl-test-more
               :trivial-types)
  :components ((:module "v2/t"
                :serial t
                :components
                ((:test-file "caveman")
                 (:test-file "route")
                 (:test-file "nested-parameter"))))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
