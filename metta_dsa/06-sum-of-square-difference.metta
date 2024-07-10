; first n natural number sum of squares using amths formula

(: sum_of_squares (-> Number Number))
(= (sum_of_squares $n)
   (/ (* $n (* (+ $n 1) (+ 1 (* 2 $n)))) 6)
)

! (sum_of_squares 5) ; 1 + 4 + 9 + 16 + 25 = 55

; square of sum using reduced maths formula as well
(: square_of_sum (-> Number Number))
(= (square_of_sum $n)
   (* (/ (* $n (+ $n 1)) 2) (/ (* $n (+ $n 1)) 2))
)

! (square_of_sum 5) ; 1 + 2 + 3 + 4 + 5 = 15**2 = 225 expected

(: difference (-> Number Number))
(= (difference $n)
   (- (square_of_sum $n) (sum_of_squares $n))
)

! (difference 5) ; 225 - 55 = 170 expected