# https://school.programmers.co.kr/learn/courses/30/lessons/181932

def solution(code):
    answer = ''
    mode = 0
    for idx, c in enumerate(code):
        if c=='1':
            mode = 0 if mode else 1
        else:
            if not mode:
                answer += c if not idx%2 else ''
            else:
                answer += c if idx % 2 else ''
    
    return answer if answer else 'EMPTY'