;; スペース
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

