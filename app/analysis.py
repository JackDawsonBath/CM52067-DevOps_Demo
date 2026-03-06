
def count_letters(text: str) -> int:
    return len(text)

def count_words(text: str) -> int:
    return len(text.split(" "))

def count_lines(text:str) -> int:
    if not text:
        return 0
    return text.count("\n") # TODO: Fix off-by-one error. 

def analyse(text:str) -> dict:
    return {
        "letters":count_letters(text),
        "words":count_words(text),
        "lines":count_lines(text)
    }