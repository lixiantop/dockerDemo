# 使用官方Node.js运行时作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 将package.json和package-lock.json复制到工作目录
COPY package*.json ./

# 安装应用程序的依赖项
RUN npm install --only=production

# 将应用程序代码复制到工作目录
COPY . .

# 创建非root用户来运行应用程序（安全最佳实践）
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodeuser -u 1001

# 更改文件所有者
RUN chown -R nodeuser:nodejs /app
USER nodeuser

# 暴露端口
EXPOSE 3000

# 定义环境变量
ENV NODE_ENV=production
ENV PORT=3000

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# 运行应用程序
CMD ["npm", "start"]
