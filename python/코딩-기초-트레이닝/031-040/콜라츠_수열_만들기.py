# https://school.programmers.co.kr/learn/courses/30/lessons/181919

def solution(n):
    answer = [n]

    while True:
        answer.append(3*answer[-1]+1 if answer[-1]%2 else answer[-1]//2)
        if answer[-1] == 1:
            return answer