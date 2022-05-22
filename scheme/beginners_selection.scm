(define (welcome-to-atcoder)
  (let ((input-list (get-input-list)))
    (display (sum-of-list (cdr input-list)))
    (display " ")
    (display (car input-list))
    (newline)))

(define (get-input-list)
  (let loop ((input (read))
             (input-list '()))
    (if (eof-object? input)
        input-list
        (loop (read)
              (cons input input-list)))))

(define (sum-of-list lst)
  (let loop ((lst lst)
             (sum 0))
    (if (null? lst)
        sum
        (loop (cdr lst)
              (+ (car lst) sum)))))
   
(welcome-to-atcoder)

