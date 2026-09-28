# https://school.programmers.co.kr/learn/courses/30/lessons/181854

def solution(arr, n):
    for i in range(1-len(arr)%2, len(arr), 2):
        arr[i] += n
    return arr