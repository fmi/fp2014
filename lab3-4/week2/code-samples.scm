; Factorial with standart recursion
(define (fact n)
    (define (fib-iter n result)
        (cond
          ((= n 0) result)
          (else (fib-iter (- n 1) (* n result)))))
    (fib-iter n 1))

; this is with complexity O(1.6^n)
; Lost of repetitions - things we have already calculated are calculated again
(define (fib-bad n)
    (cond
        ((= n 1) 1)
        ((= n 2) 1)
        (else (+ (fib-bad (- n 1)) (fib-bad (- n 2))))))

; this is with linear O(n) complexity
(define (fib n)
  (define (fib-iter n a b )
    (cond
      ((= n 1) a)
      (else (fib-iter (- n 1) b (+ a b)))))
(fib-iter n 1 1))

(define (sum-of-digits n)
    (define (iter n result)
      (cond
        ((= n 0) result)
        (else (iter (quotient n 10) (+ result (remainder n 10))))))
    (iter n 0))

; New lines to distinct the body of the inner function
(define (sum a b)

  (define (iter a b result)
    (cond ((> a b) result)
        (else (iter (+ a 1) b (+ a result)))))

(iter a b 0))

(define (reverse-int n)
  (define (iter n result)
    (cond
      ((= n 0) result)
      (else (iter (quotient n 10) (+ (remainder n 10) (* result 10))))))
    (iter n 0))

(define (int-palindrom? n)
 (= n (reverse-int n)))

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

(define (sum-of-primes-in-range start end)
  (define (sum-of-primes-in-range-iter start end result)
    (cond
      ( (> start end) result  )
      ( (is-prime? start) (sum-of-primes-in-range-iter (+ start 1) end (+ start result))   )
      (else (sum-of-primes-in-range-iter (+ start 1) end result) )))
  (sum-of-primes-in-range-iter start end 0))

(define (count-divisors x)

  (define (count-divisors-iter x i result)
    (cond ((> i x) result)
          ((is-divisible? x i) (count-divisors-iter x (+ i 1) (+ result 1)))
          (else (count-divisors-iter x (+ i 1) result))))

  (count-divisors-iter x 1 0))

(define (evenly? x)
  (even? (count-divisors x)))

(define (oddly? x)
  (not (evenly? x)))
