# https://school.programmers.co.kr/learn/courses/30/lessons/181926

def solution(n, control):
    answer = n
    for cmd in control:
        match cmd:
            case 'w':
                answer += 1
            case 's':
                answer -= 1
            case 'd':
                answer += 10
            case 'a':
                answer -= 10
    return answer