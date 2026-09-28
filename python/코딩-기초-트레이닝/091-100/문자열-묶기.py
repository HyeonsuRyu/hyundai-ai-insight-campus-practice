# https://school.programmers.co.kr/learn/courses/30/lessons/181855

from collections import Counter

def solution(strArr):
    return Counter(map(len, strArr)).most_common(1)[0][1]