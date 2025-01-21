time_way <- function(d1, d2, h, v_sand, n, theta1){
    d1 <- d1 * 3
    h <- h * 3
    v_sand <- v_sand * 1.466667
    theta1rad <- (90 - theta1) * 0.017453

    x <- d1 / tan(theta1rad)
    l1 <- sqrt((d1 ^ 2) + (x ^ 2))
    l2 <- sqrt(((h - x) ^ 2) + (d2 ^ 2))
    t = 1 / v_sand * (l1 + (n * l2))
    print(
        paste("Если спасатель начнёт движение под углом theta1, равным", theta1," градусам, он достигнет утопащего через", t," секунды"))
}

time_way(8, 10, 50, 5, 2, 39.413)
