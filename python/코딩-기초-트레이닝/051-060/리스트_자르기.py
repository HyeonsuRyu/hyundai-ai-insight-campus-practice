# https://school.programmers.co.kr/learn/courses/30/lessons/181897

def solution(n, slicer, num_list):
    start, end, step = slicer
    if n == 1:
        return num_list[:end+1]
    elif n == 2:
        return num_list[start:]
    elif n == 3:
        return num_list[start:end+1]
    else:
        return num_list[start:end+1:step]