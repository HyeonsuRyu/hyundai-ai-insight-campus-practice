# https://school.programmers.co.kr/learn/courses/30/lessons/181868

def solution(my_string):
    while True:
        before = len(my_string)
        my_string = my_string.replace("  ", " ")
        if before == len(my_string):
            break
    return my_string.strip().split(" ")