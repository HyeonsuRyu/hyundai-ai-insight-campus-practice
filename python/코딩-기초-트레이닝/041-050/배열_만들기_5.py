# https://school.programmers.co.kr/learn/courses/30/lessons/181912

def solution(intStrs, k, s, l):
    return [int(int_str[s:s+l]) for int_str in intStrs if int(int_str[s:s+l]) > k]