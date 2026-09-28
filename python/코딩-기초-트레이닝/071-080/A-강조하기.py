# https://school.programmers.co.kr/learn/courses/30/lessons/181874

def solution(myString):
    return ''.join([c.upper() if c=='a' else c.lower() if c != 'A' else c for c in myString])