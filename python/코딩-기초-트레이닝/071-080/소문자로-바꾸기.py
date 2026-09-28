# https://school.programmers.co.kr/learn/courses/30/lessons/181876

def solution(strArr):
    return [s.upper() if i%2 else s.lower() for i, s in enumerate(strArr)]