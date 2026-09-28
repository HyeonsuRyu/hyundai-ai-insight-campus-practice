# https://school.programmers.co.kr/learn/courses/30/lessons/181893

def solution(arr, query):
    for i, q in enumerate(query):
        if i%2:
            arr = arr[q:]
        else:
            arr = arr[:q+1]
    return arr