# https://school.programmers.co.kr/learn/courses/30/lessons/181916

def solution(a, b, c, d):
    dic = dict()
    for n in (a, b, c, d):
        dic[n] = dic.get(n, 0) + 1

    match len(dic):
        case 1:
            return 1111*list(dic.keys())[0]
        case 2:
            A, B = dic.keys()
            if dic[A] == 2:
                return (A+B)* (max(A, B) - min(A, B))
            if dic[A] == 3:
                A, B = B, A
            return (10*B+A)**2
        case 3:
            A, B, C = dic.keys()
            if dic[A] == 2:
                return B * C
            if dic[B] == 2:
                return A * C
            return A * B
        case 4:
            return min(a, b, c, d)
    