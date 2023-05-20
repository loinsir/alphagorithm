V, E = list(map(int, input().split()))
graph = {
    "vertices": [x+1 for x in range(V)],
    "edges": []
}

for _ in range(E):
    node1, node2, weight = list(map(int, input().split()))
    graph["edges"].append((weight, node1, node2))

parent = dict()
rank = dict()
def make_set(node):
    parent[node] = node
    rank[node] = 0
    
def find(node):
    if parent[node] != node:
        parent[node] = find(parent[node])
    return parent[node]

def union(node1, node2):
    root1 = find(node1)
    root2 = find(node2)
    
    if rank[root1] > rank[root2]:
        parent[root1] = root2
    else:
        parent[root2] = root1
        if rank[root1] == rank[root2]:
            rank[root1] += 1

def kruskal(graph):
    mst = list()
    
    for node in graph["vertices"]:
        make_set(node)
        
    edges = sorted(graph["edges"], key=lambda x: x[0])
    for edge in edges:
        node1 = parent[edge[1]]
        node2 = parent[edge[2]]
        
        if find(node1) != find(node2):
            union(node1, node2)
            mst.append(edge)
            
    return mst

print(sum([x[0] for x in kruskal(graph)]))