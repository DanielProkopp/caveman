#|
  This file is a part of <% @var name %> project.
<% @if author %>  Copyright (c) <%= (local-time:timestamp-year (local-time:now)) %> <% @var author %><% @if email %> (<% @var email %>)<% @endif %>
<% @endif %>|#
<%
(when (or (getf env :description)
          (getf env :author))
%>
#|
<% @if description %>  <% @var description %>

<% @endif %><% @if author %>  Author: <% @var author %><% @if email %> (<% @var email %>)<% @endif %><% @endif %>
|#
<% ) %>
(in-package :cl-user)
(defpackage <% @var name %>-asd
  (:use :cl :asdf))
(in-package :<% @var name %>-asd)

(defsystem <% @var name %>
  :version "0.1-SNAPSHOT"
  :depends-on (:caveman
               :cl-annot)
  :components ((:module "lib"
                :components
                ((:file "<% @var name %>")
                 (:module "view"
                  :depends-on ("<% @var name %>")
                  :components
                  ((:file "emb")))))
               (:module "src"
                :depends-on ("lib")
                :components
                ((:file "controller")))))
