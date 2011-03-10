#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(clack.util:namespace caveman
  (:use :cl)
  (:import-from :caveman.route
                :url)
  (:import-from :caveman.context
                :*context*
                :*request*
                :*response*
                :context)
  (:import-from :caveman.view
                :render)
  (:export :url
           :*context*
           :*request*
           :*response*
           :context
           :render))

(cl-annot:enable-annot-syntax)

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
