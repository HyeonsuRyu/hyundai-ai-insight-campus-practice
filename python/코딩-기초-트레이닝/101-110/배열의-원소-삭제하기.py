# https://school.programmers.co.kr/learn/courses/30/lessons/181844

def solution(arr, delete_list):
    i=0
    while i<len(arr):
        if arr[i] in delete_list:
            arr.pop(i)
            continue
        i+=1
        
    return arr