def solution(arr):
    answer = []
    for ele in arr:
        if len(answer) > 0:
            if answer[-1] != ele:
                answer.append(ele)
        else:
            answer.append(ele)
    return answer