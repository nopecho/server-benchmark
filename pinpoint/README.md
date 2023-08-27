# Pinpoint
https://pinpoint-apm.gitbook.io/pinpoint/

* 오픈소스 APM 도구
* 3가지 컴포넌트
  * `collector` : `agent` 가 보낸 정보 분석하고 `HBase` 스토리지에 저장
  * `agent` : 우리가 개발한 애플리케이션에 사이드카 형태로 붙어서 트래픽 정보를 `collector` 로 전달
  * `web-ui` : `HBase` 에 있는 모니터링 정보를 웹 UI로 제공

## Run

> *Dependency*
> * *docker*
> * *docker-compose V1*

<br>

```shell
make up

make open
```