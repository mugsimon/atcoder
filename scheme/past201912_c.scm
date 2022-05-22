(define (get-input)
  (let loop((lst '()) (obj (read)))
    (if (eof-object? obj)
        lst
        (loop (cons obj lst) (read)))))

(define (past201912_c)
  (let ((input-lst (get-input)))
    (let ((sorted-input-lst (sort input-lst >)))
      (let ((sorted-input-vector (list->vector sorted-input-lst)))
        (print (vector-ref sorted-input-vector 2))))))

(past201912_c)
