# https://school.programmers.co.kr/learn/courses/30/lessons/181834

import re

def solution(myString):
    return re.sub(r'[a-k]', 'l', myString)