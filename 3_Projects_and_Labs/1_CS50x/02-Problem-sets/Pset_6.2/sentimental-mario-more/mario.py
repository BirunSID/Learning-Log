while True:
   try:
        height = int(input("Height: ")) # takes user input and then transforms it to integer.
        if 1 <= height <=8: # If input is 1 or greater and less than 8 or equal to it. then break out.
            break
   except ValueError:
        print("input must be a number from 1 to 8")
        

for i in range(height):
    initial_spaces_count = height - 1 - i # if the height is 8, the spaces for the # on the left will be 7.
    Left_spaces = ' ' * initial_spaces_count
    
    Hash_print_count = i+1
    hashes = '#' * Hash_print_count
    
    second_spaces = '  '
    
    print(Left_spaces + hashes + second_spaces + hashes)
    