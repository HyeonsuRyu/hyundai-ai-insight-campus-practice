# https://school.programmers.co.kr/learn/courses/30/lessons/181862

import re

def solution(myStr):
    answer = re.split('[a-c]', myStr)
    i=0
    while i<len(answer):
        if answer[i] == '':
            answer.pop(i)
            continue
        i+=1
    return answer if answer else ['EMPTY']