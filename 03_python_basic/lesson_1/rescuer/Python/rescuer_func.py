import math as m


def time_way(d1, d2, h, v_sand, n, theta1):
    d1 = d1 * 3
    h = h * 3
    v_sand = v_sand * 1.466667
    theta1rad = (90 - theta1) * 0.017453

    x = float(d1) / m.tan(float(theta1rad))
    l1 = m.sqrt((float(d1) ** 2) + (x ** 2))
    l2 = m.sqrt(((float(h) - x) ** 2) + (float(d2) ** 2))
    t = 1 / float(v_sand) * (l1 + (float(n) * l2))
    print(
        f"Если спасатель начнёт движение под углом theta1, равным {theta1} градусам, он достигнет утопащего через {t} секунды")
