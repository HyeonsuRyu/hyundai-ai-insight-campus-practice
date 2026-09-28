# https://school.programmers.co.kr/learn/courses/30/lessons/181882

def solution(arr):
    ret = list()
    for n in arr:
        if n >= 50 and not n%2:
            ret.append(n//2)
        elif n<50 and n%2:
            ret.append(n*2)
        else:
            ret.append(n)
    return ret