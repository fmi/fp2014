(load "../test-framework.scm")

; Функции от по-висок ред в/у списъци

(define (inc x)
  (+ x 1))

(define (range a b)
  (cond ((> a b) (list))
        (else (cons a (range (inc a) b)))))

(assert-equal? (list 1 2 3 4) (range 1 4))

(define (map2 f l)
  (cond ((null? l) (list))
        (else (cons (f (car l)) (map2 f (cdr l))))))

(assert-equal? (list 2 3 4) (map2 inc (list 1 2 3)))
(assert-equal? (list) (map2 inc (list)))

(define (filter pred? l)
  (cond ((null? l) (list))
        ((pred? (car l)) (cons (car l) (filter pred? (cdr l))))
        (else (filter pred? (cdr l)))))

(assert-equal? (list 2 4 6) (filter even? (list 1 2 3 4 5 6)))

(define (reduce op start-value l)
  (cond ((null? l) start-value)
        (else (op (car l) (reduce op start-value (cdr l))))))

(assert-equal? 55 (reduce + 0 (list 1 2 3 4 5 6 7 8 9 10)))

; Факториел чрез range и reduce
(define (fact n)
  (reduce * 1 (range 1 n)))

(assert-equal? 1 (fact 0))
(assert-equal? 120 (fact 5))

; Сума на всички елементи в списъка

(define (sum l)
  (reduce + 0 l))

(assert-equal? 55 (sum (range 1 10)))

; Средно аритметично на елементи от списък

(define (avg l)
  (/ (sum l) (length l)))

(assert-equal? 1 (avg (list 1 1 1 1)))

; any? – връща true ако поне един от елементите в списъка отговаря на pred?

(define (any? pred? l)
  (reduce (lambda (x y) (or x y)) #f (map pred? l)))

(assert-equal? #t (any? even? (list 1 2 3)))
(assert-equal? #f (any? even? (list 1 3 5)))

; all? - връща true ако всички елементи отговарят на предиката

(define (all? pred? l)
  (reduce (lambda (x y) (and x y)) #t (map pred? l)))

(assert-equal? #t (all? even? (list 2 4 6)))
(assert-equal? #f (all? even? (list 1 2 4 6)))

; Намиране броя на всички срещания на x в l
(define (count x l)
  (reduce + 0 (map (lambda (y) (if (= x y) 1 0)) l)))

; Втора, алтернативна имплементация
(define (count2 x l)
  (length (filter (lambda (y) (= x y)) l)))

(assert-equal? 5 (count 5 (list 5 5 5 5 5)))
(assert-equal? 5 (count2 5 (list 5 5 5 5 5)))

; Връща само тези елементи в списъка, които се срещат по 1 път в него
(define (uniquely l)
  (filter (lambda (x) (= 1 (count x l))) l))

(assert-equal? (list 1 2 3) (uniquely (list 1 2 3 4 4 5 5 6 6)))
