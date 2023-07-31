# parrot-refactoring-kata

The description of the project can be found here:
https://github.com/emilybache/Parrot-Refactoring-Kata/blob/main/README.md

# Setup

## Install quicklisp

To run this project install quicklisp (if not already done): 
 - download https://beta.quicklisp.org/quicklisp.lisp
 - load it with your common lisp implementation. The example with sbcl: 
   > sbcl --load quicklisp.lisp
 - run the command 
   > (quicklisp-quickstart:install) 
   in your common lisp implementation
 - run the command 
   > (ql:add-to-init-file) 
   in your common lisp implementation

## Install project
Copy the project-folder containing this file into /quicklisp/local-projects/ that has been created when installing quicklisp.
This is the root directory for quicklisp to search for the gilded-rose.asd file which defines the system (project) and its dependencies.
The quicklisp-folder is usually created in your home-directory.

## Work with the project

Now you can load the project with 
> (ql:quickload "parrot-refactoring-kata") 
in the common lisp implementation of your choice and run the tests with 
> (asdf:test-system "parrot-refactoring-kata")
.

If you just want to run the tests
> (asdf:test-system "parrot-refactoring-kata")
is sufficient.

You can mock functions and methods with the cl-mock-library which is already included in the system definition of the test-system:

(with-mocks ()
  (answer <your-method> (call-previous))
  (<your-method> <argument-list>)
  (is <your-testcase> (invocations '<your-method>)))
  
If you just want to stub functions you can replace (call-previous) with a return value of your choice and your test does not depend on (invocations '<your-method>)


