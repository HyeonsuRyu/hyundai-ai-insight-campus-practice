# https://school.programmers.co.kr/learn/courses/30/lessons/181856

def solution(arr1, arr2):
    if len(arr1)==len(arr2) and sum(arr1)==sum(arr2):
        return 0
    max_ = max(arr1, arr2, key=lambda x:(len(x), sum(x)))
    if arr1==max_:
        return 1
    return -1