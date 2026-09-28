# https://school.programmers.co.kr/learn/courses/30/lessons/181866

def solution(myString):
    lst = myString.split("x")
    i=0
    while i<len(lst):
        if lst[i]=='':
            lst.pop(i)
            continue
        i+=1
    return sorted(lst)