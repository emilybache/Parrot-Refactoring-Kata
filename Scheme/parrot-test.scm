(include "assert.scm")
(include "parrot.scm")

(test-case "it gets the speed of an european parrot"
    (assert= 12.0
            (parrot-speed 'european-parrot 0 0.0 #f)))

(test-case "it gets the speed of an african parrot with one coconut"
    (assert= 3.0
            (parrot-speed 'african-parrot 1 0.0 #f)))

(test-case "it gets the speed of an african parrot with two coconuts"
    (assert= 0.0
            (parrot-speed 'african-parrot 2 0.0 #f)))

(test-case "it gets the speed of an african parrot with no coconuts"
    (assert= 12.0
            (parrot-speed 'african-parrot 0 0.0 #f)))

(test-case "it gets the speed of a nailed norwegian blue parrot"
    (assert= 0.0
             (parrot-speed 'norwegian-blue-parrot 0 1.5 #t)))

(test-case "it gets the speed of a not nailed norwegian blue parrot"
    (assert= 18.0
             (parrot-speed 'norwegian-blue-parrot 0 1.5 #f)))

(test-case "it gets the speed of a not nailed norwegian blue parrot with high voltage"
    (assert= 24.0
             (parrot-speed 'norwegian-blue-parrot 0 4.0 #f)))

(test-case "it can't get speed of unknown parrrot types"
    (assert-raise
        'Should-be-unreachable
        (lambda () (parrot-speed 'unknown-parrot 0 0.0 #f))))
