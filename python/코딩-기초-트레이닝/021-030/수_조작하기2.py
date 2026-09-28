# https://school.programmers.co.kr/learn/courses/30/lessons/181925

def solution(numLog):
    ret = ""
    for prev, next_ in zip(numLog[:-1], numLog[1:]):
        match next_ - prev:
            case 1:
                ret += 'w'
            case -1:
                ret += 's'
            case 10:
                ret += 'd'
            case -10:
                ret += 'a'
    return ret