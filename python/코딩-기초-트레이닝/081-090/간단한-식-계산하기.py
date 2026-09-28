# https://school.programmers.co.kr/learn/courses/30/lessons/181865

def solution(binomial):
    a, op, b = binomial.split(" ")
    a, b = map(int, (a, b))
    match op:
        case "+":
            return a+b
        case "-":
            return a-b
        case "*":
            return a*b