(define (abc081b_shift_only)
  (let loop ((lst (get-number-list))
             (count 0))
    (if (find odd? lst)
        (print count)
        (loop (map (lambda (n) (/ n 2)) lst)
              (+ count 1)))))
    
(define (get-number-list)
  (let ((count (read)))
    (let loop ((count count)
               (lst '()))
      (if (zero? count)
          lst
          (loop (- count 1) (cons (read) lst))))))

(abc081b_shift_only)
