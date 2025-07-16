@echo off
echo 🐳 Docker学习项目 - 快速启动脚本
echo.

REM 检查Docker是否运行
docker version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误: Docker未运行或未安装
    echo 请确保Docker Desktop已安装并运行
    pause
    exit /b 1
)

echo ✅ Docker已准备就绪
echo.

echo 选择运行方式:
echo 1. 构建并运行单个容器
echo 2. 使用Docker Compose运行 (推荐)
echo 3. 仅构建镜像
echo 4. 查看运行中的容器
echo 5. 停止并清理容器
echo.

set /p choice=请输入选择 (1-5): 

if "%choice%"=="1" goto single_container
if "%choice%"=="2" goto docker_compose
if "%choice%"=="3" goto build_only
if "%choice%"=="4" goto view_containers
if "%choice%"=="5" goto cleanup
goto invalid_choice

:single_container
echo.
echo 🔨 构建Docker镜像...
docker build -t docker-demo .
if %errorlevel% neq 0 (
    echo ❌ 镜像构建失败
    pause
    exit /b 1
)

echo.
echo 🚀 启动容器...
docker run -d -p 3000:3000 --name my-docker-demo docker-demo
if %errorlevel% neq 0 (
    echo ❌ 容器启动失败
    echo 可能容器已存在，尝试删除旧容器...
    docker rm -f my-docker-demo 2>nul
    docker run -d -p 3000:3000 --name my-docker-demo docker-demo
)

echo.
echo ✅ 应用程序已启动！
echo 🌐 访问地址: http://localhost:3000
echo 📊 查看日志: docker logs -f my-docker-demo
goto end

:docker_compose
echo.
echo 🔨 使用Docker Compose启动服务...
docker-compose up -d
if %errorlevel% neq 0 (
    echo ❌ Docker Compose启动失败
    pause
    exit /b 1
)

echo.
echo ✅ 所有服务已启动！
echo 🌐 应用地址: http://localhost:3000
echo 🌐 Nginx代理: http://localhost:80
echo 📊 查看状态: docker-compose ps
echo 📊 查看日志: docker-compose logs -f
goto end

:build_only
echo.
echo 🔨 构建Docker镜像...
docker build -t docker-demo .
if %errorlevel% neq 0 (
    echo ❌ 镜像构建失败
    pause
    exit /b 1
)
echo ✅ 镜像构建完成！
echo 📋 查看镜像: docker images docker-demo
goto end

:view_containers
echo.
echo 📋 运行中的容器:
docker ps
echo.
echo 📋 所有容器:
docker ps -a
goto end

:cleanup
echo.
echo 🧹 停止并清理容器...
docker-compose down 2>nul
docker stop my-docker-demo 2>nul
docker rm my-docker-demo 2>nul
echo ✅ 清理完成！
goto end

:invalid_choice
echo.
echo ❌ 无效选择，请重新运行脚本
pause
exit /b 1

:end
echo.
echo 🎓 Docker学习提示:
echo - 使用 'docker ps' 查看运行的容器
echo - 使用 'docker logs [容器名]' 查看日志
echo - 使用 'docker exec -it [容器名] sh' 进入容器
echo - 查看 README.md 了解更多命令
echo.
pause
