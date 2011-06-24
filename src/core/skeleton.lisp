#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(clack.util:namespace caveman.skeleton
  (:use :cl)
  (:import-from :cl-project
                :make-project)
  (:import-from :cl-syntax
                :use-syntax)
  (:import-from :cl-syntax-annot
                :annot-syntax))

(use-syntax annot-syntax)

(defvar *skeleton-directory*
    #.(asdf:system-relative-pathname
       :caveman
       #p"skeleton/"))

@export
(defun generate (pathname &rest params)
  "Generate a skeleton of Caveman Application.
`name' must be a symbol or a keyword. `path' must be a pathname. If `path' isn't specified, generate a skeleton to current directory."
  (apply #'cl-project:make-project pathname params)
  (let ((cl-project:*skeleton-directory*
         *skeleton-directory*))
    (apply #'cl-project:make-project pathname params))
  (delete-file
   (merge-pathnames
    (format nil "src/~A.lisp"
            (car (last (pathname-directory pathname))))
    pathname)))

(doc:start)

@doc:NAME "
Caveman.Skeleton - Generating Application Skeleton.
"

@doc:SYNOPSIS "
    (caveman.skeleton:generate #p\"lib/myapp\")
"

@doc:DESCRIPTION "
Caveman.Skeleton provides a way to create a new Caveman Application.
"

@doc:AUTHOR "
* Eitarow Fukamachi (e.arrows@gmail.com)
"
