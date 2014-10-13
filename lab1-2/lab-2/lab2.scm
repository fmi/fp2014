(define (fast-exp x n)
  (cond
    ((= n 0) 1)
    ((even? n) (* (fast-exp x (/ n 2)) (fast-exp x (/ n 2))))
    (else (* x (fast-exp x (- n 1))))))

(define (is-divisor? x n)
  (= (remainder x n) 0))

(define (sum-divisors x)
  (sum-divisors-helper x 1))

(define (sum-divisors-helper x current)
  (cond
    ((= current x) 0)
    ((is-divisor? x current) (+ current (sum-divisors-helper x (+ current 1))))
    (else (sum-divisors-helper x (+ current 1)))))

(define (sum-divisors-iter x)
  (sum-divisors-helper-iter x 1 0))

(define (sum-divisors-helper-iter x current result)
  (cond
    ((= current x) result)
    ((is-divisor? x current) (sum-divisors-helper-iter x (+ current 1) (+ current result)))
    (else (sum-divisors-helper-iter x (+ current 1) result))))

(define (is-perfect? x)
  (= x (sum-divisors x)))

(define (occurrences a x)
  (cond
    ((= x 0) 0)
    ((= (remainder x 10) a) (+ (occurrences a (quotient x 10)) 1))
    (else (occurrences a (quotient x 10)))))

(define (occurrences-iter a x) (occurrences-iter-helper a x 0))

(define (occurrences-iter-helper a x result)
  (cond
    ((= x 0) result)
    ((= (remainder x 10) a) (occurrences-iter-helper a (quotient x 10) (+ result 1)))
    (else (occurrences-iter-helper a (quotient x 10) result))))

(define (digit-count x)
  (if (< x 10)
      1
      (+ 1 (digit-count (quotient x 10)))))

(define (digit-at-pos x position)
  (remainder (quotient x (fast-exp 10 (- (digit-count x) position))) 10))

(define (increasing? x)
  (increasing-helper? x 1))

(define (increasing-helper? x position)
  (cond
    ((= position (digit-count x)) #t)
    ((< (digit-at-pos x position) (digit-at-pos x (+ position 1))) (increasing-helper? x (+ position 1)))
    (else #f)))

(define (prime? x)
  (prime-helper x 2))

(define (prime-helper x current)
  (cond
    ((= current x) #t)
    ((is-divisor? x current) #f)
    (else (prime-helper x (+ current 1)))))

(define (sum-prime-divisors x)
  (sum-prime-divisors-helper x 2 0))

(define (sum-prime-divisors-helper x current result)
  (cond
    ((= current x) result)
    ((and (is-divisor? x current) (prime? current)) (sum-prime-divisors-helper x (+ current 1) (+ current result)))
    (else (sum-prime-divisors-helper x (+ current 1) result))))

(define (max-prime-divisor x)
  (max-prime-divisor-helper x 2 0))

(define (max-prime-divisor-helper x current max)
  (cond
    ((= x current) max)
    ((and (is-divisor? x current) (prime? current) (> current max)) (max-prime-divisor-helper x (+ current 1) current))
    (else (max-prime-divisor-helper x (+ current 1) max))))
