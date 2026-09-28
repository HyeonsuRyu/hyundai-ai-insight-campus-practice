# https://school.programmers.co.kr/learn/courses/30/lessons/181835

def solution(arr, k):
    if k%2:
        for i in range(len(arr)):
            arr[i] *= k
    else:
        for i in range(len(arr)):
            arr[i] += k
    return arr