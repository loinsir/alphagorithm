def solution(triangle):
    memoization = list()
    memoization.append(list())
    memoization[0].append(triangle[0][0])
    
    for row in range(1, len(triangle)):
        tmp_list = list()
        tmp_list.append(triangle[row][0] + memoization[row-1][0])
        
        for col in range(1, len(triangle[row])):
            if col == len(triangle[row])-1:
                tmp_list.append(triangle[row][col] + memoization[row-1][col-1])
            else:
                tmp_list.append(triangle[row][col] + max(memoization[row-1][col], memoization[row-1][col-1]))
        memoization.append(tmp_list)
        
    return max(memoization[-1])