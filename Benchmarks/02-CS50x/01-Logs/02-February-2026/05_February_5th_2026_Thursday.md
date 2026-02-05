# Problem Set 2 – Day 5

**Objective:** Finish implementing and refining the credit card checksum and validation logic. view the [readme](../../02-Problem-sets/Pset_2/readme.md) here.

---

## Progress Made Today

1. **Digit multiplication and sum adjustment:**  
   - Implemented multiplication of every second digit from the right and summed the digits if the result exceeded 9.  

2. **Summing remaining digits:**  
   - Successfully summed the digits that were initially skipped, combining them with the processed digits for the full checksum calculation.  

3. **Variable management:**  
   - Preserved the original card number by assigning it to separate variables for different operations, ensuring no data loss during processing.  

4. **Card length calculation:**  
   - Implemented logic to calculate the number of digits in the card number efficiently.  

---

**Next Steps:**  
- Proceed with card type validation (AMEX, VISA, MasterCard) and finalize full credit card checker logic.  

**Code Reference:**  
[View the code here](../../02-Problem-sets/Pset_2/credit/credit.c)
