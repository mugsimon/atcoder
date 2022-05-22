(define (ac_or_wa)
  (if (= (read) (read))
      (display "Yes")
      (display "No")))

;(ac_or_wa)
;;;

(define (comparing_strings)
  (let ((a (read))
        (b (read)))
    (if (< a b)
        (get-string a b)
        (get-string b a))))

(define (get-string a b)
  (let loop ((n b))
    (if (not (zero? n))
        (begin (display a)
               (loop (- n 1)))
        (newline))))
        
;(comparing_strings)    
;;;

(define (low-element)
  (let ((n (read)))
    (display (count-element n))))

(define (count-element n)
  (let loop ((min n)
             (i 1)
             (cnt 0))
    (if (= n i)
        (let ((a (read)))
          (if (<= a min)
              (+ cnt 1)
              cnt))
        (let ((a (read)))
          (if (<= a min)
              (loop a
                    (+ i 1)
                    (+ cnt 1))
              (loop min
                    (+ i 1)
                    cnt))))))

;(low-element)

;;;



