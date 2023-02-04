;; スペースで区切られた入力を逆順にしたリストを作成する
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

;; make char list from s-char to e-char
(define (make-char-lst s-char e-char)
  (let ((s-char-int (char->integer s-char)))
    (let loop ((char-lst '())
               (e-char-int (char->integer e-char)))
      (if (= e-char-int s-char-int)
          (cons (integer->char e-char-int) char-lst)
          (loop (cons (integer->char e-char-int)
                      char-lst)
                (- e-char-int 1))))))

;; make A to Z char list
(define (make-AtoZ-char-lst)
  (make-char-lst #\A #\Z))

(define (make-vector2 k1 k2)
  (make-vector k1 (make-vector k2)))

(define (vector2-ref vec2 k1 k2)
  (vector-ref (vector-ref vec2 k1) k2))

(define (make-vectors . k-lst)
  (let ((k-lst (reverse k-lst)))
    (let loop ((k-lst (cdr k-lst))
               (vectors (make-vector (car k-lst))))
      (if (null? k-lst)
          vectors
          (loop (cdr k-lst)
                (make-vector (car k-lst) vectors))))))

(define (vectors-ref vecs . k)
  (let loop ((vecs vecs)
             (k k))
    (if (null? k)
        vecs
        (loop (vector-ref (car k))
              (cdr k)))))
