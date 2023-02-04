
;; convert char to symbol
(define (char->symbol ch)
  (string->symbol (string ch)))

(define (string-split-values str dlr)
  (apply values (string-split str dlr)))

;; 
#;(define (string-split str . dlr)
  (if (string? str)
      (let ((dlr (if (null? dlr) " " (car dlr)))
            (str-len (string-length str)))
        (let loop ((start (- str-len 1))
                   (end str-len)
                   (str-lst '()))
          (cond ((zero? start)
                 (cons (substring str start end) str-lst))
                ((and (string=? (substring str start (+ start 1)) dlr)
                      (= (+ start 1) end))
                 (loop (- start 1)
                       (- end 1)
                       str-lst))
                ((string=? (substring str start (+ start 1)) dlr)
                 (loop (- start 1)
                       start
                       (cons (substring str (+ start 1) end) str-lst)))
                (else
                 (loop (- start 1)
                       end
                       str-lst)))))
      (error "string required, but got" str)))

(define (expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (expt b (/ n 2))))
        (else
         (* b (expt b (- n 1))))))

(define (get-digit n . dgt)
  (if (null? (cdr dgt))
      (let* ((dgt (car dgt))
             (div-num (expt 10 (- dgt 1)))
             (mod-num (expt 10 dgt)))
        (div (mod n mod-num) div-num))
      (let* ((dgt-min (car dgt))
             (dgt-max (cadr dgt))
             (mod-num-max (expt 10 dgt-max))
             (mod-num-min (expt 10 (- dgt-min 1))))
        (div (- (mod n mod-num-max)
                (mod n mod-num-min))
             mod-num-min))))



        
