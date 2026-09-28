# https://school.programmers.co.kr/learn/courses/30/lessons/181833

def solution(n):
    answer = [[0 for _ in range(n)] for __ in range(n)]
    for i in range(n):
        answer[i][i] = 1
    return answer