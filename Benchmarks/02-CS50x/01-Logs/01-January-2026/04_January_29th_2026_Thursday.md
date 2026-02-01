# **PSET Day: Mario (More Comfortable)**

Dedicated today's session to starting **Problem Set 1**. The focus is `mario.c`, which requires simulating a double-sided pyramid using nested loops.

# **The Objective**
Build a program that prompts the user for a height between 1 and 8 (inclusive) and outputs a symmetric pyramid with a constant two-space gap.

**Target Output:**
```bash
    #  #
   ##  ##
  ###  ###
 ####  ####
```

# progress for today: 

- **Implementation:** Developed robust input validation using a `do-while` loop to enforce the height constraints (1–8).
- **Logic:** Established the primary nested loop structure, successfully calculating the inverse relationship between the row index and leading whitespace (`h - i - 1`).
- **Abstraction:** Integrated a custom `void` function to handle character rendering, focusing on modularizing the code for future expansion into the double-pyramid requirement.
- **Architecture:** Segregated source code into dedicated problem set directories to maintain a clean version history and professional repository structure.

---

> **Note:** For the full code implementation and logic breakdown, see the Problem Set 1 folder's [readme](../../02-Problem-sets/Pset_1/readme.md)

