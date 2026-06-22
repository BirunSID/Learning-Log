import math                         # imports math library

card = int(input("Number: "))       # takes card num input

sum = 0                             # starts sum at 0
card_app1 = card                    # copies card num
while card_app1 > 0:                # loops until all digs processed
    
     a = card_app1 % 10            # takes last dig
     sum = sum + a                 # adds last dig to the sum
     card_app1 = card_app1 // 10   # cuts off the last dig
       
     b = card_app1 % 10            # takes the 2nd last dig
     b = b * 2                     # multiplies with 2, in accordance to luhn algorithm
     temp_b = b                    # copies b
     while temp_b > 0:             # condition
         b = temp_b % 10                # takes the last dig because, if the digit is 5 or greater than it, the result is always 2 digit.
         sum = sum + b             # sums the last dig after 2 mult
         temp_b = temp_b // 10     # cuts off both the digits one by one so that we can escape the condition
     card_app1 = card_app1 // 10   # cuts off the 2nd last digit so we can continue,
    
if card == 0:                       # checks if card is 0
    card_length = 1                 # sets length to 1
else:                               # if card is not 0
    card_length = math.floor(math.log10(abs(card))) + 1 # calculates total length


# Amex & Master
card_app2 = card                    # copies card num
Am_Ma = card_length                 # sets length counter
Am_Ma -= 2                          # subtracts 2 for 2-dig prefix

while (Am_Ma > 0):                  # loops until first 2 digs remain
    card_app2 = card_app2 // 10     # cuts off last dig
    Am_Ma -= 1                      # decreases counter
    

# Visa
card_app3 = card                    # copies card num
Visa = card_length                  # sets length counter
Visa -= 1                           # subtracts 1 for 1-dig prefix

while (Visa > 0):                   # loops until first dig remains
    card_app3 = card_app3 // 10     # cuts off last dig
    Visa -= 1                       # decreases counter
    
    
if card_length in (13, 15, 16) and (sum % 10) == 0: # checks length and luhn validation
    if card_app2 in (34, 37):       # checks for AMEX prefix
        print("AMEX")               # prints AMEX
    elif card_app2 in (51, 52, 53, 54, 55): # checks for MASTERCARD prefix
        print("MASTERCARD")         # prints MASTERCARD
    elif card_app3 in (4, ):        # checks for VISA prefix
        print("VISA")               # prints VISA
    else:
        print("INVALID")                # prints INVALID
else:                               # if validation fails
    print("INVALID")                # prints INVALID