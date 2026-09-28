# https://school.programmers.co.kr/learn/courses/30/lessons/181873

def solution(my_string, alp):
    return ''.join([c.upper() if c==alp else c for c in my_string])