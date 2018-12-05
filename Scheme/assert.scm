;;;
;;; Unit test framework for Scheme
;;; Copyright (c) 2017, Peter Kofler, http://www.code-cop.org/
;;; BSD licensed.
;;;
;;; Non S5RS used functions
;;; * error from R6RS
;;; * with-exception-catcher from Gambit
;;;

;; SchemeUnit from http://c2.com/cgi/wiki?SchemeUnit

(define (report-error msg)
    (error (string-append "AssertionError" ": " msg)))

(define (check msg condition)
    (if (not condition)
        (report-error msg)
        #t))

(define (assert msg condition)
    (lambda () (check msg condition)))

;; extensions

(define (assert-generic-equal to-string eq-op expected actual)
    (assert
        (string-append "expected:<" (to-string expected) "> but was:<" (to-string actual) ">")
        (eq-op expected actual)))

(define (assert= expected actual)
    (assert-generic-equal number->string = expected actual))

(define (assert-raise expected-exc body)
    (lambda ()
        (with-exception-catcher
            (lambda (exc)
                (check (string-append "Should raise " (symbol->string expected-exc))
                       (eq? expected-exc exc)))
            (lambda () (report-error (body))))))

(define (test-case name . assertions)
    (display name)
    (newline)
    (for-each (lambda (a) (a)) assertions)
    (display "OK")
    (newline))

;; self test

(test-case "assert="
    (assert= 1 1))

(test-case "assert-raise"
    (assert-raise
        'a
        (lambda () (raise 'a))))
