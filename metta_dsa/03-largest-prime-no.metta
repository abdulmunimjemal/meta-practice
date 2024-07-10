; put you code here

(: largest_prime_factor (-> Number Number Number))
(= (largest_prime_factor $x $d)
    (if (< $x 1) 
        (nil)
        (if (< $x (* $d $d))
            $x
            (if (== 0 (% $x $d))
                (largest_prime_factor (/ $x $d) $d)
                (largest_prime_factor $x (+ $d 1))
                )))
)

! (largest_prime_factor 12 2)