
test_1 = "([]{}((}})))" #false
test_2 = "([]{}(()))"   #true
test_3 = "([])"         #true
test_4 = "([]{}()"      #false
test_5 = "([]{}(())[])" #true
test_6 = "()"           #true   
test_7 = "()()"         #true


def test_string(string):
    open_ = ""
    # closing_chars = [")", "]", "}" ]
    opening_chars = ["(", "[", "{" ]
    opener_for = {')': '(', ']': '[', '}': '{' }
    # match = ["()", "[]", "{}"]
    res = True
    for t in string: 
        if t in opening_chars:
            open_ += t
            # print(open_)
        else:
            if len(open_) > 1:
                #open_[-1] == opener_for[open_[-1]]
                if open_[-1] == opener_for[t]:
                    open_ = open_[:-1]
                else:
                    res = False
    return res 

print(test_string(test_1))
print(test_string(test_2))
print(test_string(test_3))
print(test_string(test_4))
print(test_string(test_5))
print(test_string(test_6))
print(test_string(test_7))
            


