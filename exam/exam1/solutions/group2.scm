; Решения на втора група от контролното

; Задача 1
(load "../test-framework.scm")
(load "../functools.scm")

(define (is-divisible? a n)
  (= (remainder a n) 0))

(define (sum-of-divisors n)
  (define (sum-of-divisors-iter n current-divisor result)
    (cond
      ( (< n current-divisor) result )
      ( (is-divisible? n current-divisor) (sum-of-divisors-iter n (+ current-divisor 1) (+ result current-divisor) ) )
      (else (sum-of-divisors-iter n (+ current-divisor 1) result ))))
  (sum-of-divisors-iter n 1 0))

; Връща сумата на делитеите на число, без самото него
(define (divisors-without-n n)
    (- (sum-of-divisors n) n))

(assert-equal? 284 (divisors-without-n 220))
(assert-equal? 220 (divisors-without-n 284))

(define (interesting? n)
  (let* ( (k (divisors-without-n n))
            (dk (divisors-without-n k)) )
    (= n dk)))

(assert-true? (interesting? 220))
(assert-true? (interesting? 284))

(define (sum-interesting k)
  (sum (filter interesting? (range 1 k))))

(assert-equal? 538 (sum-interesting 400))
(assert-equal? 34 (sum-interesting 30))

; Задача 2

(define (row-to-zero row)
  (map (lambda (_) 0) row))

; Трансформиране матрицата според зададеното правило
; Ако видим ред, в който има 0, го заместваме само с 0ли
(define (zero M)
    (map
      (lambda (row)
        (if (member? 0 row)
            (row-to-zero row)
            row)) M))

(assert-equal? (list (list 0 0 0) (list 3 4 1) (list 0 0 0) (list 4 2 4)) (zero (list (list 1 2 0) (list 3 4 1) (list 0 5 7) (list 4 2 4))))

; Задача 3
(define (sum-of-digits n)
  (cond ((= n 0) 0)
        (else (+ (remainder n 10) (sum-of-digits (quotient n 10))))))

(assert-equal? 6 (sum-of-digits 123))

(define (contains-digit? digit number)
  (member? digit (number->list number)))

(assert-true? (contains-digit? 1 123))
(assert-true? (contains-digit? 0 1230))

(define (repeat count item)
  (map
    (lambda (_) item)
    (range 1 count)))

; Изпълняваме условията поред на тяхната важност
; Повтаряме малко код, за да изгегнем сложен израз с and / or
; Горната ни граница за числото n, е числото с n на брой 1ци в записа си
; Например за n = 5, горната граница е 11111
; За n = 9, имаме 111111111
; Това се отразява в променливата limit
(define (digits-sum n)
  (define (iter i limit res)
    (cond ((> i limit) res)
              ((contains-digit? 0 i)  (iter (inc i) limit res))
              ((= (sum-of-digits i) n) (iter (inc i) limit (+ i res)))
              (else (iter (inc i) limit res))))
(iter 1 (list->number (repeat n 1)) 0))

(assert-equal? 17891 (digits-sum 5))

; Задача 4
; Две числа са пермутация едно на друго (като гледаме цифрите),
; Когато списъците от техните цифри, сортирни, съвпадат
; Нека да имаме 2211 и 1212
; имаме (2 2 1 1) и (1 2 1 2) като списъците от цифрите
; Когато ги сортираме, получаваме (1 1 2 2) (1 1 2 2) => са пермутация
; Решението след това е лесно

(define (all-permutations? items)
  (same?
    (map sort
      (map number->list items))))

(assert-true? (all-permutations? (list 123 321 231)))
(assert-false? (all-permutations? (list 543 345 123)))
(assert-false? (all-permutations? (list 12345 54321 32514 12353)))
(assert-true? (all-permutations? (list 123123123 321321213)))

; Задача 5

(define (cycle-list times items)
  (let ( (reversed (reverse items)) )
    (cond
      ((= times 0) items)
      (else (cycle-list (dec times) (cons (car reversed) (reverse (cdr reversed))))))))

(assert-equal? (list 4 1 2 3) (cycle-list 1 (list 1 2 3 4)))
(assert-equal? (list 3 4 1 2) (cycle-list 2 (list 1 2 3 4)))
(assert-equal? (list 2 3 4 1) (cycle-list 3 (list 1 2 3 4)))

; Връща индексът на първото срещане на item в items
(define (index-of item items)
  (define (iter current-index items)
    (cond
          ((null? items) -1)
          ((= (car items) item) current-index)
          (else (iter (inc current-index) (cdr items)))))
(iter 0 items))

(assert-equal? 0 (index-of 1 (list 1 1 1)))
(assert-equal? 2 (index-of 4 (list 1 2 4)))
(assert-equal? -1 (index-of 4 (list 1 2 3)))

(define (cycle times items)
  (lambda (item) (index-of item (cycle-list times items))))

(assert-equal? 2 ((cycle 3 (list 1 2 3 4)) 4))
(assert-equal? 0 ((cycle 4 (list 1 2 3 4)) 1))
