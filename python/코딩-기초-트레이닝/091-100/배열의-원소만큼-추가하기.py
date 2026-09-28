# https://school.programmers.co.kr/learn/courses/30/lessons/181861

def solution(arr):
    ret = list()
    for n in arr:
        ret += [n]*n
    return ret