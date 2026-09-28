# https://school.programmers.co.kr/learn/courses/30/lessons/181837

def solution(order):
    americano_cnt = 0
    latte_cnt = 0
    for o in order:
        if "americano" in o or "anything"==o:
            americano_cnt += 1
        else:
            latte_cnt += 1
            
    return 4500 * americano_cnt + 5000 * latte_cnt