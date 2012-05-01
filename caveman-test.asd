#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(in-package :cl-user)
(defpackage caveman-test-asd
  (:use :cl :asdf))
(in-package :caveman-test-asd)

(defsystem caveman-test
  :depends-on (:caveman
               :cl-test-more
               :cl-fad
               :drakma
               :usocket)
  :components ((:module "t"
                :serial t
                :components
                ((:file "init")
                 (:file "caveman")
                 (:file "final"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
