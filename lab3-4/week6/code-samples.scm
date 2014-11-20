(load "../test-framework.scm")

(define M (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

; map-а може да приема повече от 1 списък
; което е хубаво свойство
(define (zip l1 l2)
  (map (lambda (x y) (list x y)) l1 l2))

(define (reduce op start-value l)
  (cond ((null? l) start-value)
        (else (op (car l) (reduce op start-value (cdr l))))))

(define (sum l)
  (reduce + 0 l))

(define (nth index list)
  (cond
    ((= index 0) (car list))
    (else (nth (- index 1) (cdr list)))))

(define (range a b)
  (cond
    ((> a b) (list))
    (else (cons a (range (+ a 1) b)))))

(define (row index M)
  (nth index M))

(assert-equal? (list 1 2 3) (row 0 M))

; Освен имплементацията с nth, може да го напишем и сложно
(define (row-complicated index M)
  (reduce append (list)
    (map
      (lambda (i row)
        (if (= index i)
            row
            (list)))
      (range 0 (- (length M) 1))
      M)))

(assert-equal? (list 1 2 3) (row-complicated 0 M))

; Взимаме колона
(define (column index M)
  (map (lambda (row)
         (nth index row))
       M))

; Взимаме главниа диагонал
(define (diagonal M)
  (map (lambda (index row)
         (nth index row))
       (range 0 (- (length M) 1))
       M))

(assert-equal? (list 1 4 7) (column 0 M))

; Транспониране на матрици
(define (transpose M)
  (map (lambda (index)
         (column index M))
       (range 0 (- (length (car M)) 1))))

(assert-equal? (list (list 1 4 7) (list 2 5 8) (list 3 6 9)) (transpose M))

; Събираме две матрици
; За да разберете, вижте какво прави следния израз в REPL:
; (map + (list 1 2) (list 3 4))
(define (add-matrices M1 M2)
  (map (lambda (row1 row2)
         (map + row1 row2))
       M1
       M2))

(assert-equal? (list (list 2 4 6) (list 8 10 12) (list 14 16 18)) (add-matrices M M))

; Премахва н-ти елемент от списъка, като броим от 0
(define (remove-nth index-to-remove l)
  (define (iter current-index l result)
    (cond
      ((null? l) result)
      ((= index-to-remove current-index) (iter (+ current-index 1) (cdr l) result))
      (else (iter (+ current-index 1) (cdr l) (cons (car l) result)))))
  (reverse (iter 0 l (list))))

(assert-equal? (list 1 3) (remove-nth 1 (list 1 2 3)))

; Премахва ред по индекс
(define (remove-row index M)
  (remove-nth index M))

(assert-equal? (list (list 1 2 3) (list 4 5 6)) (remove-row 2 M))

; Премахва колона по индекс
(define (remove-column index M)
  (map (lambda (row)
              (remove-nth index row))
            M))

(assert-equal? (list (list 2 3) (list 5 6) (list 8 9)) (remove-column 0 M))

; Връща размерностите на матрицата
(define (dimensions M)
  (list (length M) (length (car M))))

(assert-equal? (list 3 3) (dimensions M))

; скаларно произведение на два вектора
(define (dot-product v1 v2)
  (sum (map * v1 v2)))

(assert-equal? (+ (* 1 2) (* 3 4)) (dot-product (list 1 2) (list 3 4)))
