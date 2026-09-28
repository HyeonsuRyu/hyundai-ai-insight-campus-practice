# https://school.programmers.co.kr/learn/courses/30/lessons/181880

memo = [-1] * 31
memo[1] = 0

def get_calc_cnt(n):
    if memo[n] != -1:
        return memo[n]
    if n%2:
        memo[n] = get_calc_cnt((n-1)//2) + 1
        return memo[n]
    memo[n] = get_calc_cnt(n//2) + 1
    return memo[n]
    

def solution(num_list):
    return sum([get_calc_cnt(n) for n in num_list])