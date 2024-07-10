( = (fibonacci $x)
    (
        case $x 
        (
            (0 0)
            (1 1)
            ($_ (+ (fibonacci (- $x 1)) (fibonacci (- $x 2))))
        )
    )
)

( = (even_fibonacci $x)
    (
        case $x
        (
            (0 0)
            (
                $_ ( if 
                        (== 0 (% (fibonacci $x) 2))  
                        (+ (fibonacci $x) (even_fibonacci (- $x 1)))
                        (even_fibonacci (- $x 1))
                )
            )
        )

    )
 )

 ! (even_fibonacci 11)