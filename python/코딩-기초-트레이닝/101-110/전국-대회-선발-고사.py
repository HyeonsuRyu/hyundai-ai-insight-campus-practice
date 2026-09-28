# https://school.programmers.co.kr/learn/courses/30/lessons/181851

def solution(rank, attendance):
    available = [(rank[i], i) for i in range(len(rank)) if attendance[i]]
    available.sort()
    
    a = available[0][1]
    b = available[1][1]
    c = available[2][1]
    
    return 10000 * a + 100 * b + c