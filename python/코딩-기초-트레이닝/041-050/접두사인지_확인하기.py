# https://school.programmers.co.kr/learn/courses/30/lessons/181906

def solution(my_string, is_prefix):
    answer = 0
    if my_string.startswith(is_prefix):
        answer = 1
    return answer