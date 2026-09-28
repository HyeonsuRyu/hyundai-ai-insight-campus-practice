# https://school.programmers.co.kr/learn/courses/30/lessons/181872

def solution(myString, pat):
    for i in range(len(myString)):
        if not (pat in myString[i:]):
            return myString[:i+len(pat)-1]
    else:
        return myString