(= (is_prime $n $d)
    (
        (if (<= $n 1)
            False
            (
                (if (== $d 1)
                    True
                    (if (== 0 (% $n $d))
                        False
                        (if (== -2 $d) (is_prime $n (- $n 2)) (is_prime $n (- $d 1)))
                    )
                )
            )
        )
    )
)

! (is_prime 13 -2)