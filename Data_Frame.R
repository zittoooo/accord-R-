#데이터 프레임(Data Frame) 
# R에서 가장 많이 사용하는 데이터 형태 
# 열과 행으로 구성된 테이블 형

english <- c(90,80,60,70) # 영어점수 변수 생성 
english

math <- c(50,60,100,20)  # 수학점수 변수 생성 
Math

df_midterm <- data.frame(english,math)  # 데이터 프레임 생성
df_midterm

class <- c(1,1,2,2) 
class

df_midterm <- data.frame(english,math, class) 
df_midterm

mean(df_midterm$english) 
mean(df_midterm$math)

df_midterm <- data.frame( english =c(90,80,60,40),
                          math = c(50,60,70,80), 
                          class = c(1,1,2,2) )


##외부 데이터 활용##

install.packages("readxl")      # exel 파일을 읽기 위한 패키지 설치
library(readxl)


# 첫 행에 변수 명이 존재할 경우 
df_exam1 <- read_excel("excel_exam.xlsx")
df_exam1

# 첫 행부터 바로 데이터 일 경우 
df_exam2 <- read_excel("excel_exam.xlsx", col_names = F)
df_exam2

mean(df_exam$english) 
mean(df_exam$math)

write.csv(df_exam1, file="csv_test.csv")   # csv 파일 쓰기
df_csv_exam <- read.csv("csv_test.csv")  # csv 파일 읽기


## 데이터셋에 대한 정보 확인

ls()                     # object 목록 출력
Names(df_exam)           # df_exam에 있는 변수 목록 출력
str(df_exam)             # df_exam의 구조 출력
dim(df_exam)             # df_exam의 차원 (dimensions) 출력
class(df_exam)           # df_exam 의 class 출력

df_exam # df_exam 출력
head(df_exam, n=10)    # df_exam의 맨 앞의 10개 row 출력
tail(df_exam, n=5)     # df_exam의 맨 뒤에 있는 5개 row 출력

