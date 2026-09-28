# https://school.programmers.co.kr/learn/courses/30/lessons/181839

def solution(a, b):
    if a%2 and b%2:
        return a*a+b*b
    elif not (a%2 or b%2):
        return max(a-b, b-a)
    else:
        return 2*(a+b)