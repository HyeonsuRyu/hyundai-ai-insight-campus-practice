def solution(arr):
    try:
        s = arr.index(2)
        e = len(arr)-1-arr[::-1].index(2)
    except:
        return [-1]
    return arr[s:e+1]