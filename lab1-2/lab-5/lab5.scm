(define (zip list1 list2)
  (cond
    ((null? list1) '())
    (else (cons (list (car list1) (car list2)) (zip (cdr list1) (cdr list2))))))

(define (scons elem list)
  (if (null? list)
      '()
      (cons (cons elem (car list)) (scons elem (cdr list)))))

(define (list-reduce op memo list)
  (if (null? list)
      memo
      (list-reduce op (op memo (car list)) (cdr list))))

(define (take list n)
  (take-helper list 0 n))

(define (take-helper list current n)
  (if (= current n)
      '()
      (cons (car list) (take-helper (cdr list) (+ current 1) n))))

(define (drop list n)
  (drop-helper list 0 n))

(define (drop-helper list current n)
  (cond
    ((null? list) '())
    ((< current n) (drop-helper (cdr list) (+ current 1) n))
    (else (cons (car list) (drop-helper (cdr list) (+ current 1) n)))))

(define (all? list pred?)
  (cond
    ((null? list) #t)
    ((pred? (car list)) (all? (cdr list) pred?))
    (else #f)))

(define (any? list pred?)
  (cond
    ((null? list) #f)
    ((pred? (car list)) #t)
    (else (any? (cdr list) pred?))))

(define (sublist list start end)
  (sublist-helper list 0 start end))

(define (sublist-helper list current start end)
  (cond
    ((null? list) '())
    ((and (>= current start) (<= current end)) (cons (car list) (sublist-helper (cdr list) (+ current 1) start end)))
    (else (sublist-helper (cdr list) (+ current 1) start end))))

(define (cartesian-product list1 list2)
  (cond
    ((null? list1) '())
    (else (append (scons (car list1) list2) (cartesian-product (cdr list1) list2)))))
