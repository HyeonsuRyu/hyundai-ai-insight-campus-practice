# https://school.programmers.co.kr/learn/courses/30/lessons/181902

def solution(my_string):
    answer = [0] * 52  # a-z: 0-25, A-Z: 26-51
    for char in my_string:
        if 'a' <= char <= 'z':
            answer[ord(char) - ord('a') + 26] += 1
        elif 'A' <= char <= 'Z':
            answer[ord(char) - ord('A')] += 1
    return answer