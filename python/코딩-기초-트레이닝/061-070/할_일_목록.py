# https://school.programmers.co.kr/learn/courses/30/lessons/181885

def solution(todo_list, finished):
    return [todo for todo, finish in zip(todo_list, finished) if not finish]