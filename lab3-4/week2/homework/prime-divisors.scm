(load "../../test-framework.scm")

; helper function for sum-of-divisors
(define (is-divisible? a n)
  (= (remainder a n) 0))

(define (sum-of-divisors n)
  (define (sum-of-divisors-iter n current-divisor result)
    (cond
      ( (< n current-divisor) result )
      ( (is-divisible? n current-divisor) (sum-of-divisors-iter n (+ current-divisor 1) (+ result current-divisor) ) )
      (else (sum-of-divisors-iter n (+ current-divisor 1) result ))))
  (sum-of-divisors-iter n 1 0))

(define (is-prime? n)
  (= (+ n 1) (sum-of-divisors n)))

(define (sum-of-prime-divisors n)
  (define (iter n i result)
    (cond ((> i n) result)
          ((and (= (remainder n i) 0) (is-prime? i)) (iter n (+ i 1) (+ result i)))
          (else (iter n (+ i 1) result))))
  (iter n 1 0))


(assert-equal? 2 (sum-of-prime-divisors 4))
(assert-equal? 7 (sum-of-prime-divisors 10))
(assert-equal? 5 (sum-of-prime-divisors 36))
(assert-equal? 12 (sum-of-prime-divisors 42))
(assert-equal? 17 (sum-of-prime-divisors 17))
