;
; Unit test framework for scheme
; see http://c2.com/cgi/wiki?SchemeUnit
;

(define (report-error msg)
    (error (string-append "AssertionError: " msg)))

(define (check msg b)
    (if (not b) (report-error msg)))

(define (assert msg b)
    (lambda () (check msg b)))

; extensions

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
                 (check
                    (string-append "Should raise " (symbol->string expected-exc))
                    (eq? expected-exc exc)))
            (lambda () (report-error (body))))))

(define (test-case name assertion)
    (display name)
    (newline)
    (assertion)
    (display "OK")
    (newline)
)

; self test

(test-case "assert="
    (assert= 1 1))

(test-case "assert-raise"
    (assert-raise
        'a ; '
        (lambda () (raise 'a)))) ; '))))
