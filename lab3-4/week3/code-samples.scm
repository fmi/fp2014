; Зареждаме файл, с който може да илюстрираме дали всички неща, които пишем са верни
(load "../test-framework.scm")

; Функции от по-висок ред - Higer Order Functons
; Функция, която взима друга функция за параметър
; Или връща функция за резултат
; Или прави и двете

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

; идентитен
(define (id x) x)

; връща винаги true
(define (truth x) #t)

; Взимаме функция на един аргумент и аргумент
; Изпълняваме тази функция два пъти
(define (twice f x)
  (f (f x)))

; Може да даваме имена на вече съществуващи функции
(assert-equal? 5(twice inc 3))

; Може и да създаваме така-наречените анонимни функции - lambda функции
(assert-equal? 625 (twice (lambda (x) (* x x)) 5))

; Функция, която взима функция на два параметъра (операция)
; И я прилага върху a и b
(define (calc oper a b)
  (oper a b))

; Може да даваме стандартните оператори за събиране и умножение
(assert-equal? 3 (calc + 1 2))
(assert-equal? 15 (calc * 3 5))

; Може да дадем и ламбда функция, която приема два аргумента
(assert-equal? 5 (calc (lambda (x y) (+ (* x x) (* y y))) 1 2 ))

; Ламбда функциите може да правим няколко неща с тях:
; 1. Да я дадем като аргумент на функция от по-висок ред
; 2. Да я върнем като резултат от функция
; 3. Да я изпълним намясто:

; Тук изпълняваме нашата ламбда на място
(assert-equal? 4 ( (lambda (x) (* x x)) 2))


; Това е функция, която връща функция
(define (inc-x x)
  (lambda () (+ x 1)))

; това е функция
(inc-x 1)

; тук изпълняваме директно резултатът от функцията
(assert-equal? 2  ( (inc-x 1) ) )

; още примери за функции, които връщат функции:

(define (mult-x x)
  (lambda (y) (* x y)))

; Функция, която връща функция, която връща функция
(define (mult-x-y-z x)
  (lambda (y)
    (lambda (z) (* x y z))))

(assert-equal? 6 ( ( (mult-x-y-z 1) 2) 3))


; Това, което направихме по време на занятието е огромният абстрактен мастодонт aggregate
; Как стигнахме до него?

; Започнахме от сумата на числата в интервала [a, b]
; След това казахме, че искаме да сумираме квадратите на някое число
; След това стигнахме до идеята да сумираме:
; f(a) + f(a + 1) + f(a + 2) + ... + b, където f е функция, подадена от потребителя.

(define (sum-generic f a b)
  (define (iter a result)
    (cond
      ((> a b) result)
      (else (iter (inc a) (+ (f a) result)))))
(iter a 0))

(assert-equal? 55 (sum-generic id 1 10))
(assert-equal? 385 (sum-generic (lambda (x) (* x x)) 1 10))


; След това си зададохме въпроса какво правим, ако искаме произведение?
; И започнахме да изнассяме всички операции, които ни ограничават по 1 или друг начин
; Като функции в параметрите
; Делегираме отговорността на потребителя

; Крайният резулат е:

(define (aggregate oper term pred? next a b start-value)
  ; Вътрешна функция, която ни помага по-лесно да сметнем резултата
  (define (get-result a prev-result)
    (cond
        ((pred? a) (oper (term a) prev-result))
        (else prev-result)))

  ; вътрешната функция, която прави опашковата рекурсия
  (define (iter a result)
    (cond
      ((> a b) result)
      (else (iter (next a) (get-result a result)))))
(iter a start-value))

; Сега пресмятаме факториел чрез aggregate
(define (fact n)
  (aggregate * id truth inc 1 n 1))

(assert-equal? 1 (fact 1))
(assert-equal? 120 (fact 5))

; Сега правим сумата на числата в интервала [a, b] чрез aggregate
(define (sum a b)
  (aggregate + id truth inc a b 0))

(assert-equal? 55 (sum 1 10))

; Сега правим сумата на четните числа в интервала [a, b]

(define (sum-even a b)
  (aggregate + id even? inc a b 0))

(assert-equal? 30 (sum-even 1 10))


