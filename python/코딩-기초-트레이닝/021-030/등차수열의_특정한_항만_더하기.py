# https://school.programmers.co.kr/learn/courses/30/lessons/181931

def solution(a, d, included):
    a_cnt = sum([1 for include in included if include])
    d_cnt = sum([i for i, include in enumerate(included) if include])

    return a*a_cnt + d*d_cnt