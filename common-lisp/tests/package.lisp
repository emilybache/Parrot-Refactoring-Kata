;;;; package.lisp

(defpackage :parrot-tests
  (:use :common-lisp
	:parrot)
  (:import-from :parachute
   :define-test
   :is)
  (:import-from :cl-mock
   :with-mocks
   :answer
   :call-previous
   :invocations))
