# https://school.programmers.co.kr/learn/courses/30/lessons/181939

def solution(a, b):
    A = int(str(a) + str(b))
    B = int(str(b) + str(a))
    return max(A, B)