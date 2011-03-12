(clack.util:namespace ${application-name}.config
  (:use :cl
        :${application-name}))

(setf *config*
      `(:static-path #p"public/"
        :server :hunchentoot
        :port 8080
        :database-type :sqlite3
        :database-connection-spec (,(namestring
                                     (asdf:system-relative-pathname
                                      :${application-name}
                                      "sqlite3.db")))))