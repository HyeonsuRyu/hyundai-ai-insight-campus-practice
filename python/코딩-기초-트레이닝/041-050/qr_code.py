# https://school.programmers.co.kr/learn/courses/30/lessons/181903

def solution(q, r, code):
    return ''.join([c for i, c in enumerate(code) if i%q==r])