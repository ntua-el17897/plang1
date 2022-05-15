// Kruskal's algorithm in C++
// kruskal implemetation taken from https://www.programiz.com/dsa/kruskal-algorithm
#include <algorithm>
#include <iostream>
#include <fstream>      // std::ifstream
#include <vector>
using namespace std;

#define edge pair<int, int>

class Graph {
private:
	vector<pair<int, edge> > G;  // graph
	vector<pair<int, edge> > T;  // mst
	int *parent;
	int V;  // number of vertices/nodes in graph
public:
	Graph(int V);
	void AddWeightedEdge(int u, int v, int w);
	int find_set(int i);
	void union_set(int u, int v);
	void kruskal();
	void print();
	void printResult();
};

Graph::Graph(int V) {
	parent = new int[V];

	//i 0 1 2 3 4 5
	//parent[i] 0 1 2 3 4 5
	for (int i = 0; i < V; i++)
		parent[i] = i;

	G.clear();
	T.clear();
}
void Graph::AddWeightedEdge(int u, int v, int w) {
	G.push_back(make_pair(w, edge(u, v)));
}
int Graph::find_set(int i) {
	// If i is the parent of itself
	if (i == parent[i])
		return i;
	else
		// Else if i is not the parent of itself
		// Then i is not the representative of his set,
		// so we recursively call Find on its parent
		return find_set(parent[i]);
}

void Graph::union_set(int u, int v) {
	parent[u] = parent[v];
}
void Graph::kruskal() {
	int  uRep, vRep;
	long unsigned int i;
	sort(G.begin(), G.end());  // increasing weight
	for (i = 0; i < G.size(); i++) {
		uRep = find_set(G[i].second.first);
		vRep = find_set(G[i].second.second);
		if (uRep != vRep) {
			T.push_back(G[i]);  // add to tree
			union_set(uRep, vRep);
		}
	}
}

void Graph::print() {
	cout << "Edge :"
		 << " Weight" << endl;
	for (long unsigned int i = 0; i < T.size(); i++) {
		cout << T[i].second.first << " - " << T[i].second.second << " : "
			 << T[i].first;
		cout << endl;
	}
}

void Graph::printResult() {
	// cout << "Edge :"
	// 	 << " Weight" << endl;
	int max = T[0].first;
	for (long unsigned int i = 0; i < T.size(); i++) {
		// cout << T[i].second.first << " - " << T[i].second.second << " : "
		// 	 << T[i].first;
		// cout << endl;
		if (max < T[i].first) max = T[i].first;
	}
	printf("%d", max);
}

int main(int argc, char** argv) {
    // std::ifstream fileName(argv[1], std::ifstream::binary);
    FILE *fileName;
    fileName = fopen(argv[1],"r");
	int nodes, edges;
	int n1, n2, e;
	if(fscanf(fileName, "%d", &nodes)<0) perror("ti fash");
	if(fscanf(fileName, "%d", &edges)<0) perror("ti fash");
	Graph gr(nodes);
	for (int i = 0; i < edges; ++i) {
		if(fscanf(fileName, "%d", &n1)<0) perror("ti fash");
		if(fscanf(fileName, "%d", &n2)<0) perror("ti fash");
		if(fscanf(fileName, "%d", &e)<0) perror("ti fash");
		gr.AddWeightedEdge(n1, n2, e);
	}
	gr.kruskal();
	gr.printResult();

	// Graph g(6);
	// g.AddWeightedEdge(0, 1, 4);
	// g.AddWeightedEdge(0, 2, 4);
	// g.AddWeightedEdge(1, 2, 2);
	// g.AddWeightedEdge(1, 0, 4);
	// g.AddWeightedEdge(2, 0, 4);
	// g.AddWeightedEdge(2, 1, 2);
	// g.AddWeightedEdge(2, 3, 3);
	// g.AddWeightedEdge(2, 5, 2);
	// g.AddWeightedEdge(2, 4, 4);
	// g.AddWeightedEdge(3, 2, 3);
	// g.AddWeightedEdge(3, 4, 3);
	// g.AddWeightedEdge(4, 2, 4);
	// g.AddWeightedEdge(4, 3, 3);
	// g.AddWeightedEdge(5, 2, 2);
	// g.AddWeightedEdge(5, 4, 3);
	// g.kruskal();
	// g.print();
	// g.printResult();
	return 0;
}