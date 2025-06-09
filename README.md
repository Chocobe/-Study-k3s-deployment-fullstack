# 개요

Docker 부터 Kubernetes 까지 환경별 스터디를 위한 저장소 입니다.

프로젝트의 실행환경은 다음과 같이 구성합니다.
- dev : 개발 환경
- prod : 배포 환경

실행 환경을 Docker 부터 K8s 까지 점진적으로 구성해 봅니다.
- Dockerfile
  - dev : 개발 환경 - bind mount 적용
  - prod : 배포 환경 - Nginx 를 사용한 `Web Server` + `Reverse Proxy Server`
- docker-compose
  - dev
  - prod
- K8s Pod 리소스로 실행환경 구성하기
- K8s ReplicaSet 리소스로 실행환경 구성하기
- K8s Deployment 리소스로 실행환경 구성하기



<br /><hr /><br />



# 프로젝트 구성

```bash
root/
├── frontend/
│   └── ... (Vite 앱 소스)
├── backend/
│   └── ... (Express 앱 소스)
├── docker/
│   ├── dev/
│   │   ├── docker-compose.yml
│   │   ├── frontend.Dockerfile
│   │   └── backend.Dockerfile
│   └── prod/
│       ├── docker-compose.yml
│       ├── frontend.Dockerfile
│       ├── backend.Dockerfile
│       └── nginx.conf
└── Makefile
```
