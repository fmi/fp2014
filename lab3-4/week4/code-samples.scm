(load "../test-framework.scm")
; Животът е списъци
; По колко начина може да създадем списък от 2 елемента?

; (list 1 2)
; (cons 1 (list 2))
; (cons 1 (cons 2 (list))


;(list) === празен списък
; проверяваме го с null? предиката
; (equal? проверява дали два списъка за еднакви)

; car и cdr - полъх от античността
; http://en.wikipedia.org/wiki/CAR_and_CDR
; http://en.wikipedia.org/wiki/S-expression
; първият елемент на списъка и останалите след това

; Два вида задачи:
; 1. Обхождама списък и искаме нещо с елементите
; 2. Построяваме списък в рекурсия

; Функцията връща списък от числата между [a,  b]
(define (range a b)
  (cond
    ((> a b) (list))
    (else (cons a (range (+ a 1) b)))))

(assert-equal? (list 1 2 3 4) (range 1 4))
(assert-equal? (list 1) (range 1 1))

; Намираме сумата на всички числа в списъка
(define (list-sum lst)
  (cond
    ((null? lst) 0)
    (else (+ (car lst) (list-sum (cdr lst))))))

(assert-equal? 55 (list-sum (range 1 10)))

; Връща първият елемент на списъка
(define (first list)
  (car list))

(assert-equal? 1 (first (list 1 2 3)))

; първа възможна имплементация
(define (last list)
  (first (reverse list)))

(assert-equal? 3 (last (list 1 2 3)))

; Имплементация с опашкова рекурсия
(define (last2 list)
  (define (last-iter list result)
    (cond
      ((null? list) result)
      (else (last-iter (cdr list) (car list)))))
  (last-iter list (car list)))

(assert-equal? 3 (last2 (list 1 2 3)))

; Имплементация със стандартна рекурсия
(define (last3 list)
  (cond
    ((null? (cdr list)) (car list))
    (else (last (cdr list)))))

(assert-equal? 3 (last3 (list 1 2 3)))

; Дължина на списък
; Имаме вграден length
(define (length2 list)
  (cond ((null? list) 0)
        (else (+ 1 (length2 (cdr list))))))

(assert-equal? 3 (length2 (list 1 2 3)))

; Проверява дали списъкът има само 1 елемент
(define (last? list)
  (null? (cdr list)))

(assert-equal? #t (last? (list 1)))
(assert-equal? #f (last? (list 1 2)))

; Намираме екстремен елемент в списъка
; Може да търсим най-голям, ако дадем max за compare-function
; Или най-малък, ако дадем min за compare-function
; Ако имаме списък с елементи (a, b, c, d), то функмцията създава такъв израз:
; (compare-function a (compare-function b (compare-function c d)))
; Ако compare-function е min, имаме:
; (min a (min b (min c d)))
(define (extreme-of-list list compare-function)
  (cond ((last? list) (car list))
        (else (compare-function (car list) (extreme-of-list (cdr list) compare-function)))))

(assert-equal? -10 (extreme-of-list (list 1 2 3 -10) min))
(assert-equal? 3 (extreme-of-list (list 1 2 3 -10) max))

(define (member? x list)
  (cond ((null? list) #f)
        (else (or (equal? x (car list)) (member? x (cdr list))))))

(assert-equal? #t (member? -10 (list 1 2 3 -10)))
(assert-equal? #f (member? -100 (list 1 2 3 -10)))
(assert-equal? #f (member? -10 (list)))

; Обръщаме списък
; Има вградена функция reverse
; Използваме хубавото свойство на опашковата рекурсия и cons
; Че строим списъкът на обратно ;)
(define (reverse2 l)
  (define (reverse-iter list result)
    (cond
      ((null? list) result)
      (else (reverse-iter (cdr list) (cons (first list) result)))))
    (reverse-iter l (list)))

(assert-equal? (list 3 2 1) (reverse2 (list 1 2 3)))
(assert-equal? (list) (reverse2 (list)))

; Взимаме първите n елемента от списъка
(define (take n l)
  (define (iter n list result)
    (cond
      ((null? list) result)
      ((= n 0) result)
      (else (iter (- n 1) (cdr list) (cons (car list) result)))))
  (reverse (iter n l (list))))

(assert-equal? (list 1 2 3) (take 3 (range 1 10)))
(assert-equal? (list 1 2 3) (take 10 (range 1 3)))

; Обратната функция на take
; Може да използваме take за реализацията
; Взимаме първите {ДЪЛЖИНА - n} елемнета на обърнатия списък
(define (drop n l)
  (reverse (take (- (length l) n) (reverse l))))

(assert-equal? (list 4 5 6) (drop 3 (list 1 2 3 4 5 6)))
(assert-equal? (list 1 2 3 4 5 6) (drop 30 (list 1 2 3 4 5 6)))

; Комбинираме два списъка, като събираме всеки i-ти елемент от първия, с всеки i-ти елемент от втория
; В нов списък
(define (zip list1 list2)
  (cond ((and (null? list1) (null? list2)) (list))
        (else (cons (list (car list1) (car list2)) (zip (cdr list1) (cdr list2))))))

(assert-equal? (list (list 1 2) (list 1 3) (list 1 4)) (zip (list 1 1 1) (list 2 3 4)))


; слепя две числа заедно
(define (glue-ints a b)
  (+ (* a 10) b))

(define (list->number l)
  (define (iter l result)
    (cond
      ( (null? l)  result )
      (else (iter (cdr l) (glue-ints result (car l))))))
  (iter l 0))

(assert-equal? 123 (list->number (list 1 2 3)))
(assert-equal? 123 (list->number (list 0 1 2 3)))

(define (number->list n)
  (define (iter n result)
    (cond ((= n 0) result)
          (else (iter (quotient n 10) (cons (remainder n 10) result)))))
  (iter n (list)))

(assert-equal? (list 1 2 3) (number->list 123))
