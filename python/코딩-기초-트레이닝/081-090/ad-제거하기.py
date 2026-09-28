# https://school.programmers.co.kr/learn/courses/30/lessons/181870

def solution(strArr):
    i=0
    while i<len(strArr):
        if "ad" in strArr[i]:
            strArr.pop(i)
            continue
        i += 1
    return strArr