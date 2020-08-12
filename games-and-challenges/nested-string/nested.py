
test_1 = "([]{}((}})))"
test_2 = "([]{}(()))"
test_3 = "([])"
test_4 = "([]{}()"
test_5 = "([]{}(()))"
test_6 = "()"
test_7 = "()()"


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
                if not open_[-1] == opener_for[t]:
                    res = False
        print(open_)
    return res 

print(test_string(test_1))
print(test_string(test_2))
print(test_string(test_3))
print(test_string(test_4))
print(test_string(test_5))
print(test_string(test_6))
print(test_string(test_7))
            


