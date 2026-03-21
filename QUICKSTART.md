# 快速开始指南

## 第一步：安装 Hugo

### macOS
```bash
brew install hugo
```

### Windows
```powershell
choco install hugo-extended
```

### Linux
```bash
sudo snap install hugo
```

验证安装：
```bash
hugo version
```

## 第二步：启动本地服务器

```bash
cd ~/Documents/blog
hugo server -D
```

然后在浏览器打开 `http://localhost:1313`

## 第三步：创建新文章

```bash
hugo new posts/my-new-post.md
```

编辑 `content/posts/my-new-post.md` 添加内容。

## 项目结构说明

```
blog/
├── config.yml              # 站点配置文件
├── content/                # 文章内容（Markdown）
│   ├── posts/             # 博客文章
│   ├── about.md           # 关于页面
│   └── library.md         # 资源库页面
├── layouts/                # 自定义模板（覆盖主题）
│   ├── _default/
│   │   ├── baseof.html   # 基础模板
│   │   ├── single.html   # 文章页模板
│   │   └── list.html     # 列表页模板
│   ├── index.html         # 首页模板
│   └── partials/
│       ├── header.html   # 导航栏
│       └── footer.html   # 页脚
├── static/                 # 静态资源
│   └── css/
│       └── custom.css     # 自定义样式
├── themes/                 # 主题（PaperMod 子模块）
└── .github/workflows/      # GitHub Actions 部署配置
```

## 自定义配置

### 修改网站信息
编辑 `config.yml`:
```yaml
baseURL: "https://yourdomain.com"
title: "Your Site Title"
params:
  homeSubtitle: "Your subtitle here"
```

### 自定义颜色和字体
编辑 `static/css/custom.css`:
```css
:root {
  --background: #fbf9f3;  /* 背景色 */
  --on-background: #1b1c19;  /* 文字颜色 */
  /* ... */
}
```

### 修改社交链接
编辑 `config.yml`:
```yaml
params:
  socialIcons:
    - name: twitter
      url: "https://twitter.com/yourhandle"
    - name: github
      url: "https://github.com/yourusername"
```

## 部署到 GitHub Pages

### 1. 推送代码到 GitHub

```bash
cd ~/Documents/blog
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/yourrepo.git
git push -u origin main
```

### 2. 启用 GitHub Pages

1. 进入仓库 **Settings** → **Pages**
2. **Source** 选择 **GitHub Actions**
3. 推送代码后自动构建部署

### 3. 绑定自定义域名（可选）

1. 创建 `CNAME` 文件：
   ```
   yourdomain.com
   ```

2. 在域名提供商添加 DNS 记录：
   - CNAME: `www` → `yourusername.github.io`
   - A: `@` → GitHub Pages IP（在仓库设置中查看）

3. 在 GitHub 仓库 **Settings** → **Pages** 中勾选 **Enforce HTTPS**

## 常用命令

```bash
# 启动开发服务器（含草稿）
hugo server -D

# 构建生产版本
hugo --minify

# 创建新文章
hugo new posts/my-post.md

# 创建新页面
hugo new about.md
```

## 添加评论系统（Giscus）

访问 https://giscus.app/ 生成配置，然后在 `config.yml` 中启用：
```yaml
params:
  comments: true
```

## 需要帮助？

- [Hugo 文档](https://gohugo.io/documentation/)
- [PaperMod 主题文档](https://github.com/adityatelange/hugo-PaperMod)
- [Markdown 语法指南](https://www.markdownguide.org/)
