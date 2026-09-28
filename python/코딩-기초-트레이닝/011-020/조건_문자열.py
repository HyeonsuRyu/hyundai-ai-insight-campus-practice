# https://school.programmers.co.kr/learn/courses/30/lessons/181934
def solution(ineq, eq, n, m):
    if ineq == '<':
        if eq == '=':
            return 1 if n <= m else 0
        else:
            return 1 if n < m else 0
    else:
        if eq == '=':
            return 1 if n >= m else 0
        else:
            return 1 if n > m else 0