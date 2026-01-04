#!/bin/bash

# 一键部署 Google Play Scraper
echo "🚀 开始部署 Google Play Scraper..."

# 检查 Docker 是否运行
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker 未运行，正在启动..."
    open -a Docker
    echo "⏳ 等待 Docker 启动..."
    sleep 30
fi

# 停止现有容器
echo "🛑 停止现有容器..."
docker-compose down 2>/dev/null

# 构建并启动
echo "🔨 构建并启动服务..."
docker-compose up -d --build

# 等待服务启动
echo "⏳ 等待服务启动..."
sleep 10

# 检查状态
if docker-compose ps | grep -q "Up"; then
    echo "✅ 部署成功！"
    echo "📡 API 地址："
    echo "   - 应用详情: http://localhost:3000/app/{appId}"
    echo "   - 搜索应用: http://localhost:3000/search?term={关键词}"
    echo ""
    echo "🧪 测试命令："
    echo "   curl http://localhost:3000/app/com.bkash.businessapp"
    echo "   curl http://localhost:3000/search?term=bkash"
else
    echo "❌ 部署失败，查看日志："
    docker-compose logs
fi