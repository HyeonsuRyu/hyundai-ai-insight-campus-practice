# https://school.programmers.co.kr/learn/courses/30/lessons/181929

def solution(num_list):
    multiply = 1
    for n in num_list:
        multiply *= n
    return 1 if multiply < sum(num_list)**2 else 0