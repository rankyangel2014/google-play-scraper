#!/bin/bash

# 纯 Docker 部署 (不使用 docker-compose)
echo "🚀 使用 Docker 部署..."

# 停止并删除现有容器
docker stop google-play-scraper 2>/dev/null
docker rm google-play-scraper 2>/dev/null

# 构建镜像
echo "🔨 构建镜像..."
docker build -t google-play-scraper .

# 运行容器
echo "🚀 启动容器..."
docker run -d \
  --name google-play-scraper \
  --restart unless-stopped \
  -p 3000:3000 \
  -e NODE_ENV=production \
  google-play-scraper

# 等待启动
sleep 5

# 检查状态
if docker ps | grep -q google-play-scraper; then
    SERVER_IP=$(curl -s ifconfig.me 2>/dev/null || echo "localhost")
    echo "✅ 部署成功！"
    echo "📡 访问地址: http://$SERVER_IP:3000"
    echo "🧪 测试: curl http://$SERVER_IP:3000/app/com.bkash.businessapp"
else
    echo "❌ 部署失败，查看日志:"
    docker logs google-play-scraper
fi