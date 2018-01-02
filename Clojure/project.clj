(defproject parrot-refactoring "0.0.1-SNAPSHOT"
  :description "Parrot Refactoring Kata"
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :profiles {:dev {:dependencies [[midje "1.8.3"]]
                   :plugins [[lein-midje "3.2.1"]]}
             :midje {}})
