# GitHub仓库设置指南

## 📝 步骤1：在GitHub创建仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `docker-learning-project`
   - **Description**: `🐳 一个用于学习Docker的Node.js应用程序项目 - 包含完整的容器化配置和最佳实践示例`
   - **Visibility**: Public（推荐，便于学习分享）
   - **不要勾选** "Add a README file"
   - **不要勾选** "Add .gitignore"
   - **License**: 选择 MIT License

## 🚀 步骤2：本地Git设置和推送

在项目目录中执行以下命令：

```bash
# 初始化Git仓库
git init

# 添加所有文件
git add .

# 创建初始提交
git commit -m "🎉 初始提交: Docker学习项目

- 添加Node.js Express应用程序
- 配置Dockerfile和docker-compose.yml
- 包含完整的项目文档和启动脚本
- 遵循Docker最佳实践"

# 添加远程仓库（请替换YOUR_USERNAME为您的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/docker-learning-project.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

## 🔧 步骤3：后续更新

以后更新代码时：

```bash
# 添加更改
git add .

# 提交更改
git commit -m "描述您的更改"

# 推送到GitHub
git push
```

## 📋 建议的README徽章

您可以在README.md中添加这些徽章：

```markdown
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
```

## 🏷️ 建议的标签（Topics）

在GitHub仓库设置中添加这些标签：
- docker
- nodejs
- express
- learning
- tutorial
- containerization
- docker-compose
- nginx
- beginner-friendly
