def get_dist(pos1, pos2):
    return (pos1[0]-pos2[0])**2 + (pos1[1]-pos2[1])**2

def mergesplit(data, key):
    if len(data) == 1:
        return data
    else:
        mid = len(data) // 2
        left = mergesplit(data[:mid], key)
        right = mergesplit(data[mid:], key)
        return merge(left, right, key)

def merge(left, right, key):
    lp, rp = 0, 0
    result = list()
    pos = 0
    
    if key == "x":
        pos = 0
    elif key == "y":
        pos = 1
        
    while lp < len(left) and rp < len(right):
        if left[lp][pos] <= right[rp][pos]:
            result.append(left[lp])
            lp += 1
        else:
            result.append(right[rp])
            rp += 1
     
    result.extend(left[lp:])
    result.extend(right[rp:])
    return result

def closest_pair(data):
    if len(data) == 2:
        return get_dist(data[0], data[1])
    elif len(data) == 3:
        return min(get_dist(data[0], data[1]), get_dist(data[1], data[2]), get_dist(data[2], data[0]))
    else:
        mid = len(data) // 2
        left_pair_dist = closest_pair(data[:mid])
        right_pair_dist = closest_pair(data[mid:])
        
        d = min(left_pair_dist, right_pair_dist)
        
        mid_data = []
        for i in range(len(data)):
            temp = data[mid][0] - data[i][0]
            if temp**2 <= d:
                mid_data.append(data[i])

        mid_dist = d
        if len(mid_data) >= 2:
            mid_data = mergesplit(mid_data, key="y")
            for i in range(len(mid_data)-1):
                for j in range(i+1, len(mid_data)):
                    if (mid_data[i][1] - mid_data[j][1]) ** 2 > d:
                        break
                    elif mid_data[i][0] < data[mid][0] and mid_data[j][0] < data[mid][0]:
                        continue
                    elif mid_data[i][0] >= data[mid][0] and mid_data[j][0] >= data[mid][0]:
                        continue
                    mid_dist = min(mid_dist, get_dist(mid_data[i], mid_data[j]))

        return mid_dist

N = int(input())
coords = [list(map(int, input().split())) for _ in range(N)]

# 중복되는 점은 제거
# 블로그 참고
coords_set = list(set(map(tuple,coords)))
if len(coords_set) != len(coords):
    print("0")
else:
    coords_set.sort()
    print(closest_pair(coords_set))