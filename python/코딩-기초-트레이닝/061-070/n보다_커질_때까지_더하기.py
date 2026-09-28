# https://school.programmers.co.kr/learn/courses/30/lessons/181884

def solution(numbers, n):
    sum_ = 0
    for number in numbers:
        sum_ += number
        if sum_>n:
            return sum_