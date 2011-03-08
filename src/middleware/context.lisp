#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(clack.util:namespace caveman.middleware.context
  (:use :cl
        :clack)
  (:import-from :caveman.context
                :*context*
                :*request*
                :*response*
                :context
                :make-context)
  (:import-from :caveman.response
                :make-response
                :body
                :finalize))

(cl-annot:enable-annot-syntax)

@export
(defclass <caveman-middleware-context> (<middleware>) ())

(defmethod call ((this <caveman-middleware-context>) req)
  (let* ((*context* (make-context req))
         (*request* (context :request))
         (*response* (context :response))
         (result (call-next this *request*)))
    (if (listp result)
        result
        (progn (setf (body *response*) result)
               (finalize *response*)))))
