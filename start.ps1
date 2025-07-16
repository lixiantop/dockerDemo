# Docker学习项目 - PowerShell启动脚本

Write-Host "🐳 Docker学习项目 - 快速启动脚本" -ForegroundColor Cyan
Write-Host ""

# 检查Docker是否运行
try {
    docker version | Out-Null
    Write-Host "✅ Docker已准备就绪" -ForegroundColor Green
} catch {
    Write-Host "❌ 错误: Docker未运行或未安装" -ForegroundColor Red
    Write-Host "请确保Docker Desktop已安装并运行" -ForegroundColor Yellow
    Read-Host "按任意键退出"
    exit 1
}

Write-Host ""
Write-Host "选择运行方式:" -ForegroundColor Yellow
Write-Host "1. 构建并运行单个容器"
Write-Host "2. 使用Docker Compose运行 (推荐)"
Write-Host "3. 仅构建镜像"
Write-Host "4. 查看运行中的容器"
Write-Host "5. 停止并清理容器"
Write-Host ""

$choice = Read-Host "请输入选择 (1-5)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "🔨 构建Docker镜像..." -ForegroundColor Yellow
        docker build -t docker-demo .
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ 镜像构建失败" -ForegroundColor Red
            Read-Host "按任意键退出"
            exit 1
        }

        Write-Host ""
        Write-Host "🚀 启动容器..." -ForegroundColor Yellow
        docker run -d -p 3000:3000 --name my-docker-demo docker-demo
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ 容器启动失败，尝试删除旧容器..." -ForegroundColor Yellow
            docker rm -f my-docker-demo 2>$null
            docker run -d -p 3000:3000 --name my-docker-demo docker-demo
        }

        Write-Host ""
        Write-Host "✅ 应用程序已启动！" -ForegroundColor Green
        Write-Host "🌐 访问地址: http://localhost:3000" -ForegroundColor Cyan
        Write-Host "📊 查看日志: docker logs -f my-docker-demo" -ForegroundColor Cyan
    }

    "2" {
        Write-Host ""
        Write-Host "🔨 使用Docker Compose启动服务..." -ForegroundColor Yellow
        docker-compose up -d
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ Docker Compose启动失败" -ForegroundColor Red
            Read-Host "按任意键退出"
            exit 1
        }

        Write-Host ""
        Write-Host "✅ 所有服务已启动！" -ForegroundColor Green
        Write-Host "🌐 应用地址: http://localhost:3000" -ForegroundColor Cyan
        Write-Host "🌐 Nginx代理: http://localhost:80" -ForegroundColor Cyan
        Write-Host "📊 查看状态: docker-compose ps" -ForegroundColor Cyan
        Write-Host "📊 查看日志: docker-compose logs -f" -ForegroundColor Cyan
    }

    "3" {
        Write-Host ""
        Write-Host "🔨 构建Docker镜像..." -ForegroundColor Yellow
        docker build -t docker-demo .
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ 镜像构建失败" -ForegroundColor Red
            Read-Host "按任意键退出"
            exit 1
        }
        Write-Host "✅ 镜像构建完成！" -ForegroundColor Green
        Write-Host "📋 查看镜像: docker images docker-demo" -ForegroundColor Cyan
    }

    "4" {
        Write-Host ""
        Write-Host "📋 运行中的容器:" -ForegroundColor Yellow
        docker ps
        Write-Host ""
        Write-Host "📋 所有容器:" -ForegroundColor Yellow
        docker ps -a
    }

    "5" {
        Write-Host ""
        Write-Host "🧹 停止并清理容器..." -ForegroundColor Yellow
        docker-compose down 2>$null
        docker stop my-docker-demo 2>$null
        docker rm my-docker-demo 2>$null
        Write-Host "✅ 清理完成！" -ForegroundColor Green
    }

    default {
        Write-Host ""
        Write-Host "❌ 无效选择，请重新运行脚本" -ForegroundColor Red
        Read-Host "按任意键退出"
        exit 1
    }
}

Write-Host ""
Write-Host "🎓 Docker学习提示:" -ForegroundColor Magenta
Write-Host "- 使用 'docker ps' 查看运行的容器"
Write-Host "- 使用 'docker logs [容器名]' 查看日志"
Write-Host "- 使用 'docker exec -it [容器名] sh' 进入容器"
Write-Host "- 查看 README.md 了解更多命令"
Write-Host ""

Read-Host "按任意键退出"
