# 1. Python 3.8 슬림 이미지를 사용
FROM python:3.8-slim-buster AS build

# 2. 시스템 패키지 업데이트 및 curl 설치
RUN apt-get update && apt-get install -y --no-install-recommends gcc curl libffi-dev python3-dev && rm -rf /var/lib/apt/lists/*

# 3. 작업 디렉토리 설정
WORKDIR /usr/src/app

# 4. requirements.txt 파일 복사
COPY requirements.txt ./

# 5. pip 업그레이드 및 패키지 설치
RUN pip3 install --upgrade pip && pip3 install django djangorestframework

# 6. 애플리케이션 소스 코드 복사
COPY . .

# 7. 포트 노출
EXPOSE 80

# 8. 서버 실행
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
