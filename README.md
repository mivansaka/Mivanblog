# The Modern Scholar — Hugo Blog

A minimal, elegant blog powered by Hugo and the PaperMod theme, customized with a design inspired by modern digital gardens.

## Features

- ✨ Minimalist design with focus on typography
- 🌓 Dark/Light mode toggle
- 📱 Fully responsive
- 🚀 Fast static site generation
- 📝 Markdown support
- 🏷️ Tag system
- 🔍 Search-ready structure
- 📊 Optional analytics integration
- 💬 Comments ready (Giscus/Utterances)

## Quick Start

### Prerequisites

- Hugo extended version (0.112.0 or later)
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/yourrepo.git
   cd yourrepo
   ```

2. **Initialize the theme submodule**
   ```bash
   git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
   ```

3. **Run Hugo server**
   ```bash
   hugo server -D
   ```

4. **Open your browser**
   Visit `http://localhost:1313`

## Creating Content

Create a new post:

```bash
hugo new posts/my-new-post.md
```

Edit the created file in `content/posts/` with your content.

## Configuration

Edit `config.yml` to customize:

- Site title and description
- Menu items
- Social links
- Theme colors (in `static/css/custom.css`)
- Analytics settings

## Deployment

### GitHub Pages

This project includes a GitHub Actions workflow (`.github/workflows/hugo.yml`) for automatic deployment to GitHub Pages.

To enable:

1. Go to your repository **Settings** → **Pages**
2. Set **Source** to **GitHub Actions**
3. Push to the `main` branch

The site will be automatically built and deployed.

### Custom Domain

1. Add a `CNAME` file at the root with your domain:
   ```
   yourdomain.com
   ```

2. Configure DNS at your domain provider:
   - Add a **CNAME** record pointing to `yourusername.github.io`
   - Or an **A** record for the root domain

3. Enable HTTPS in repository **Settings** → **Pages**

## Customization

### Theme Colors

Edit `static/css/custom.css` to modify colors, fonts, and spacing.

### Layout Templates

Override PaperMod templates by creating files in `layouts/`:
- `layouts/_default/baseof.html` — Base template
- `layouts/index.html` — Homepage layout
- `layouts/partials/header.html` — Header/navigation
- `layouts/partials/footer.html` — Footer

### Content Structure

```
content/
├── posts/          # Blog posts
├── essays/         # Long-form essays
└── about.md        # About page
```

## Adding Features

### Comments

Install [Giscus](https://giscus.app/) for GitHub Discussions-based comments:

1. Add to `config.yml`:
   ```yaml
   params:
     comments: true
   ```

2. Configure Giscus in `layouts/partials/comments.html`

### Analytics

Add Google Analytics or Cloudflare Analytics in `config.yml`:

```yaml
googleAnalytics: "G-XXXXXXXXXX"
```

## Project Structure

```
.
├── config.yml              # Hugo configuration
├── content/                # Site content (Markdown)
├── layouts/                # Custom templates
├── static/                 # Static files (CSS, images)
├── themes/                 # Hugo themes (as submodules)
├── .github/workflows/      # CI/CD workflows
└── public/                 # Generated site (not in git)
```

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)
- [Markdown Guide](https://www.markdownguide.org/)

## License

MIT License — feel free to use this as a starting point for your own blog.
