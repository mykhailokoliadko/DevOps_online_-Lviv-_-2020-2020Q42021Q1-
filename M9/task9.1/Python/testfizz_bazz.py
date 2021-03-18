from fizz_buzz import some_func
max = 100
count = 5
while count < max:
        number = int(input("please give me a number: "))
        result = some_func(number)
        print("number is: " + result + ".")
        if number > max:
            print ("it's too much")
            break
