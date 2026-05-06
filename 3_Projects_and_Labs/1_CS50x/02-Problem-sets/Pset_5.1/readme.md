# Inheritance
source distribution code ---> [click here](<inheritance dist/inheritance.c>)


## Problem to Solve
A person’s blood type is determined by two alleles (i.e., different forms of a gene). The three possible alleles are A, B, and O, of which each person has two (possibly the same, possibly different). Each of a child’s parents randomly passes one of their two blood type alleles to their child. The possible blood type combinations, then, are: OO, OA, OB, AO, AA, AB, BO, BA, and BB.

For example, if one parent has blood type AO and the other parent has blood type BB, then the child’s possible blood types would be AB and OB, depending on which allele is received from each parent. Similarly, if one parent has blood type AO and the other OB, then the child’s possible blood types would be AO, OB, AB, and OO.

## understanding the distribution code

First, we have added 4 header files: stdbool, stdio, stdlib and time.h. In this case, time is a new type of header I'm seeing for the first time.

Then above the 4 header files, we got `_DEFAULT_SOURCE`, #################################################

Then we have a custom datatype called `person`, we named this `person`, to call the data elements inside of it. It has 2 types of data here, one is the datatype itself, `person`. And the other is alleles character array. Both has a maximum of 2 elements. (*Each person has two parents and two alleles*)

next, we have 2 constants, `generations` and `indent_length` with respectively 3 and 4 as value.

next up is a function prototype called `person *create_family(int generations);` which is a pointer value. so we gotta work with memory and dynamic memory allocations. And it takes generations as integer.
`void print_family(person *p, int generation);` takes datype person as p pointer and generation as int.
`void free_family(person *p);` takes only datype person as p pointer.
`char random_allele();` ####################################################################


Now, we delve deeper into the main function.
first of all, we generate a random number using `srandom(time(0));` but the issue is that it returns the same number if we dont put `time(0)` here. With time(0), we can get every second since jan 1, 1970.
then we create a new family with three generations. `person *p = create_family(GENERATIONS);` (reminder: GENERATIONS here is different from generation from the prototype function.
`print_family(p, 0);`--->  this sends p and 0 to the print_family function.
`free_family(p);` ----> we free all the memories here.

Now, to the individual functions themselves. 

the first function is `person *create_family(int generations)`. now, we have the *TODO* here. first, *we will allocate memory for new person*. and if there are still generations left to create, we have a if function doing recursive calls to create 2 new parents for the person. we have 2 *TODOs* here.
and if there are none left to create, we have 2 *TODO*'s here.
and then, there is a TODO to return a newly created person.

the next function is `void free_family(person *p)`, we have 3 TODO's here. this is related to memory freeing.

Next up, we have `void print_family(person *p, int generation)`. return if p equals null. then we print indentation, which seems to be a blank space here.
next up, we print the person, blood type and his generation. if its 0, then its the kid, if its 1, its the parent, and if its 2, its the parent's parent or grandparents of the kid.

the last function is `char random_allele()`. This function is basically dividing random() by 3 to get a result of division, if its 0, then returns A and if its 1, then returns B and if its anything else besides 1 and 0, returns 0.

---

Overall, we have to work in `person *create_family(int generations)` and `void free_family(person *p)`.

## Begin work
