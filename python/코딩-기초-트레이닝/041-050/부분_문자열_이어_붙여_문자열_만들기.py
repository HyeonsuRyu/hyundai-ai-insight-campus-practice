# https://school.programmers.co.kr/learn/courses/30/lessons/181911

def solution(my_strings, parts):
    answer = ''
    for i in range(len(my_strings)):
        answer += my_strings[i][parts[i][0]:parts[i][1]+1]
    return answer