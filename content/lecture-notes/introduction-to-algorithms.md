---
title: "Introduction to Algorithms"
date: 2020-10-22T12:45:54+05:30
draft: true
---

[Source](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/)

{{< youtube id="HtSuA80QTyo" >}}

> Efficient procedures to solve problems with large inputs.

Modules:
* Scalability - measure how our algorithms will react to larger and larger inputs.
* Classic data strutures & classical algorithms
* Real implementations in Python

Content: 8 modules
* Algorithmic Thinking; Peak finding
* Sorting & Trees; Event simulation
* Hashing; Genome comparison
* Numerics; RSA encryption
* Graphs; Rubik's cube
* Shortest path; Caltech to MIT
* Dynamic Programming; Image compression
* Advanced Topics


### Algorithmic Thinking; Peak finding
1-dimensional version
> Find a peak if it exists in this array
> [a,b,c,d,e,f,g,h,i]
> A peak is b iff: b >= c , b>= a

Gyan:
* Make algorithms that are more general
* Nice to have the argument: you searched exhaustively but couldn't find an answer with the given constraints.


#### Straightforward algorithm
- Start from the left
- Worst case complexity `theta(n)`, this is linear

```python3
# BEGIN
print("this")
# END
```

#### Divide and conquer algorithm
- This is a recursive algorithm
- Pick the middle element at n/2
- Look right and check if `n/2 <= n/2 + 1`, and then keep going right.
- Else look left and check if `n/2 <= n/2 -1`, and then keep going left.
- None of the above pass, then you've found your peak.



```
T(n) = T(n/2) + θ(1)
base case: T(1) = θ(1)
```
T(n) = θ(1) + ... θ(1) = θ(log base 2 n)

