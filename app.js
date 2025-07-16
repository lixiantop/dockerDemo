const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// 静态文件服务
app.use(express.static('public'));

// 根路由
app.get('/', (req, res) => {
    res.send(`
        <html>
            <head>
                <title>Docker学习示例</title>
                <style>
                    body { 
                        font-family: Arial, sans-serif; 
                        margin: 40px; 
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        min-height: 100vh;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                    }
                    .container {
                        text-align: center;
                        background: rgba(255, 255, 255, 0.1);
                        padding: 40px;
                        border-radius: 15px;
                        backdrop-filter: blur(10px);
                        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    }
                    h1 { color: #fff; margin-bottom: 20px; }
                    .info { 
                        background: rgba(255, 255, 255, 0.2); 
                        padding: 20px; 
                        border-radius: 10px; 
                        margin: 20px 0;
                    }
                    .btn {
                        background: #4CAF50;
                        color: white;
                        padding: 12px 24px;
                        border: none;
                        border-radius: 8px;
                        cursor: pointer;
                        font-size: 16px;
                        margin: 10px;
                        transition: background 0.3s;
                    }
                    .btn:hover {
                        background: #45a049;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>🐳 欢迎来到Docker学习示例</h1>
                    <div class="info">
                        <p><strong>应用状态:</strong> 运行中 ✅</p>
                        <p><strong>端口:</strong> ${port}</p>
                        <p><strong>Node.js版本:</strong> ${process.version}</p>
                        <p><strong>当前时间:</strong> ${new Date().toLocaleString('zh-CN')}</p>
                    </div>
                    <p>这是一个运行在Docker容器中的Node.js应用程序!</p>
                    <button class="btn" onclick="location.href='/api/info'">查看API信息</button>
                    <button class="btn" onclick="location.href='/health'">健康检查</button>
                </div>
            </body>
        </html>
    `);
});

// API路由
app.get('/api/info', (req, res) => {
    res.json({
        message: '欢迎使用Docker API',
        timestamp: new Date().toISOString(),
        version: '1.0.0',
        nodeVersion: process.version,
        platform: process.platform,
        uptime: process.uptime()
    });
});

// 健康检查路由
app.get('/health', (req, res) => {
    res.json({
        status: 'healthy',
        timestamp: new Date().toISOString(),
        uptime: process.uptime()
    });
});

// 启动服务器
app.listen(port, '0.0.0.0', () => {
    console.log(`🚀 应用程序运行在 http://localhost:${port}`);
    console.log(`🐳 Docker学习示例已启动`);
});
