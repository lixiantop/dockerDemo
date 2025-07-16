<<<<<<< HEAD
# 🐳 Docker 学习示例项目

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

这是一个专为学习Docker而设计的Node.js应用程序，包含完整的容器化配置和最佳实践示例。

## 📋 项目概述

本项目包含：
- 一个简单的Node.js + Express Web应用程序
- 完整的Docker配置文件
- Docker Compose多容器配置
- Nginx反向代理配置
- 健康检查和监控

## 🚀 快速开始

### 前提条件
- 安装Docker Desktop
- 安装Node.js（用于本地开发，可选）

### 方法1：使用Docker运行

#### 构建并运行单个容器
```bash
# 构建Docker镜像
docker build -t docker-demo .

# 运行容器
docker run -d -p 3000:3000 --name my-docker-demo docker-demo

# 查看运行中的容器
docker ps

# 访问应用程序
# 打开浏览器访问: http://localhost:3000
```

#### 使用Docker Compose运行（推荐）
```bash
# 启动所有服务（应用程序 + Nginx）
docker-compose up -d

# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

### 方法2：本地开发运行

```bash
# 安装依赖
npm install

# 启动应用程序
npm start

# 访问应用程序
# 打开浏览器访问: http://localhost:3000
```

## 📁 项目结构

```
dockerDemo/
├── app.js                 # 主应用程序文件
├── package.json           # Node.js项目配置
├── Dockerfile             # Docker镜像构建文件
├── docker-compose.yml     # 多容器编排配置
├── nginx.conf             # Nginx配置文件
├── .dockerignore          # Docker构建忽略文件
├── README.md              # 项目说明文档
└── .github/
    └── copilot-instructions.md  # GitHub Copilot指令
```

## 🎯 学习要点

### 1. Dockerfile 最佳实践
- 使用轻量级基础镜像（Alpine Linux）
- 多阶段构建优化镜像大小
- 使用非root用户运行应用（安全性）
- 添加健康检查
- 合理使用缓存层

### 2. Docker Compose 配置
- 服务编排和依赖管理
- 网络配置
- 卷挂载
- 环境变量管理
- 健康检查配置

### 3. 安全最佳实践
- 非root用户运行
- 最小权限原则
- 镜像漏洞扫描
- 环境变量保护

## 🔧 常用Docker命令

### 镜像操作
```bash
# 查看本地镜像
docker images

# 删除镜像
docker rmi docker-demo

# 构建镜像（带标签）
docker build -t docker-demo:v1.0 .
```

### 容器操作
```bash
# 查看所有容器
docker ps -a

# 停止容器
docker stop my-docker-demo

# 删除容器
docker rm my-docker-demo

# 进入运行中的容器
docker exec -it my-docker-demo sh

# 查看容器日志
docker logs my-docker-demo
```

### 系统清理
```bash
# 清理未使用的镜像
docker image prune

# 清理未使用的容器
docker container prune

# 清理所有未使用的资源
docker system prune -a
```

## 🌐 API端点

应用程序提供以下端点：

- `GET /` - 主页面（包含应用信息）
- `GET /api/info` - 应用程序信息API
- `GET /health` - 健康检查端点

## 📊 监控和调试

### 查看应用程序状态
```bash
# 检查健康状态
curl http://localhost:3000/health

# 获取应用信息
curl http://localhost:3000/api/info
```

### 容器监控
```bash
# 查看容器资源使用情况
docker stats

# 查看容器进程
docker top my-docker-demo
```

## 🎓 扩展学习

1. **多阶段构建**: 尝试创建一个包含构建和运行阶段的Dockerfile
2. **数据卷**: 添加数据持久化存储
3. **环境配置**: 创建不同环境的配置文件
4. **容器编排**: 学习Kubernetes部署
5. **CI/CD集成**: 添加自动化构建和部署

## 🛠️ 故障排除

### 常见问题

1. **端口被占用**
   ```bash
   # 检查端口占用
   netstat -an | findstr :3000
   # 或使用不同端口
   docker run -d -p 3001:3000 --name my-docker-demo docker-demo
   ```

2. **镜像构建失败**
   ```bash
   # 查看详细构建日志
   docker build -t docker-demo . --no-cache --progress=plain
   ```

3. **容器无法启动**
   ```bash
   # 查看容器日志
   docker logs my-docker-demo
   ```

## 📝 许可证

MIT License

## 🤝 贡献

欢迎提交问题和改进建议！

---

**快乐学习Docker！** 🐳✨
