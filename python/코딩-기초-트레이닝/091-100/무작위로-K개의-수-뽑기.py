# https://school.programmers.co.kr/learn/courses/30/lessons/181858

def solution(arr, k):
    i=0
    while i<len(arr):
        if arr[i] in arr[:i]:
            arr.pop(i)
            continue
        i+=1
    arr = arr[:k]
    arr += [-1] * (k-len(arr))
    return arr