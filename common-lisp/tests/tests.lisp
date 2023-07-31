;;;; tests.lisp

(in-package :parrot-tests)

(define-test parrot-testsuite)

(define-test "The speed of an european parrot is 12.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'european)))
    (is equalp (speed a-parrot) 12.0)))

(define-test "The speed of an african parrot without coconut is 12.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'african :number-of-coconuts 0)))
    (is equalp (speed a-parrot) 12.0)))

(define-test "The speed of an african parrot with one coconut is 3.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'african :number-of-coconuts 1)))
    (is equalp (speed a-parrot) 3.0)))

(define-test "The speed of an african parrot with two coconuts is 0.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'african :number-of-coconuts 2)))
    (is equalp (speed a-parrot) 0.0)))

(define-test "The speed of a nailed norwegian-blue parrot is 0.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'norwegian-blue :voltage 1.5 :nailed t)))
    (is equalp (speed a-parrot) 0.0)))

(define-test "The speed of a non-nailed norwegian-blue parrot is 18.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'norwegian-blue :voltage 1.5 :nailed nil)))
    (is equalp (speed a-parrot) 18.0)))

(define-test "The speed of a non-nailed norwegian-blue parrot with high voltage is 24.0."
  :parent parrot-testsuite
  (let ((a-parrot (make-instance 'parrot :type 'norwegian-blue :voltage 4.0 :nailed nil)))
    (is equalp (speed a-parrot) 24.0)))

