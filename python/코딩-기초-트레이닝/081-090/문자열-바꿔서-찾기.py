# https://school.programmers.co.kr/learn/courses/30/lessons/181864

def solution(myString, pat):
    myString = myString.replace("A", "tmp")
    myString = myString.replace("B", "A")
    myString = myString.replace("tmp", "B")
    
    return 1 if pat in myString else 0