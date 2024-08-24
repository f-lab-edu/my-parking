# my_parking

## **프로젝트 개요**

### **앱 설명**

MyParking 앱은 사용자가 가까운 주차장을 확인하고, 주차장 이용 정보를 입력하거나 자주 이용하는 주차장을 저장할 수 있는 기능을 제공합니다.

---

## **주요 기능**

### **🗺️ 지도 탭**

- **현재 위치 기반 지도**: 사용자가 위치 정보 제공을 허용하면, 현재 위치를 기준으로 지도 화면이 보여집니다.
- **주변 주차장 표시**: 지도 UI 상에서 주변 주차장들이 마커로 표시됩니다.
- **주차장 정보 표시**: 마커를 탭했을 경우, 하단에 주차장에 대한 정보가 모달로 표시됩니다.
- **주차장 저장**: 특정 주차장을 저장할 수 있는 기능을 제공합니다.
- **주차장 이용**: 주차장 이용하기 버튼을 통해 이용 화면으로 이동합니다.
- **주차장 검색**: 상단 검색 바를 이용하여 주차장을 검색할 수 있습니다.

### **🚗 주차장 이용 화면**

- **주차장 정보 입력**: 주차장 위치 사진과 이용자가 필요한 정보를 입력할 수 있는 입력창을 제공합니다.
- **저장 및 이동**: 저장 버튼을 누르면, 지도 탭으로 이동하며 DB에 해당 정보가 저장됩니다.

### **🧑‍🌾 마이페이지 탭**

- **최근 이용한 주차장**: 최근에 이용한 주차장들을 리스트 뷰로 표시합니다.
- **저장한 주차장**: 사용자가 저장한 주차장들을 리스트 뷰로 표시합니다.

---

## **기술 스택**

- **프로그래밍 언어**: Dart, Flutter
- **상태 관리**: Bloc, Cubit
- **의존성 주입**: Get_It, Injectable
- **라우팅**: go_router 또는 auto_route
- **데이터베이스**: Hive
- **네트워크 요청**: Dio + Retrofit
- **지도 서비스**: flutter_naver_map, reverse geocoding API (Naver), 한국교통안전공단_전국공영주차장정보(API)
- **기타 라이브러리**: Freezed, JsonSerializable, Equatable
- **인증**: 구글 로그인, 애플 로그인, 네이버 로그인

---

## **비즈니스 로직**

### 1. 주차장 검색 및 표시

- **사용자 위치 기반**: 사용자의 위치 정보를 기반으로 현재 위치 주변의 주차장을 검색
- **주차장 정보**: 검색된 주차장에 대한 정보를 API로부터 가져와 사용자에게 제공
- **지도에 표시**: 주차장은 지도 상에 마커로 표시되며, 사용자가 마커를 클릭하면 주차장에 대한 상세 정보를 모달로 표시

### 2. 주차장 이용 관리

- **주차장 선택**: 사용자가 특정 주차장을 선택하여 이용
- **이용 정보 입력**: 사용자가 선택한 주차장에 대해 필요한 정보를 입력할 수 있습니다.
    - 예를 들어, 주차 시작 시간, 종료 시간, 주차 요금 등의 정보를 입력할 수 있습니다.
- **저장 및 관리**: 입력된 이용 정보는 로컬 데이터베이스에 저장되며, 나중에 확인하거나 수정할 수 있습니다.

### 3. 주차장 저장 기능

- **즐겨찾기 기능**: 사용자는 자주 이용하는 주차장을 즐겨찾기로 저장할 수 있습니다.
- **저장된 주차장 관리**: 사용자는 마이페이지에서 저장된 주차장을 확인하고, 필요에 따라 삭제할 수 있습니다.

### 4. 마이페이지 기능

- **이용 기록 관리**: 사용자가 최근에 이용한 주차장들을 리스트 형태로 확인/이용 및 관리할 수 있습니다.
- **저장된 주차장 확인**: 사용자가 저장한 주차장 리스트를 확인할 수 있으며, 저장된 주차장을 이용할 수 있습니다.

---

## **Open API**

**한국교통안전공단_전국공영주차장정보**

- parameter 값으로 법정코드(지역코드)를 사용해 주변 주차장 정보들을 불러옴

