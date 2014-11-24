(load "../functools.scm")
(load "../test-framework.scm")

; Решения на първа група
; Задача 1
(define (is-divisible? a n)
  (= (remainder a n) 0))

(define (sum-of-divisors n)
  (define (sum-of-divisors-iter n current-divisor result)
    (cond
      ( (< n current-divisor) result )
      ( (is-divisible? n current-divisor) (sum-of-divisors-iter n (+ current-divisor 1) (+ result current-divisor) ) )
      (else (sum-of-divisors-iter n (+ current-divisor 1) result ))))
  (sum-of-divisors-iter n 1 0))

(define (prime? n)
  (= (+ n 1) (sum-of-divisors n)))

(define (truncatable-prime? x)
  (cond ((= x 0) #t)
        (else (and (prime? x) (truncatable-prime? (quotient x 10))))))

(assert-true? (truncatable-prime? 3797))
(assert-false? (truncatable-prime? 47))

; Задача 2
(define (all-preds? preds item)
  (all? (lambda (x) x) (map (lambda (pred) (pred item)) preds)))

(define (where items preds)
  (filter (lambda (item) (all-preds? preds item)) items))

(assert-equal? (list 6 8 10) (where (list 3 4 5 6 7 8 9 10) (list even? (lambda (x) (> x 5)))))
(assert-equal? (list) (where (list 3 4 5 7) (list even? (lambda (x) (> x 5)))))

; Задача 3

(define (transpose M)
  (map
    (lambda (index)
      (column index M)) (range 0 (- (length (car M)) 1))))

(define (column index M)
  (map (lambda (row)
    (nth index row)) M))

(define (row-to-zero row)
  (map (lambda (_) 0) row))

; Транспонираме, за да станат редовете колони
; След което трансформиране матрицата според зададеното правило
(define (zero M)
  (transpose
    (map
      (lambda (row)
        (if (member? 0 row)
            (row-to-zero row)
            row)) (transpose M))))

(assert-equal? (list (list 1 0 3 0) (list 5 0 6 0) (list 8 0 10 0)) (zero (list (list 1 2 3 4) (list 5 0 6 7) (list 8 9 10 0))))

; Задача 4
(define (get-rows M)
  M)

(define (get-columns M)
  (get-rows (transpose M)))

(define (get-diagonal M)
  (map
    (lambda (index row)
       (nth index row))
    (range 0 (- (length M) 1)) M))

(define (get-secondary-diagonal M)
  (get-diagonal (map reverse M)))

; Правим списък от списъци от всичко, което ни е нужно
; Трансформираме ги в сумите им и гледаме дали са еднакви
(define (magic-square? M)
  (same?
    (map sum
      (append
        (get-rows M)
        (get-columns M)
        (list (get-diagonal M))
        (list (get-secondary-diagonal M))))))

(assert-true? (magic-square? (list (list 23 28 21) (list 22 24 26) (list 27 20 25))))
(assert-false? (magic-square? (list (list 1 2 3) (list 4 5 6) (list 7 8 9))))

;  Задача 5

(define (join glue items)
  (cond ((null? (cdr items)) (car items))
        (else (string-append (car items) glue (join glue (cdr items))))))

(define (repeat count item)
  (map
    (lambda (_) item)
    (range 1 count)))

(define (repeater str)
  (lambda (count glue)
    (join glue (repeat count str))))

(assert-equal? "asd wtf" (join " " (list "asd" "wtf")))
(assert-equal? (list "scheme" "scheme") (repeat 2 "scheme"))
(assert-equal? "Scheme Scheme Scheme" ((repeater "Scheme") 3 " "))
(assert-equal? "SchemeSchemeScheme" ((repeater "Scheme") 3 ""))
(assert-equal? "Scheme!!Scheme!!Scheme" ((repeater "Scheme") 3 "!!"))
(assert-equal? "I love Scheme I love Scheme I love Scheme" ((repeater "I love Scheme") 3 " "))
