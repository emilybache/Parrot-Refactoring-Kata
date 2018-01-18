(ns parrot-refactoring.core-test
  (:require
    [midje.sweet :refer :all]
    [parrot-refactoring.core :as parrot]))

(facts
  "about Parrots"

  (fact
    "it gets the speed of a european parrot"

    (parrot/speed {:type :european-parrot
                   :num-coconuts 0
                   :voltage 0.0
                   :nailed false}) => 12.0)

  (fact
    "it gets the speed of an african parrot with one coconut"

    (parrot/speed {:type :african-parrot
                   :num-coconuts 1
                   :voltage 0.0
                   :nailed false}) => 3.0)

  (fact
    "it gets the speed of an african parrot with two coconuts"

    (parrot/speed {:type :african-parrot
                   :num-coconuts 2
                   :voltage 0.0
                   :nailed false}) => 0.0)

  (fact
    "it gets the speed of an african parrot with no coconuts"

    (parrot/speed {:type :african-parrot
                   :num-coconuts 0
                   :voltage 0.0
                   :nailed false}) => 12.0)

  (fact
    "it gets the speed of a nailed norwegian blue parrot"

    (parrot/speed {:type :norwegian-blue-parrot
                   :num-coconuts 0
                   :voltage 1.5
                   :nailed true}) => 0.0)

  (fact
    "it gets the speed of a not nailed norwegian blue parrot"

    (parrot/speed {:type :norwegian-blue-parrot
                   :num-coconuts 0
                   :voltage 1.5
                   :nailed false}) => 18.0)

  (fact
    "it gets the speed of a not nailed norwegian blue parrot with high voltage"

    (parrot/speed {:type :norwegian-blue-parrot
                   :num-coconuts 0
                   :voltage 4.0
                   :nailed false}) => 24.0)

  (fact
    "it can't get speed of unknown parrrot types"

    (parrot/speed {:type :unknown-parrot-type
                   :num-coconuts 0
                   :voltage 0.0
                   :nailed false}) => (throws Exception "Should be unreachable!")))