[https://www.data.go.kr/data/15050093/fileData.do#/API 목록/getuddi%3Ad19c8e21-4445-43fe-b2a6-865dff832e08](https://www.data.go.kr/data/15050093/fileData.do#/API%20%EB%AA%A9%EB%A1%9D/getuddi%3Ad19c8e21-4445-43fe-b2a6-865dff832e08)

```dart
{
  "page": 0,
  "perPage": 0,
  "totalCount": 0,
  "currentCount": 0,
  "matchCount": 0,
  "data": [
    {
      "주차장관리번호": "string",
      "주차장명": "string",
      "경도": "string",
      "위도": "string",
      "주차장구분": "string",
      "주차장유형": "string",
      "주차장지번주소": "string",
      "주차장도로명주소": "string",
      "주차구획수": "string",
      "운영요일": "string",
      "평일운영시작시각": "string",
      "평일운영종료시각": "string",
      "토요일운영시작시각": "string",
      "토요일운영종료시각": "string",
      "공휴일운영시작시각": "string",
      "공휴일운영종료시각": "string",
      "요금정보": "string",
      "관리기관명": "string",
      "지역구분": "string",
      "지역구분_sub": "string",
      "지역중심좌표(X좌표)": "string",
      "지역중심좌표(Y좌표)": "string",
      "지역코드": "string",
      "연락처": "string",
      "수정일자": "string"
    }
  ]
}
```

## **Reverse Geocoding API (Naver)**

- 위도, 경도 값으로 법정코드(지역코드)를 불러옴

[Reverse Geocoding API](https://guide.ncloud-docs.com/docs/maps-reversegeocoding-api)

---

## **지도 구현 로직**

[flutter_naver_map docs | flutter_naver_map](https://note11.dev/flutter_naver_map/)

### **flutter_naver_map (비공식 네이버 지도)**

- 네이버 지도에서 현재 가리키고 있는 중심점의 위도, 경도 값으로 Reverse Geocoding API 호출
- 해당 API를 통해 해당 지역의 지역코드를 파악하고 지역코드로 주변 공영 주차장의 정보를 가져옴 (Open API 호출)
- **캐싱을 어떤 식으로 할건지 고민**

---

## **아키텍처**

**Clean Architecture**를 기반으로 설계

- 다양한 계층으로 나누어 유지보수성을 높이고, 테스트 가능성을 극대화

### **🧱 아키텍처 다이어그램**

```
Presentation Layer (UI)
     │
     │ Bloc/Cubit
     │
Domain Layer (Business Logic)
     │
     │ Entities
     │
     │ Repositories (Interfaces)
     │
     │ Use Cases
     │
Data Layer (Data Access)
     │
     │ Models
     │
     │ Data Sources (API, DB)
     │
     │ Repositories (Implementations)
```

### **각 아키텍처 계층에 대한 설명**

#### **Presentation Layer**

- 해당 계층에서는 사용자가 사용하는 UI들을 담당합니다.
- 사용자의 Interaction에 의한 변화를 Domain Layer에 전달하고, 결과를 다시 사용자에게 보여줍니다.
- Bloc, Cubit 상태관리 패턴을 활용하여 UI 상태를 관리하고 업데이트합니다.

#### **Domain Layer**

- 앱의 핵심 비즈니스 로직을 포함하고 Presentation Layer와 Data Layer 간의 중재자 역할을 수행합니다.
    - 데이터를 처리하고 결과를 반환합니다.
- Data Layer가 변경되어도 비즈니스 로직은 변경되지 않으므로, DB 또는 API의 변경에도 유연하게 대응 가능합니다.
- Entity, Usecase, Repository Interface로 구성됩니다.
    - **Entity**: 애플리케이션의 핵심 비즈니스 모델을 정의하며, Data Layer의 데이터 구조와는 독립적으로 도메인 로직에 맞춰 설계됩니다.
    - **Usecase**: 하나의 특정 비즈니스 기능을 구현한 클래스입니다.
        - 레포지토리 인터페이스를 호출하여 비즈니스 로직을 수행하고, 그 결과를 프레젠테이션 계층으로 전달합니다.
    - **Repository Interface**: Data Source와의 상호작용을 추상화하여, 프레젠테이션 계층과 데이터 계층 간의 의존성을 줄입니다.
        - 도메인 계층에서는 인터페이스만 정의하고, 구현은 데이터 계층에서 수행됩니다.

#### **Data Layer**

- 실제 Data Source와의 상호작용을 담당합니다.
- DB, API에서 데이터를 가져오고, 필요한 경우 가공해서 Domain Layer에 전달합니다.
- Data Layer에서 데이터 모델을 통해 데이터를 구조화하고 이를 Domain Layer의 Entity로 변환합니다.
- **Repository (Implementation, 구현체)**: Domain Layer에서 정의한 Repository Interface의 구현체입니다.
    - Data Source로부터 데이터를 가져와서 Domain Layer에 전달합니다.

### **📂 폴더 구조**

```
lib/
│
├── core/
│   ├── error/                        # 예외 처리 및 에러 관리
│   ├── usecases/                     # 공통적으로 사용하는 유즈케이스 (비즈니스 로직)
│   ├── utils/                        # 유틸성 함수 및 상수
│   ├── network/                      # 네트워크 관련 유틸리티 (예: Dio 설정)
│   └── di/                           # 의존성 주입 (Get_It 관련 설정)
│
├── features/                         # 기능 별로 모듈화, 독립성 보장(유지보수/테스트 용이)
│   ├── parking/
│   │   ├── data/                     # 데이터 소스, 모델, 레포지토리 구현
│   │   │   ├── datasources/          # 로컬 및 원격 데이터 소스
│   │   │   ├── models/               # 데이터 모델
│   │   │   └── repositories/         # Repository 구현체
│   │   ├── domain/                   # 비즈니스 로직 관련 도메인 계층
│   │   │   ├── entities/             # 엔티티 정의
│   │   │   ├── repositories/         # Repository 인터페이스
│   │   │   └── usecases/             # 유즈케이스 구현체
│   │   ├── presentation/             # UI와 Bloc/Cubit
│   │   │   ├── blocs/                # Bloc/Cubit 상태 관리
│   │   │   ├── pages/                # 개별 화면 UI
│   │   │   └── widgets/              # 재사용 가능한 위젯들
│   │
│   └── user/                         # 사용자 관련 기능 (로그인 등)
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart                         # 앱 엔트리포인트, 의존성 주입 초기화
```