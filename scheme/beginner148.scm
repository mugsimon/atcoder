(define (round-one)
  (display (- 6 (read) (read))))
;(round-one)

;;;;;;;;;;

(define (string-with-the-same-length)
  (read) 
  (let loop ((str1 (symbol->list (read)))
             (str2 (symbol->list (read))))
    (if (null? str1)
        (newline)
        (begin (display (car str1))
               (display (car str2))
               (loop (cdr str1)
                     (cdr str2))))))

(define (symbol->list sym)
  (string->list (symbol->string sym)))

;;(string-with-the-same-length)

;;;;;;;;;;;;;;;;;;;;;;;;;
(define (snack)
  (display (gcd (read) (read))))

(define (gcd a b)
  (/ (* a b) (lcd a b)))

(define (lcd a b)
  (if (< a b)
      (euclid a b)
      (euclid b a)))

(define (euclid a b) ;; a < b
  (let ((r (modulo b a)))
    (if (zero? r)
        a
        (euclid r a)))) 

;(snack)
;;;;;;;;;;;;;;;;;;;;;;;;
(define (brick-break)
  (let ((n (read)))
    (let loop ((i 1)
               (count 0)
               (lst '()))
      (let ((a (read)))
        (if (eof-object? a)
            (if (and (= i 1)
                     (null? lst))
                (display -1)
                (display count))
            (if (= i a)
                (loop (+ i 1)
                      count
                      (cons a lst))
                (loop i
                      (+ count 1)
                      lst)))))))
               
;(brick-break)
;;;;;;;;;;;;;;
(define (double-factorial)
  (define (f n)
    (let loop ((n n)
               (r 1))
      (if (< n 2)
          r
          (loop (- n 2) (* r n)))))
  (display (nzero? (f (read)))))

(define (f n)
  (let loop ((n n)
             (r 1))
    (if (< n 2)
        r
        (loop (- n 2) (* r n)))))

(define (nzero? n)
  (let loop ((count 0)
             (n n))
    (if (zero? (modulo n 10))
        (loop (+ count 1)
              (/ n 10))
        count)))
  
(double-factorial)

