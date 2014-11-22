(define (__make-counter x)
  (lambda ()
    (set! x (+ x 1))
    x))

(define __test-counter (__make-counter 0))

(define (__test-passed)
  (display (string-append "Test" (number->string (__test-counter)) " passed!"))
  (newline))

(define (__test-failed expected actual)
  (display (string-append "Test" (number->string (__test-counter)) " failed!"))
  (newline)
  (display "Expected: ")
  (newline)
  (display expected)
  (newline)
  (display "Actual: ")
  (newline)
  (display actual)
  (newline))

(define (assert-equal? expected-value return-value)
  (if (equal? expected-value return-value)
      (__test-passed)
      (__test-failed expected-value return-value)))

(define (assert-true? return-value)
  (assert-equal? #t return-value))

(define (assert-false? return-value)
  (assert-equal? #f return-value))

;;; dont do this at home
(define (announce test-name)
  (display (string-append "Testing " test-name))
  (newline)
  (set! __test-counter (__make-counter 0)))

;;; Dragons no more!
;;; End of the "test framework" code.
