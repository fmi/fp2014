(load "../../test-framework.scm")

(define (take n l)
  (define (iter n list result)
    (cond
      ((null? list) result)
      ((= n 0) result)
      (else (iter (- n 1) (cdr list) (cons (car list) result)))))
  (reverse (iter n l (list))))

(define (prefix? list1 list2)
  (equal? list1 (take (length list1) list2)))

(announce "prefix?")
(assert-equal? #t (prefix? (list 1 2 3) (list 1 2 3 4)))
(assert-equal? #f (prefix? (list 1 2) (list 3 4)))
(assert-equal? #t (prefix? (list 1) (list 1)))

(define (sublist? list1 list2 )
  (cond ((null? list2) #f)
        ((prefix? list1 list2) #t)
        (else (sublist? list1 (cdr list2)))))

(announce "sublist?")
(assert-equal? #t (sublist? (list 1 2) (list 3 4 1 2)))
(assert-equal? #f (sublist? (list 1 2) (list 3 4)))

; Един низ е подниз на друг низ ако
; Списъкът от символите му е подсписък на символите на другия низ
(define (substring? str1 str2)
  (sublist? (string->list str1) (string->list str2)))

(announce "substring?")
(assert-equal? #t (substring? "Rado" "RadoRado"))
(assert-equal? #f (substring? "rado" "RadoRado"))
(assert-equal? #t (substring? "RadoRado" "RadoRado"))
(assert-equal? #t (substring? "ga" "HackBulgaria"))
