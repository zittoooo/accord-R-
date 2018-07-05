##R 데이터

#Vector
#character (문자), numeric (실수), integer (정수), complex (복소수),
#logical (논리) 을 가질 수 있으며, 
#한 벡터 내의 타입은 항상 같아야 함

a <- c(1,2,5.3,6,-2,4) #numeric vector
b<- c("one", "two","three") #character vector
c <- c(TRUE, TRUE, TRUE, FALSE) #logical vector

#  Vector는 [] 로 접근 가능
a[c(2,5)]    # 2, 5번째 항목
b <- a[-2]   # 2번재 항목 제외
b

# 논리 벡터 
b <- c(T, T, F, F) 
x <- -5:3
w <- x < -2
w


#행렬 (Matrices)

y <-matrix(1:20, nrow =4, ncol = 5) #4 x5 matrix
y

cells <- c(1,26,24,68) 
rnames <- c("R1", "R2") 
cnames <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE, 
                   dimnames = list(rnames, cnames))
mymatrix

mymatrix[,1]


#행렬 계산
#행렬 곱셈 ( %*% ), 덧셈 (+), 행렬 합칠때 ( cbind(), rbind())
# 역행렬 ( library(MASS) 의 ginv() ), 전치행렬 ( t() )

x = c(1:5)
y = c(-1:-5)

x+y

t(x) %*% y

x %*% t(x)


#배열(Array)

x <- array(1:8, c(2,2,2))
x
x[1,,]
x[,,1]

#List
w <- list(name = "aaa", mynumbers = a, mymatrix = y, age = 5.3)
w

#Factor
# 명목형 변수(카테고리 데이터)를 저장할 때 사용
# 각 항목은 [1…K] 범위의 숫자 vector로 인식


#예 :20명의 "male(남)" 과 30명 "femail(여성)"dmf rkwlsms gender라는 변수 

gender <- c(rep("male",20), rep("female",30))
gender <- factor(gender) # R은 gender를 nominal 변수로 처리 
gender
summary(gender)


