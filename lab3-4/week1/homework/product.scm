(load "../../test-framework.scm")

(define (product-of-digits n)
  (cond
    ((zero? n) 1)
    (else (* (remainder n 10) (product-of-digits (quotient n 10))))))


(assert-equal? 6 (product-of-digits 123))
(assert-equal? 120 (product-of-digits 12345))
(assert-equal? 0 (product-of-digits 12355430))
