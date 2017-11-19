;
; Unit test framework for scheme
; see http://c2.com/cgi/wiki?SchemeUnit
;

(define (report-error msg)
    (error (string-append "AssertionError: " msg))
)

(define (progress)
    (display "."))

(define (assert msg b)
    (if (not b) (report-error msg) (progress))
)

; extensions

(define (assert-generic-equal to-string eq-op expected actual)
    (assert
        (string-append "expected:<" (to-string expected) "> but was:<" (to-string actual) ">")
        (eq-op expected actual)
    )
)

(define (assert= expected actual)
    (assert-generic-equal number->string = expected actual)
)

(define (assert-raise expected-exc body)
    (with-exception-catcher
        (lambda (exc)
             (assert
                (string-append "Should raise " (symbol->string expected-exc))
                (eq? expected-exc exc)))
        (lambda () (report-error (body)))))

(define (test-case name assertions)
    (define (exec asserts)
        (if (not (= (length asserts) 0))
            (append
                (list ((car asserts)))
                (exec (cdr asserts))
            )
            (list)
        )

    )
    (display (string-append name " Test"))
    (newline)
    (exec assertions)
    (newline)
)

; self test

(test-case "Assert Self"
    (list
        (lambda () (assert= 1 1))
        (lambda () (assert-raise
            'a ; '
            (lambda () (raise 'a)))) ; '))))
    )
)
