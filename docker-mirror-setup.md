# Docker镜像加速器配置指南

## Windows Docker Desktop配置

1. 打开Docker Desktop
2. 点击设置（Settings）
3. 选择"Docker Engine"
4. 在配置文件中添加以下内容：

```json
{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com",
    "https://dockerhub.azk8s.cn",
    "https://docker.mirrors.ustc.edu.cn"
  ]
}
```

5. 点击"Apply & Restart"重启Docker

## 验证配置
运行以下命令验证镜像加速器是否生效：
```bash
docker info | findstr "Registry Mirrors"
```

## 测试拉取镜像
```bash
docker pull node:18-alpine
```
