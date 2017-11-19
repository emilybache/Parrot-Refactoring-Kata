(include "assert.scm")
(include "parrot.scm")

(test-case "Parrot" (list

; it gets the speed of a european parrot
(lambda ()
    (assert= 12.0
            (parrot-speed 'european-parrot 0 0.0 #f))) ; ')))

; it gets the speed of an african parrot with one coconut
(lambda ()
    (assert= 3.0
            (parrot-speed 'african-parrot 1 0.0 #f))) ; ')))

; it gets the speed of an african parrot with two coconuts
(lambda ()
    (assert= 0.0
            (parrot-speed 'african-parrot 2 0.0 #f))) ; ')))

; it gets the speed of an african parrot with no coconuts
(lambda ()
    (assert= 12.0
            (parrot-speed 'african-parrot 0 0.0 #f))) ; ')))

; it gets the speed of a nailed norwegian blue parrot
(lambda ()
    (assert= 0.0
             (parrot-speed 'norwegian-blue-parrot 0 1.5 #t))) ; ')))

; it gets the speed of a not nailed norwegian blue parrot
(lambda ()
    (assert= 18.0
             (parrot-speed 'norwegian-blue-parrot 0 1.5 #f))) ; ')))

; it gets the speed of a not nailed norwegian blue parrot with high voltage
(lambda ()
    (assert= 24.0
             (parrot-speed 'norwegian-blue-parrot 0 4.0 #f))) ; ')))

; it can't get speed of unknown parrrot types
(lambda ()
    (assert-raise
        'Should-be-unreachable ; '
        (lambda () (parrot-speed 'unknown-parrot 0 0.0 #f)))) ; '))))

))
