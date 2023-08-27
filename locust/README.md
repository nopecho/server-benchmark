# Locust 🦗
https://locust.io/
* 파이썬 코드 기반의 부하 테스트 도구
* 웹 UI 제공
* 사용하기 쉽고 직관적이다.
* 파이썬 스크립트로 테스트 환경 쉽게 작성 가능

## Run

> *Dependency*
> * *docker*
> * *docker-compose V1*

<br>

* `/locust/test/*.py` 에 작성한 파이썬 스크립트로 부하 생성 환경 만들기
```shell
make up
```

* 로컬 환경(http://localhost)에 HTTP GET 요청 부하 생성 환경 만들기
```shell
make get PORT=8080 URL=/hello
```