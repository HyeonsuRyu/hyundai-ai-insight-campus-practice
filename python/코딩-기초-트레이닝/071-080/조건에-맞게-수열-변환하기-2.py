# https://school.programmers.co.kr/learn/courses/30/lessons/181881

def solution(arr, c=0):
    return c if arr == (nxt := [x//2 if x>=50 and x%2==0 else (x*2+1 if x<50 and x%2==1 else x) for x in arr]) else solution(nxt, c+1)