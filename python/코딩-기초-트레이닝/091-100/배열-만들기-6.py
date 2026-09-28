# https://school.programmers.co.kr/learn/courses/30/lessons/181859

def solution(arr):
    answer = []
    i=0
    while i<len(arr):
        if not answer:
            answer.append(arr[i])
        elif answer[-1] == arr[i]:
            answer.pop()
        else:
            answer.append(arr[i])
        i+=1
    return answer if answer else [-1]