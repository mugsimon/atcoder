;; ビンゴのマスを作成
(define (make-bingo-square num is-punch)
  (cons num is-punch))

;; ビンゴのマスの数字を取得
(define (get-square-num square)
  (car square))

;; ビンゴのマスの穴の状態を取得
(define (get-square-status square)
  (cdr square))

;; カードからijのマスを取得
(define (get-square card i j)
  (let ((n (sqrt (vector-length card))))
    (vector-ref card (+ (* i n) j))))

;; カードを取得
(define (get-card n)
  (let ((n (* n n)))
    (let loop ((i 0)
               (card '()))
      (if (= i n)
          (list->vector (reverse card))
          (loop (+ i 1)
                (cons (make-bingo-square (read) #f) card))))))

;; カードのijマスの数字を取り出す
(define (get-num-from-card card i j)
  (get-square-num (get-square card i j)))

;; カードのijマスが空いているか
(define (get-status-from-card card i j)
  (get-square-status (get-square card i j)))

;; マスと数字をもらい数字が一致すれば穴を開ける
(define (punch-square square num)
  (let ((square-num (get-square-num square)))
    (if (= square-num num)
        (make-bingo-square square-num #t)
        square)))

;; カードと数字のリストをもらい穴を開けたカードを返す
(define (punch-card card num-lst)
  (let loop ((card card)
             (num-lst num-lst))
    (if (null? num-lst)
        card
        (let ((num-vector (make-vector (vector-length card) (car num-lst))))
          (loop (vector-map punch-square card num-vector)
                (cdr num-lst))))))    

(define (check-bingo line)
  (if (

;; ビンゴを確認する
(define (check-bingo card)
  (let ((n (sqrt (vector-length card))))
    (or (let row-check ((i 0))
          (if (= i n)
              #t
              
