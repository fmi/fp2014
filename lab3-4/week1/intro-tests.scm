;;; This file contains unit tests for the problem listed in the name
;;; of this file.
;;;
;;; To run the tests specify the relative or absolute path to the
;;; ".scm" file with the proposed solution in the (load ...) command
;;; below. Then you can either open the tests and run them in Racket
;;; (with R5RS set as the language), or you can run the following
;;; directly from the command line:
;;;
;;;   plt-r5rs <the-name-of-this-file>
;;;
;;; assuming Racket's bin directory is included in the PATH environment
;;; variable.
;;;
;;; To inspect the actual test cases that are run - look at the
;;; bottom of the file.
;;;
(load "intro.scm")
(load "test-framework.scm")

(announce "Testing identity")

(framework-check
    5
    (identity 5))

(announce "Testing square")

(framework-check
  25
  (square 5))

(announce "Testing fact with if")

(framework-check
  120
  (fact 5))

(framework-check
  1
  (fact 0))

(announce "Testing fact with cond")

(framework-check
  120
  (fact2 5))

(framework-check
  1
  (fact2 0))

(announce "Testing in-between?")

(framework-check
  #t
  (in-between? 5 1 10))

(framework-check
  #t
  (in-between? 5 5 10))

(framework-check
  #f
  (in-between? 5 6 10))

(announce "Testing sum-of-digits")

(framework-check
  6
  (sum-of-digits 123))

(framework-check
  8
  (sum-of-digits 2222))

(framework-check
  0
  (sum-of-digits 0))

(announce "Testing contains-digits?")

(framework-check
  #t
  (contains-digit? 123 3))

(framework-check
  #t
  (contains-digit? 0 0))

(framework-check
  #f
  (contains-digit? 123 4))
