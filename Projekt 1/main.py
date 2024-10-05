#kalkulator
def add(x,y):
    return x + y
def minus(x,y):
    return x - y
def multiu(x,y):
    return x * y
def devision(x,y):
    if y==0:
        return "nie można podzielić przez 0"
        
    else:
        return x/y
def main():
    while True:
        print("Co chcesz zrobić? 1:dodawanie , 2:dzielenie, 3:mnożenie, 4:dzielenie, 5:koniec") 
        dzialanie = input(" ")
        if dzialanie =='5':
            print("Koniec")
            break
        print("Pierwsza liczba: ")
        x = float(input(" "))
        print("Druga liczba: ")
        y = float(input(" "))
        
        if dzialanie == '1':
            print(add(x,y))
        elif dzialanie == '2':
            print(minus(x,y))
        elif dzialanie =='3':
            print(multiu(x,y))
        elif dzialanie =='4':
            print(devision(x,y))
        
if __name__ == "__main__":
    main()