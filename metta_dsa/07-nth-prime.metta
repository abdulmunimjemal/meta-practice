(= (is_prime $n $d)
    ( if (<= $n 1)
        False
        (if (or (== $d 1) (<= $n 3))
                True
                (if (== 0 (% $n $d))
                     False
                     (if (== -2 $d) (is_prime $n (- $n 2)) (is_prime $n (- $d 1)))
            )
        )
    )
)

(= (nth_prime $n $count $candidate)  ; $n - target $count=0 - $candidate=2
   (
    if (== $count $n)
       (- $candidate 1) ; countering the + 1 for every recursion even if prime
       (if (is_prime $candidate -2)
           (nth_prime $n (+ $count 1) (+ $candidate 1))
           (nth_prime $n $count (+ $candidate 1))
       )
   )
)

! (nth_prime 1 0 0) ; 2 3 5 