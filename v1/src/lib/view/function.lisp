#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(clack.util:namespace caveman.view.function
  (:use :cl))

(cl-syntax:use-syntax :annot)

@export
(defun render (fn params)
  "Render function for Functions."
  (apply fn params))
