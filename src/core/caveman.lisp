#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(clack.util:namespace caveman
  (:use :cl)
  (:import-from :cl-syntax
                :use-syntax)
  (:import-from :cl-syntax-annot
                :annot-syntax)
  (:import-from :caveman.route
                :url
                :link-to)
  (:import-from :caveman.app
                :next-route)
  (:import-from :caveman.context
                :*app*
                :*context*
                :*request*
                :*response*
                :*session*
                :context
                :with-context-variables)
  (:export :url
           :link-to
           :*context*
           :*request*
           :*response*
           :*session*
           :context
           :with-context-variables))

(use-syntax annot-syntax)

@export
(defun config (&optional key)
  (let ((conf (caveman.app:config *app*)))
    (if key (getf conf key) conf)))

@export
(defun app-path (&rest paths)
  (labels ((normalize-path (path)
             (etypecase path
               (keyword (config path))
               (pathname path))))
    (reduce
     (lambda (path1 path2)
       (merge-pathnames
        (normalize-path path2)
        (normalize-path path1)))
     paths
     :initial-value (config :application-root))))

(doc:start)

@doc:NAME "
Caveman - main package.
"

@doc:DESCRIPTION "
This package is main package just for convenient. Your Caveman Application may use this package.
"

@doc:AUTHOR "
* Eitarow Fukamachi (e.arrows@gmail.com)
"
