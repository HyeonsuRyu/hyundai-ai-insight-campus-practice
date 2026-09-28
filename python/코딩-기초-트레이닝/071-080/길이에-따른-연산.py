# https://school.programmers.co.kr/learn/courses/30/lessons/181879

def solution(num_list):
    mul = 1
    if len(num_list) >= 11:
        return sum(num_list)
    for n in num_list:
        mul *= n
    return mul