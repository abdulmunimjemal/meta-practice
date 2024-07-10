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

(= (prime_sum_below $x)
    (if (> $x 0)
        (if (is_prime $x -2) 
            (+ $x (prime_sum_below (- $x 1)))
            (+ 0 (prime_sum_below (- $x 1)))
        )
        0
    )
)


! (prime_sum_below 5)