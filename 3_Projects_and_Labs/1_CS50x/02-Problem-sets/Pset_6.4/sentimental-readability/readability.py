
# main function here
def coleman():
    user_input = input("text: ")
    L = get_L(user_input)
    S = get_S(user_input)
    
    index = round(0.0588 * L - 0.296 * S - 15.8)
    
    if index >= 16:
        print("Grade 16+")
    elif index < 1:
        print("Before Grade 1")
    else:
        print(f"Grade {index}")
    
    
def get_L(text):
    word_list = text.split()
    words = len(word_list)
    
    letters = 0
    for char in text:
        if char.isalpha():
            letters += 1
            
    if words == 0:
        return 0
    
    return (letters/words) * 100

    
def get_S(text):
    word_list = text.split()
    words = len(word_list)
    
    sentence_counter = 0
    for char in text:
        if char in ".?!":
            sentence_counter += 1
    
    if words == 0:
        return 0
    
    return (sentence_counter/words) * 100
    
    
if __name__ == "__main__":
    coleman()