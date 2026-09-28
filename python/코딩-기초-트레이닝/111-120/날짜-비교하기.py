# https://school.programmers.co.kr/learn/courses/30/lessons/181838

def solution(date1, date2):
    f = lambda x:x[0]*10000 + x[1]*50 + x[2]
    return 1 if f(date1) < f(date2) else 0