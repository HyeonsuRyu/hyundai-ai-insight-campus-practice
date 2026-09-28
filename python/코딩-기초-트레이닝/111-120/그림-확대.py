# https://school.programmers.co.kr/learn/courses/30/lessons/181836

def solution(picture, k):
    answer = []
    for row in picture:
        r = ""
        for c in row:
            r += c*k
        answer+=[r]*k
    return answer