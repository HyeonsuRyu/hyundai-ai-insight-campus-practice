# https://school.programmers.co.kr/learn/courses/30/lessons/181914

def solution(number):
    while True:
        number = sum([int(n)%9 for n in str(number)])
        if number < 9:
            return number