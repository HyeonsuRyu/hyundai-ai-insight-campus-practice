# https://school.programmers.co.kr/learn/courses/30/lessons/181830

def solution(arr):
    r = len(arr)
    c = len(arr[0])
    for i in range(len(arr)):
        arr[i] += [0]*max(0, r-c)
    arr += [[0]*c]*max(c-r, 0)
    return arr