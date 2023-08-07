;;;; parrot-refactoring-kata.asd

(asdf:defsystem "parrot-refactoring-kata"
  :description ""
  :author "Monty Python monty.python@legendary.fun"
  :version "1.0.0"
  :depends-on ()
  :pathname "source/"
  :components ((:file "package")
               (:file "parrot" :depends-on ("package")))
  :in-order-to ((test-op (test-op "parrot-refactoring-kata/tests"))))


(asdf:defsystem "parrot-refactoring-kata/tests"
		:description "Unit tests for parrot-refactoring-kata"
                :author "Monty Python monty.python@legendary.fun"
		:version "1.0.0"
		:depends-on ("parrot-refactoring-kata" "parachute" "cl-mock")
		:pathname "tests/"
		:components ((:file "package")
			     (:file "tests" :depends-on ("package")))
		:perform (test-op (o c) (symbol-call :parachute :test :parrot-refactoring-kata-tests)))
