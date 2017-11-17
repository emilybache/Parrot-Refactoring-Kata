;
; Unit test framework for scheme
; see http://c2.com/cgi/wiki?SchemeUnit
;

(define (report-error msg)
    (error (string-append "AssertionError: " msg))
)

(define (assert msg b)
    (if (not b) (report-error msg))
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

(assert= 1 1) ; self test
