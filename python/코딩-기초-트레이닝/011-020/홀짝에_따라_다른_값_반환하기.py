# https://school.programmers.co.kr/learn/courses/30/lessons/181935?language=python3
def solution(n):
    return sum(range(1, n+1, 2)) if n%2 else sum([i**2 for i in range(2, n+1, 2)])