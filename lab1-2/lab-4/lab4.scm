(define (list-length list)
  (if (null? list)
      0
      (+ 1 (list-length (cdr list)))))

(define (list-min list)
  (if (null? list)
      0
      (list-min-helper list (car list))))

(define (list-min-helper list min)
  (cond
    ((null? list) min)
    ((> min (car list)) (list-min-helper (cdr list) (car list)))
    (else (list-min-helper (cdr list) min))))

(define (list-member? a list)
  (cond
    ((null? list) #f)
    ((= a (car list)) #t)
    (else (list-member? a (cdr list)))))

(define (append-list list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse-list list)
  (if (null? list)
      '()
      (append (reverse-list (cdr list)) (cons (car list) '()))))

(define (map-list f list)
  (if (null? list)
      '()
      (cons (f (car list)) (map-list f (cdr list)))))

(define (filter-list pred? list)
  (cond
    ((null? list) '())
    ((pred? (car list)) (cons (car list) (filter-list pred? (cdr list))))
    (else (filter-list pred? (cdr list)))))
