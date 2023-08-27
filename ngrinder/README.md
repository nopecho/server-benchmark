# nGrinder
https://naver.github.io/ngrinder/
* 자바 기반의 부하 테스트 도구
* 2가지 컴포넌트
  * `controller` : 웹 UI, 테스트 환경, 스크립트를 관리
  * `agent` : 실제 가상 유저를 생성하고 부하를 발생
* 웹 UI 에서 많은 기능을 제공 해줌
* 그루비 스크립트로 테스트 환경 쉽게 작성 가능

## Run

> *Dependency*
> * *docker*
> * *docker-compose V1*

<br>

```shell
make up
```