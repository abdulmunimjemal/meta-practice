(
    = (sum_down $x)
    (
        case $x 
        (
         (0 0)
         (1 1)
         ($_ (+ $x (sum_down(- $x 1)))
        )
    )
  )
)

! (sum_down 5)

0 1 2 3 5