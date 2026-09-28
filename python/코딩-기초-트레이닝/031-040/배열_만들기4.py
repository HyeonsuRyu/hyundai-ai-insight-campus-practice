# https://school.programmers.co.kr/learn/courses/30/lessons/181918

def solution(arr):
    stk = []

    i = 0
    while i < len(arr):
        if not stk:
            stk.append(arr[i])
        else:
            if stk[-1] < arr[i]:
                stk.append(arr[i])
            else:
                stk.pop(len(stk)-1)
                continue
        i+=1
            
    return stk