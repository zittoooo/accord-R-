####변수생성(1)

a<- 1     # a에 1 할당(변수에 값을 배정)  =, <-, <<a 
a         # a 출력 
b <-2
print(b)



a+b 
#연산 가능 
4/b 
5*b
rm(b)          # rm() 불필요한 객체를 메모리에서 제거


var1 <- c(1, 2, 3, 4, 5)        #숫자 5개로 구성된 var1 생성 
var1 

1:5     # 1~5까지 연속된 일련번호를 생성
var2 <- c(1:5) #1-5까지 연속된 값으로 var2 생성 
var2 
var3 <- seq(1, 5)          #1-5까지 연속된 값으로 var2 생성
var3    
var4 <- seq(1, 10, by = 2)   #1~10까지 2간격으로 연속 값으로 var4 생성 
var4


######변수생성(2) 
  
str1 <- "a" #문자형 변수 생성
str1

str2 <- "text"
str2
str3 <- "Hello World" 
str3
str4 <- c("a", "b", "c")
str4
str5 <- c("Hello!", "World", "is", "good!") 
str5
str1+2    # 문자로 된 변수는 연산할 수 없음

  
  
  