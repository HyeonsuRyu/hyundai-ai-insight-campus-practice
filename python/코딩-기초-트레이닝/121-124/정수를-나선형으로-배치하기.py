# https://school.programmers.co.kr/learn/courses/30/lessons/181832

def solution(n):
    answer = [[None for _ in range(n)] for __ in range(n)]
    dirs = ((1, 0), (0, 1), (-1, 0), (0, -1))
    
    d_idx = 1
    r, c = 0, 0
    
    for num in range(1, n*n + 1):
        answer[r][c] = num
        
        dr, dc = dirs[d_idx]
        nr, nc = r + dr, c + dc
        
        if not (0 <= nr < n and 0 <= nc < n and answer[nr][nc] is None):
            d_idx = (d_idx - 1) % 4
            dr, dc = dirs[d_idx]
            nr, nc = r + dr, c + dc
            
        r, c = nr, nc
        
    return answer