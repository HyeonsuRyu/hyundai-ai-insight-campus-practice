# https://school.programmers.co.kr/learn/courses/30/lessons/181860

def solution(arr, flag):
    answer = []
    for n, f in zip(arr, flag):
        if f:
            answer += [n]*(n*2)
        else:
            answer = answer[:-1*n]
    return answer