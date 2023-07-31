;;;; parrot-refactoring-kata.lisp

(in-package :parrot-refactoring-kata)

(deftype parrot-type () '(member european african norwegian-blue))

(defclass parrot ()
  ((type :initarg :type
	 :type parrot-type)
   (number-of-coconuts :initarg :number-of-coconuts
		       :type integer
		       :initform 0)
   (voltage :initarg :voltage
	    :type double
	    :initform 0)
   (nailed :initarg :nailed
	   :type boolean
	   :initform nil)))

(defmethod base-speed ((a-parrot parrot))
  12.0)

(defmethod load-factor ((a-parrot parrot))
  9.0)

(defmethod base-speed-for-voltage ((a-parrot parrot) voltage)
  (min 24.0 (* voltage (base-speed a-parrot))))

(defmethod speed ((a-parrot parrot))
  (with-slots (type number-of-coconuts voltage nailed) a-parrot
    (cond ((equal type 'european) (base-speed a-parrot))
	  ((equal type 'african) (max 0 (- (base-speed a-parrot) (* (load-factor a-parrot) number-of-coconuts))))
	  ((equal type 'norwegian-blue) (if nailed
					    0
					    (base-speed-for-voltage a-parrot voltage)))
	  (t (error "should be unreachable")))))
