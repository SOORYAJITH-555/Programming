# algorithms.py
from collections import deque
import heapq
from settings import GRID_WIDTH, GRID_HEIGHT 

def get_neighbors_with_wraparound(grid, node):
    """Returns valid neighbors for a given node, considering maze wraparound."""
    x, y = node[0], node[1]
    
    neighbors = []
    rows = len(grid)
    cols = len(grid[0])

    for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
        new_x, new_y = x + dx, y + dy

        # Apply wraparound logic
        new_x = new_x % cols
        new_y = new_y % rows

        # Check if the new position is a path (0)
        if grid[new_y][new_x] == 0:
            neighbors.append((new_x, new_y))
    return neighbors

# --- BFS (Breadth-First Search) ---
def bfs(grid, start, goal):
    queue = deque([start]) 
    parent = {start: None} 

    while queue:
        current_node = queue.popleft()

        if current_node == goal:
            path = []
            while current_node != start:
                path.append(current_node)
                current_node = parent[current_node]
            path.reverse()
            return path

        for neighbor in get_neighbors_with_wraparound(grid, current_node): 
            if neighbor not in parent:
                parent[neighbor] = current_node
                queue.append(neighbor)
    return []

# --- A* (A-Star Search) ---
def manhattan_distance(pos1, pos2):
    """Calculates Manhattan distance heuristic, considering wraparound."""
    dx = abs(pos1[0] - pos2[0])
    dy = abs(pos1[1] - pos2[1])

    # Use constants for wraparound check
    dx = min(dx, GRID_WIDTH - dx)
    dy = min(dy, GRID_HEIGHT - dy)

    return dx + dy

def astar(grid, start, goal):
    rows = len(grid)
    cols = len(grid[0])
    
    pq = [(0, start)]
    came_from = {}
    g_score = {}
    
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 0:
                g_score[(c, r)] = float('inf')
    g_score[start] = 0

    while pq:
        f_cost, current = heapq.heappop(pq)

        if current == goal:
            path = []
            while current != start:
                path.append(current)
                current = came_from[current]
            path.reverse()
            return path

        for neighbor in get_neighbors_with_wraparound(grid, current):
            tentative_g_score = g_score.get(current, float('inf')) + 1

            if tentative_g_score < g_score.get(neighbor, float('inf')):
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                h_cost = manhattan_distance(neighbor, goal)
                f_cost = tentative_g_score + h_cost
                heapq.heappush(pq, (f_cost, neighbor))
    return []