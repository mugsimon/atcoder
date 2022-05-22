;; n×nのビンゴカードを取得
(define (get-bingo-card n)
  (let row-loop
      ((card '())
       (i 0))
    (if (= i n)
        (reverse card)
        (row-loop
         (cons (let col-loop
                   ((col '())
                    (j 0))
                 (if (= j n)
                     (reverse col)
                     (col-loop
                      (cons (cons (read) #f)
                            col)
                      (+ j 1))))
               card)
         (+ i 1)))))
;; ビンゴカードのn行目を取得
(define (get-row card n)
  (let loop ((card card)
             (i 0))
    (if (= i n)
        (car card)
        (loop (cdr card)
              (+ i 1)))))
;; ビンゴカードの~行目のn列を取得
(define (get-square row n)
  (let loop ((row row)
             (i 0))
    (if (= i n)
        (car row)
        (loop (cdr row)
              (+ i 1)))))
;; ビンゴカードのn行m列に穴が空いているか取得
(define (is-punch? card n m)
  (let* ((row (get-row card n))
         (square (get-square row m)))
    (get-punch square)))
;; ビンゴカードのマスの数字を取得
(define (get-num square)
  (car square))
;; ビンゴカードのマスが空いているか取得
(define (get-punch square)
  (cdr square))
;; ビンゴカードのマスが空くか確認
(define (is-punch? square b)
  (let ((num (get-num square))
        (punch (get-punch square)))
    (= num b)))       
;; ビンゴ用の数字の個数を取得
(define (get-bn)
  (read))
;; ビンゴ用の数字のリストを取得
(define (get-b n)
  (let loop ((b-lst '())
             (i 0))
    (if (= i n)
        b-lst
        (loop (cons (read) b-lst)
              (+ i 1)))))
;; ビンゴカードのヒットしているマスを探す
;; ヒット:そのマスに穴を開けたカードを返す
;; なし:そのままのカードを返す
(define (punch-card card b)
  (let row-loop
      ((card card)
       (punched-card '()))
    (if (null? card)
        (reverse punched-card)
        (row-loop
         (cdr card)
         (cons (let col-loop
                   ((col (car card))
                    (punched-col '()))
                 (if (null? col)
                     (reverse punched-col)
                     (col-loop
                      (cdr col)
                      (cons (let ((square (get-square)))
                              (if (is-punch? square b)
                                  (cons (get-num square)
                                        #t)
                                  square))
                            punched-col))))
               punched-card)))))
;; ビンゴカードに穴を開ける                      
(define (get-punch-card card b-lst)
  (if (null? b-lst)
      card
      (get-punch-card (punch-card card (car b-lst))
                 (cdr b-lst))))

(define (check-bingo punched-card)
  (or (let col-loop ((
          

  
             


    

;;(print (get-bingo-card 3))
