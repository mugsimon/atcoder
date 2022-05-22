(define (get-candidate-list)
  (let ((char-candidate-lst (string->list (symbol->string (read)))))
    (map char->symbol char-candidate-lst)))

(define (char->symbol ch)
  (string->symbol (string ch)))

(define (get-winner a-num b-num c-num)
  (let ((max-num (max a-num b-num c-num)))
    (cond ((= max-num a-num)
           'a)
          ((= max-num b-num)
           'b)
          ((= max-num c-num)
           'c)
          (else
           '()))))

(define (count-vote a-num b-num c-num candidate-list)
  (if (null? candidate-list)
      (get-winner a-num b-num c-num)
      (let ((vote (car candidate-list)))
        (cond ((eq? vote 'a)
               (count-vote (+ a-num 1) b-num c-num (cdr candidate-list)))
              ((eq? vote 'b)
               (count-vote a-num (+ b-num 1) c-num (cdr candidate-list)))
              ((eq? vote 'c)
               (count-vote a-num b-num (+ c-num 1) (cdr candidate-list)))
              (else
               (count-vote a-num b-num c-num (cdr candidate-list)))))))
  

(define (past202004_b)
  (print (count-vote 0 0 0 (get-candidate-list))))

(past202004_b)
