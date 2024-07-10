; sum of all numbers lessthan or equal to the given number
; that are multiples of 3 or 5

( = (multiples $x)
    (
            case $x
            (
            (1 0)
           ($_ (if (or (== 0 (% $x 3)) (== 0 (% $x 5))) (+ $x (multiples (- $x 1))) (multiples (- $x 1))))
        ;($_ (+ $x (multiples (- $x 1))))
            )
    )
)

! (multiples 11) ; 10 + 9 + 6 + 5 + 3 = 33 