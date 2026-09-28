# https://school.programmers.co.kr/learn/courses/30/lessons/181857

def solution(arr):
    target_len = 1
    while target_len<len(arr):
        target_len *= 2
    arr += [0] * (target_len-len(arr))
    return arr