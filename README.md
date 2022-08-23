# Dript (드립프트)

- **커뮤니티 사이트**
- 역할 - **팀원** (계정 찾기, 비밀번호 재설정, 회원탈퇴, 공지사항 페이징 및 조회)

## 00. 프로젝트 개요

- **기본 정보**
  - 팀 프로젝트(총 4명)
  - 팀 구성방법 - 전공자 1명과 비전공자 3명으로 구성
- **프로젝트 기획 상세**
  - 사용자가 자유롭게 게시글을 쓸 수 있도록 만든 커뮤니티 사이트
  - 역할자 - 사용자
  - 참고한 서비스: 각종 커뮤니티 사이트
- **개발 기간**
  - 2022.05.20 ~ 2022.06.06
- **사용 기술 및 라이브러리**
  - Oracle JDK 11.0.15
  - Apache Tomcat 9
  - MariaDB 10

## 01. 주요 코드

- **[계정찾기.java](https://github.com/newbieccc/Dripft/blob/main/src/main/java/web/IdFind.java)**
- **[비밀번호 재설정.java](https://github.com/newbieccc/Dripft/blob/main/src/main/java/web/PWFind.java)**
- **[회원탈퇴.java](https://github.com/newbieccc/Dripft/blob/main/src/main/java/web/DeleteAccount.java)**
- **[공지사항 페이징.java](https://github.com/newbieccc/Dripft/blob/main/src/main/java/web/NoticeList.java)**

## 02 주요 화면

- **[계정찾기.jsp](https://github.com/newbieccc/Dripft/blob/main/src/main/webapp/idFind.jsp)**

  ![idFind](/src/main/webapp/screenshot/idFind.png)

- **[비밀번호 재설정.jsp](https://github.com/newbieccc/Dripft/blob/main/src/main/webapp/pwFind.jsp)**

  ![pwFind](/src/main/webapp/screenshot/pwFind.png)

- **[회원탈퇴.jsp](https://github.com/newbieccc/Dripft/blob/main/src/main/webapp/accountDel.jsp)**

  ![accountDel](/src/main/webapp/screenshot/accountDel.png)

- **[공지사항.jsp](https://github.com/newbieccc/Dripft/blob/main/src/main/webapp/notice.jsp)**

  ![notice](/src/main/webapp/screenshot/notice.png)
  
## 04. 돌이켜보니 좋았던 점

- 처음 해보는 팀 프로젝트였던 점.
  - 웹사이트가 만들어지는 과정을 처음으로 경험했습니다. 팀원과 함께 소통하며 만들어 가는 과정이 재밌었습니다.
- 팀원들이 Git에 대해 힘들어할 때 적극 나서서 도와줬던 점.
  - `pull` 진행 시 작업 내용이 겹칠 경우 `stash` 기능으로 작업하던 내용을 임시 저장했다 붙이는 것을 알려주었습니다.

## 05. 돌이켜보니 아쉬웠던 점

- 참고한 서비스를 명확히 못 정한 점.
  - `커뮤니티`만 생각하고 만들다 보니 디자인이 중구난방이었습니다.
- 간단한 기능임에도 개발 진행 속도가 느렸던 점.
  - 수업 시간에 배웠던 것에서 응용해야 했던 것이라, 간단한 기능임에도 시간이 좀 걸렸던 점이 아쉬웠습니다.
- Git을 제대로 활용하지 못한 점.
  - Branch, Merge 등등 여러 기능을 사용하지 못하였으며, `jsp` 작업이 겹치다가 충돌에서 헤맸던 점이 아쉬웠습니다.
