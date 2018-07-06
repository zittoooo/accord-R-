#tidyr, dplyr 패키지 설치
install.packages("tidyr")
library(tidyr)
install.packages("dplys")
library(dplyr)

member <- data.frame(family = c(1,2,3), namef = c("aaa","bbb","ccc"),
              daef=c(20,30,40), namem = c("ddd","eee","fff"),
          agem = c(34,23,45))
member

a <- gather(member, key, value, namef:agem)

b <- separate(a,key,c("variable","type"),1) 
b <- separate(a,key, c("variable","type"), 4)
b <- separate(a,key, c("variable","type"), -1)
new <- spread(b,variable,value)

member <- data.frame(family=c(1,2,3), namef=c("aaa","bbb","ccc"), 
                     agef=c(20,30,40),
                     namem=c("ddd","eee","fff"), agem=c(34,23,45))
member

#pipeline %>%
new2 <- member %>%
  gather(key, value, namef:agem) %>%
  separate(key,c("variable","type"),-1) %>%
  spread(variable, value)

new2

# 원하는 조건의 데이터를 추출하여 분석 dplyr의 filter() 사용 
filter(new2, type =="f")
new2 %>% filter(type =="f")

filter(new2,age >= 30)
new2 %>% filter(age>=30)
new2


# 여러 조건을 충족하는 행 추출 (and 조건 ‘&’)
new2 %>% filter(type=="f" & age>=30) 
new2 %>% filter(type=="m" & age>=30)
new2 

# 여러 조건중 하나 이상 충족하는 행 추출 (or 조건 ‘|’) 
new2 %>% filter(type=="f" | age>=30) 
new2 %>% filter(type=="m" | age>=30)

# 목록에 해당하는 행 추출 
new2 %>% filter(family==1 | family==2) 
new2 %>% filter(family==1 | family==2 | family==3)

# %in% 기호 
new2 %>% filter(family %in% c(1,2)) 
new2 %>% filter(family %in% c(1:3))
family1 <- new2 %>% filter(family == 1)
family2 <- new2 %>% filter(family %in% c(2,3))

# 필요한 변수만 추출 
new2 %>% select(name)   #한 개 변수 추출
new2 %>% select(type, age) # 여러 변수 추출
new2 %>% select(-age) #변수제오
new2 %>% select(-age,-type)

# filter(), select() 함수 조합 
new2 %>% filter(type =="f") %>% select(-age)

new2 %>% filter(type=="f") %>% select(-age) %>% head(1)


new2 %>% arrange(age)     # age로 오름차순 정렬 
new2 %>% arrange(desc(age))  # age로 내림차순 정렬
new2 %>% arrange(family, age)

# excel or csv 파일 로드 
exam <- read_excel("excel_exam.xlsx") 
exam <- read.csv("exam.csv") 
exam 

exam %>%         # 파생변수 추가
  mutate(total = math+english) %>% head
  
exam %>%                 # 여러 파생변수 추가 
  mutate(total = math+english,        # 총합
         mean = (math + english)/2 ) %>% # 평균
  head
  
exam %>%                 # mutate() , ifelse() 적용 
  mutate(test =  ifelse(math >=60, "pass", "fail")) %>% 


  exam %>%        
  mutate(total = math+english) %>% 
  arrange(total) %>%   head


## 집단별 데이터 요약 
exam %>% summarise(mean_math = mean(math))


exam %>%  # 집단별 데이터 요약
  group_by(class) %>%     # class 별로 분리
  summarise(mean_math = mean(math),      # math의 평균 
            sum_math = sum(math),       # math 합계
            median_math = median(math),  # math 중앙값 
            n=n())                      # 그룹수
  

# 집단별로 다시 집단 나누기 
library(ggplot2) 


mpg %>%
  group_by(manufacturer, drv) %>%         # 회사별, 구동 방식별 분리
  summarise(mean_cty = mean(cty)) %>%      # cty 평균 산출
  head(10)


## dplyr 조합 
mpg %>% 
  group_by(manufacturer) %>% # 회사별 분리
  filter(class == "suv") %>% # suv 추출 
  mutate(tot = (cty+hwy)/2) %>%       # 통합 연비 생성 
  summarise(mean_tot = mean(tot)) %>% # 통합 연비 평균 생성
  arrange(desc(mean_tot)) %>%         # 내림차순으로 정렬
  head(5)


## 데이터 합치기
# 중간고사 데이터 생성 
test1 <- data.frame(id = c(1:5), 
                    midterm = c(60,80,70,90,75))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1:5),
                    final = c(70,83,65,95,80))

# left_join 데이터 합치기 
total <- left_join(test1,test2, by = "id") # id를 기준으로 데이터 합치기
total
