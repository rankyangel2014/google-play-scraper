# Google Play Scraper Docker 部署

## 快速部署

```bash
./deploy.sh
```

## 手动部署

```bash
# 启动服务
docker-compose up -d --build

# 查看状态
docker-compose ps

# 查看日志
docker-compose logs
```

## API 使用

### 获取应用详情
```bash
curl http://localhost:3000/app/com.bkash.businessapp
```

### 搜索应用
```bash
curl http://localhost:3000/search?term=bkash
```

## 停止服务

```bash
docker-compose down
```