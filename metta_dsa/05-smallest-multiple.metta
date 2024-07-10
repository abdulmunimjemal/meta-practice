(: gcd (-> Number Number Number))
(= (gcd $a $b)
    ( 
        if (== 0 $b)
        $a
        (gcd $b (% $a $b))
    )
)

! (gcd 4 2 )

(: lcm (-> Number Number Number))
(= (lcm $a $b)
    (/ (* $a $b) (gcd $a $b))    
)

! (lcm 4 2)

(= (multiple_with_lcm $n ()) ())
(= (multiple_with_lcm $n $curr $i) ; below 20
   ( if (> $i $n) 
        $curr
        (multiple_with_lcm $n (lcm $curr $i) (+ $i 1))
        )
)



! (multiple_with_lcm 10 1 2)
; second parameter indicates our current lcm, that's 1,
; our first parameter indicates the max (10)
 ; third parameter initiali 2- 10 (1,2,3,4,5,6,7,8,9,10) 