**Compile instruction**

1) Copy the content of the repo

2) Go in the downloaded folder through terminal

3) Write **make** to compile program

4) Write **./main.x x** to run the program where x=number of nodes of the tree

**Binary Search Tree**

In this exam we have to build a binary research tree using c++ language. The binary research tree is a  data structure useful to keep and find a huge number of contents. Each "fruit" of this tree, or node, is characterized by:

-> a pair: a couple of a **key** and a value, in my case are two integers

-> unique pointers: a defined type of pointers, **left** and **right**, that represent, eventually, the branches of tree that start from one node

-> pointer: **up** a pointer to proper node which key is next in the tree

To define a node I create a class named **tree_node** that in addiction to the items listed above, it contains also the constructors which is used to create a new node  in three different cases:

a) create a node from a pair and a pointer

b) create a node from a unique pointer

c) create a node from no args (default constructor)

To define a tree I create a class named **bst** that is templated on the pair and on the compare operator(std::less), the latter is used to distinguish between the key values. After define the standard constructors of the class, and the copy and move semantics, to confer a certain "movement" within the tree there is necessity to define the **iterators**, that is pointers useful to move inside the tree, through the nodes. 

Another class named  **__iterator** is used to define the above iterators. In this class I defined the **++,!=,==,*,->** operators useful to do simple operations on the tree.

To test the program I created a tree and I added several random key value nodes. After this, I balanced the tree with a simple function that takes the medium key value and starts to fill the the tree from this key value. In addiction, I built a tree with the **std::map**. At the end I tryed all these and I compare the results in terms of time.

Unfortunately it was not possible to appreciate the **log(N)** behavior for the balance tree search because I got some problems fidding the tree. In fact already with a number N=90 of nodes I noticed that my program takes a lot of time balancing the tree and getting the timing, most likely for some problems due to the recursive balance function. But at least I noticed that for all researchs based on the find() function :

\begin{equation} t_{balance}< t_{map} < t_{notbalance}  \end{equation}

**Class tree_node**

Public variables:

- an object of type ```std::pair`` (named `data`), it stores the object `key_type` and `value_type`
- Two `std::unique_ptr` to store addresses of two childs `right` and `left`
- a raw pointer to the parent node

**Class __iterator**

It stores a private raw pointer to a node (`current`) and allows movement in the three hierarchy and access to member functions and variables of each node. 

I defined a **custom constructor** that takes a raw pointer to node as an argument and a set of public **overloaded operators**:

- `operator*()` : dereference operator, it returns a reference to the derefered object of type tree_node contained in the Iterator
- `operator->()`: member-access operator, it returns the raw pointer to the objcet of the type tree_node contained in the Iterator 
- `operator++()`: pre-increment operator, it moves from one tree_node to the following tree_node 
- `operator++(int)`: post-increment operator defined by means of the pre-increment
- `operator==()`: logical equality, returns true if elements are equal
- `operator!=()`: logical inequality, returns true if elements are different 

**Class bst**

Private variables and functions:

- `std::unique_ptr<Node> root` :stores a unique pointer to the higher node in the hierarchy

- `compar`: it is a `std::less` compare operator

- `vector_fill_mid` : it's a function useful to fill the vector of key_value and to build the balance version tree, it is called by `balance()` function

Public variables and functions:

- `default` constructor
- copy and copy-assignment operator
- move constructor and move assigment operator 
- `begin()` and `cbegin()`, iterator and const_iterator storing the posistion of the current tree_node
- `end()` and `cend()` , iterator and const_iterator storing the end of the tree, for me a `nullptr`
- `void balance()`, function used to balance the tree, it first builds an ordered `std::vector<std::pair<const key_type, value_type>>`  and then calls the recursive function `vector_fill_mid`
- `std::pair<iterator,bool> insert (const std::pair<const key_type,value_type>&)` , function that inserts a new value in the tree starting from the root_node
- `std::pair<iterator,bool> emplace` function that inserts a new node into the container constructed in-place if there is no element with the key in the container
- `iterator find(const key_type& )` function that returns an iterator to the proper node, that is, the node that we're looking for
- `friend std::ostream& operator<<(std::ostream& ,const bst& )` overloads the operator put-to

