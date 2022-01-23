# NicksDataStructures

A collection of Swift data structures.

 - LinkedList
     - A double linked list
 - Queue
     - A regular queue with enque and deque functions. Built on top of LinkedList to allow for O(1) enque and deque.
 - Heap
     - A generic Heap data structure built using an array to mimic a tree structure. Allows for custom comparators using the sort property in the structure's initializer. Most operations are O(log(n)), except for the first property (basically getMax or getMin) which is O(1) and contains which is O(n) (which just wraps Swift Array's contains method for simplicity)
 - PriorityQueue
    - A wrapper for the heap data structure but with queue like methods like enque and deque.
 - Array Extension
    - Just me messing around with some in-place sort methods.
 - String Extension
    - Again just me doing some practice problems.
