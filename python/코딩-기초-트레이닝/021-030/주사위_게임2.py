# https://school.programmers.co.kr/learn/courses/30/lessons/181930

def solution(a, b, c):
    if a!=b and b!=c and a!=c:
        level = 1
    elif a==b and b==c:
        level = 3
    else:
        level = 2
    ret = 1
    for i in range(1, level+1):
        ret *= a**i + b**i + c**i
    return ret