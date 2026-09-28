# https://school.programmers.co.kr/learn/courses/30/lessons/181921
def solution(l, r):
    ret = list()
    base = 1
    while True:
        number = int(bin(base)[2:])*5
        if number > r:
            return ret if ret else [-1]
        if number >= l:
            ret.append(number)
        base += 1

