# https://school.programmers.co.kr/learn/courses/30/lessons/181831

import numpy as np

def solution(arr):
    arr = np.array(arr)
    return 1 if (arr.T == arr).all() else 0