# https://school.programmers.co.kr/learn/courses/30/lessons/181923

def find(arr, query):
    ret = float('inf')
    for i in range(query[0], query[1]+1):
        if arr[i] > query[2]:
            ret = min(arr[i], ret)
    return ret if ret != float('inf') else -1

def solution(arr, queries):
    return list(map(find, [arr]*len(queries), queries))