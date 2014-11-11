(define test-matrix '((1 2 3) (4 5 6) (7 8 9)))

(define (row matrix n)
  (if (= n 0)
      (car matrix)
      (row (cdr matrix) (- n 1))))

(define (nth-element list n)
  (if (= n 0)
      (car list)
      (nth-element (cdr list) (- n 1))))

(define (column matrix n)
  (map  (lambda (row) (nth-element row n)) matrix))

(define (diagonal matrix)
  (define (diagonal-helper matrix current)
    (if (= current (length matrix))
        '()
        (cons (nth-element (row matrix current) current) (diagonal-helper matrix (+ current 1)))))
  (diagonal-helper matrix 0))

(define (add-matrix matrix1 matrix2)
  (cond
    ((and (null? matrix1) (null? matrix2)) '())
    (else (cons (add-row (car matrix1) (car matrix2)) (add-matrix (cdr matrix1) (cdr matrix2))))))

(define (add-row row1 row2)
  (if (and (null? row1) (null? row2))
      '()
      (cons (+ (car row1) (car row2)) (add-row (cdr row1) (cdr row2)))))

(define (scalar-product scalar matrix)
  (if (null? matrix)
      '()
      (cons (scalar-product-row scalar (car matrix)) (scalar-product scalar (cdr matrix)))))

(define (scalar-product-row scalar row)
  (map (lambda (x) (* scalar x)) row))

(define (transpose matrix)
  (transpose-helper matrix 0))

(define (transpose-helper matrix current)
  (if (= current (length matrix))
      '()
      (cons (column matrix current) (transpose-helper matrix (+ current 1)))))

(define (number-columns matrix)
  (if (null? matrix)
      0
      (length (row matrix 0))))

(define (number-rows matrix)
  (if (null? matrix)
      0
      (length (column matrix 0))))
  
(define (dot-product vector1 vector2)
  (if (null? vector1)
      0
      (+ (* (car vector1) (car vector2)) (dot-product (cdr vector1) (cdr vector2)))))

(define (matrix-multiply m1 m2)
  (map (lambda (row)
         (map (lambda (col) (dot-product row col))
              (transpose m2)))
       m1))

(define (matrix-power matrix n)
  (if (= n 1)
      matrix
      (matrix-multiply (matrix-power matrix (- n 1)) matrix)))

(define (delete-row matrix n)
  (delete-row-helper matrix n 0))

(define (delete-row-helper matrix n current)
  (cond
    ((= current (number-rows matrix)) '())
    ((= n current) (delete-row-helper matrix n (+ current 1)))
    (else (cons (row matrix current) (delete-row-helper matrix n (+ current 1))))))

(define (without list index)
  (cond
    ((null? list) '())
    ((= index 0) (without (cdr list) (- index 1)))
    (else (cons (car list) (without (cdr list) (- index 1))))))

(define (delete-column matrix n)
  (map (lambda (row) (without row n)) matrix))
