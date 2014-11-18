(define test-matrix '((1 2 3) (4 5 6) (7 8 9)))
(define test-matrix2 '((0.5 0.5 0.5) (0.75 0.75 0.75) (1 1 1)))

(define (row-reverse matrix)
  (map reverse-row matrix))

(define (reverse-row row)
  (if (null? row)
      '()
      (append (reverse-row (cdr row)) (list (car row)))))

(define (secondary-diagonal matrix)
  (secondary-diagonal-helper matrix (- (length (car matrix)) 1)))

(define (secondary-diagonal-helper matrix current)
  (if (< current 0)
      '()
      (cons (get-at current (car matrix)) (secondary-diagonal-helper (cdr matrix) (- current 1)))))

(define (get-at position list)
  (if (= position 0)
      (car list)
      (get-at (- position 1) (cdr list))))

(define (convolution matrix1 matrix2)
  (map (lambda (row1 row2)
         (map (lambda (elem1 elem2)
                (* elem1 elem2)) row1 row2)) matrix1 matrix2))

(define (same? list)
  (if (null? list)
      #t
      (same-helper list (car list))))

(define (same-helper list prev)
  (cond
    ((null? list) #t)
    ((equal? (car list) prev) (same-helper (cdr list) (car list)))
    (else #f)))

(define (list->number list)
  (list->number-helper list 0))

(define (list->number-helper list result)
  (if (null? list)
      result
      (list->number-helper (cdr list) (+ (* result 10) (car list)))))

(define (number->list number)
  (if (= number 0)
      '()
      (append (number->list (quotient number 10)) (list (remainder number 10)))))

(define (binary-search list value)
  (binary-search-helper list value 0 (- (length list) 1)))

(define (binary-search-helper list value start end)
  (let ((middle (quotient (+ start end) 2)))
    (cond
       ((> start end) -1)
       ((= value (get-at middle list)) middle)
       ((< value (get-at middle list)) (binary-search-helper list value start (- middle 1)))
       (else (binary-search-helper list value (+ middle 1) end)))))
  
(define (filter pred? list)
  (cond
    ((null? list) '())
    ((pred? (car list)) (cons (car list) (filter pred? (cdr list))))
    (else (filter pred? (cdr list)))))

(define (qsort list)
  (if (null? list)
      '()
      (append 
       (qsort (filter (lambda (x) (< x (car list))) (cdr list)))
       (cons (car list) '())
       (qsort (filter (lambda (x) (>= x (car list))) (cdr list))))))

(define (reverse-string string)
  (list->string (reverse-row (string->list string))))

(define (hamming-distance str1 str2)
  (let ((chars1 (string->list str1)) (chars2 (string->list str2)))
    (cond
      ((or (null? chars1) (null? chars2)) 0)
      ((equal? (car chars1) (car chars2)) (hamming-distance (list->string (cdr chars1)) (list->string (cdr chars2))))
      (else (+ 1 (hamming-distance (list->string (cdr chars1)) (list->string (cdr chars2))))))))