(define (id x)
  x)

(define (truth x)
  #t)

(define (lie x)
  #f)

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (range a b)
  (cond ((> a b) (list))
        (else (cons a (range (inc a) b)))))

(define (nth index list)
  (cond
    ((= index 0) (car list))
    (else (nth (- index 1) (cdr list)))))

(define (filter pred? l)
  (cond ((null? l) (list))
        ((pred? (car l)) (cons (car l) (filter pred? (cdr l))))
        (else (filter pred? (cdr l)))))

(define (reduce op start-value l)
  (cond ((null? l) start-value)
        (else (op (car l) (reduce op start-value (cdr l))))))

(define (sum l)
  (reduce + 0 l))

(define (product l)
  (reduce * 1 l))

(define (any? pred? l)
  (reduce (lambda (x y) (or x y)) #f (map pred? l)))

(define (all? pred? l)
  (reduce (lambda (x y) (and x y)) #t (map pred? l)))

(define (same? items)
  (cond
    ((null? items) #f)
    (else (let ((first-item (car items)))
               (all? (lambda (item) (equal? first-item item)) items)))))

(define (count x l)
  (reduce + 0 (map (lambda (y) (if (equal? x y) 1 0)) l)))

; Implementation of qsort
; Sorts a list of numbers in ascending order
(define (sort items)
  (cond ((null? items) (list))
        (else (append (sort (filter (lambda (x) (< x (car items))) (cdr items)))
                               (list (car items))
                               (sort (filter (lambda (x) (>= x (car items))) (cdr items)))))))
(define (glue-ints a b)
  (+ (* a 10) b))

(define (list->number l)
  (define (iter l result)
    (cond
      ( (null? l)  result )
      (else (iter (cdr l) (glue-ints result (car l))))))
  (iter l 0))

(define (number->list n)
  (define (iter n result)
    (cond ((= n 0) result)
          (else (iter (quotient n 10) (cons (remainder n 10) result)))))
  (iter n (list)))

(define (take n l)
  (define (iter n list result)
    (cond
      ((null? list) result)
      ((= n 0) result)
      (else (iter (- n 1) (cdr list) (cons (car list) result)))))
  (reverse (iter n l (list))))

(define (drop n l)
  (reverse (take (- (length l) n) (reverse l))))

(define (zip l1 l2)
  (map (lambda (x y) (list x y)) l1 l2))
