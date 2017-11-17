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
(assert= 1 1)

(define (assert-string= expected actual)
    (assert-generic-equal values string=? expected actual)
)

(assert-string= "abc" "abc")

(define (list-equals-for eq-op)
    (define (list-equals? list1 list2)
        (cond
            ((null? list1)
                (null? list2))
            ((not (= (length list1) (length list2)))
                #f)
            ((not (eq-op (car list1) (car list2)))
                #f)
            (else
                (list-equals? (cdr list1) (cdr list2)))
        )
    )
    list-equals?
)

(define (assert-list= eq-op msg expected actual)
    (assert
        (string-append msg " lists not equal")
        ((list-equals-for eq-op) expected actual))
)

(assert-list= = "int" (list 1 2) (list 1 2))
(assert-list= string=? "string" (list "a") (list "a"))
