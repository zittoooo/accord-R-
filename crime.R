#패키지 설치
install.packages("ggiraphExtra") 
library(ggiraphExtra)

# 미국 주별 범죄 데이터 준비 
# r에 내장된 USArrests 데이터는 1973년 미국 주별 강력 범죄율 정보임 
str(USArrests)
head(USArrests)

library(tibble)

# 행 이름을 state 변수로 바꿔 데이터 프레임 생
crime <- rownames_to_column(USArrests, var = "state")
crime

# 지도 데이터와 동일하게 맞추기 위해 state의 값을 소문자로 수정 
crime$state <- tolower(crime$state)
crime

str(crime)


## 미국 주지도 데이터 준비하기 
# 단계 구분도를 만들기 위해선 지역별 위도, 경도 정보가 있는 지도가 필요 
# R의 maps 패키지에 미국 주별 위경도를 나타낸 state 데이터가 있음 

library(ggplot2)
states_map <- map_data("state")
str(states_map)

##단계 구분도
ggChoropleth(data = crime,         # 지도에 표현할 데이터 
             aes(fill = Murder,    # 색깔로 표현할 변수 
                 map_id = "state"),  # 지역 기준 변수 
             map = states_map)     # 지도 데이터
             

#인터랙티브 단계 구분도
ggChoropleth(data = crime,
             aes(fill = Murder, 
                 map_id = "state"),
             map = states_map,
             interactive = T)


#대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
install.packages("stringi")

# devtools 는 깃허브에 공유된 패키지를 사용할 수 있음
install.packages("devtools")

# kormaps2014 패키지에는 몇 가지 지역별 통계 정보가 포함됨 
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
library(ggiraphExtra)
library(dplyr)

str(changeCode(korpop1))

korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

str(changeCode(kormap1))

ggChoropleth(data = korpop1,       # 지도에 표현할 데이터 
             aes(fill = pop,       # 색깔로 표현할 변수 
                 map_id = "code",    # 지역 기준 변수 
                 tooltip = "name"),  # 지도 위에 표시할 지역명 
             map = kormap1,        # 지도 데이터 
             interactive = T)        # 인터랙티브
             
             
str(changeCode(tbc))

ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = "code",
                 tooltip = "name"),
             map = kormap1,
             interactive = T)

