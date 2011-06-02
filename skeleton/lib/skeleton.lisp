(clack.util:namespace ${application-name}
  (:use :cl
        :clack)
  (:shadow :stop)
  (:import-from :caveman.app
                :<app>)
  (:import-from :caveman.configloader
                :load-config))

(cl-annot:enable-annot-syntax)

@export
(defclass ${application-name} (<app>) ())

@export
(defvar *caveman* (make-instance '${application-name}))

@export
(defvar *app* *caveman*)

@export
(defun start (&key (mode :dev) debug lazy)
  (setf (caveman.app:config *caveman*)
        (load-config *caveman* mode))
  (caveman.app:start *caveman* *app* :mode mode :debug debug :lazy lazy))

@export
(defun stop ()
  (caveman.app:stop *caveman*))

@export
(defun config (&optional key)
  (let ((conf (caveman.app:config *caveman*)))
    (if key (getf conf key) conf)))
