# Jekyll Blog Publishing Toolkit

This toolkit provides a set of scripts to simplify the management of your Jekyll blog.

## 📋 Prerequisites

- Ruby (2.6.0 or higher)
- Jekyll and Bundler gems
- Git
- ImageMagick (for image processing)

## 🚀 Getting Started

1. Clone your blog repository
2. Navigate to your blog directory
3. Use the scripts in this toolkit to manage your blog

## 🌐 GitHub Pages Deployment

This blog is configured to deploy to GitHub Pages automatically when changes are pushed to the `main` branch. The deployment process uses GitHub Actions workflows and creates a `gh-pages` branch with the built site.

### How it works:

1. Push changes to the `main` branch
2. GitHub Actions workflow runs:
   - Sets up Ruby environment
   - Installs dependencies
   - Builds the Jekyll site
   - Deploys to the `gh-pages` branch
3. GitHub Pages serves the content from the `gh-pages` branch

### Troubleshooting Deployment:

If your site is not showing up at the correct URL, check:
- GitHub repository settings to ensure Pages is enabled
- Actions tab to see if workflow completed successfully
- Ensure the base URL and site URL settings are correct in `_config.yml`

## 🛠️ Available Scripts

### 1. Publishing a New Post

Use the `publish_post.rb` script to create a new post with the proper front matter:

```bash
./publish_post.rb "Your Post Title" [category]
```

Arguments:
- `"Your Post Title"`: The title of your post (required)
- `category`: The category for your post (optional, defaults to "general")

This will create a new file in the `_posts` directory with the correct date and slug format.

### 2. Processing Images

Use the `process_images.rb` script to optimize images for your blog:

```bash
./process_images.rb path/to/image.jpg [width]
```

Arguments:
- `path/to/image.jpg`: Path to the image you want to process (required)
- `width`: Target width in pixels for the thumbnail (optional, defaults to 800)

This script will:
1. Copy the original image to the `assets/images` directory
2. Create an optimized thumbnail version
3. Output Markdown code for including the images in your posts

Requirements: ImageMagick must be installed on your system.

### 3. Syncing with GitHub

Use the `sync.sh` script to synchronize your changes with GitHub:

```bash
./sync.sh "Commit message"
```

Arguments:
- `"Commit message"`: A descriptive message for your commit (required)

This script will:
1. Pull the latest changes from your remote repository
2. Add all your local changes
3. Commit the changes with your provided message
4. Push the changes to GitHub

### 4. Deploying to GitHub Pages

Use the `deploy.sh` script to build and deploy your blog to GitHub Pages:

```bash
./deploy.sh ["Commit message"]
```

Arguments:
- `"Commit message"`: A descriptive message for your commit (optional, defaults to "Update blog content")

This script will:
1. Pull the latest changes from your remote repository
2. Build the site with Jekyll in production mode
3. Add all your local changes
4. Commit the changes with your provided message
5. Push the changes to GitHub Pages

### 5. Environment Variable Processing

The `process_env.rb` script is used primarily in the GitHub Actions workflow to configure your site based on environment variables:

- `JEKYLL_SHOW_ADS`: Set to 'true' to enable ads
- `LEFT_AD_CONTENT`: HTML content for the left ad space
- `RIGHT_AD_CONTENT`: HTML content for the right ad space

## 🖼️ Image Resources

The toolkit includes resources to help you with images:

1. **Placeholder Images**: Use the SVG placeholder at `assets/images/placeholder.svg` for quick mockups
2. **Image Generator**: Open `assets/images/placeholder.html` in your browser to generate custom placeholder images

## ⚙️ Advanced Configuration

### Custom Styling

The site includes a custom CSS file at `assets/css/custom.css` where you can add your own styling without modifying the Jekyll theme files.

### Ad Management

Ads are disabled by default. To enable them in production:

1. Set the `JEKYLL_SHOW_ADS` environment variable to 'true' in your GitHub Actions workflow
2. Customize the ad content using the `LEFT_AD_CONTENT` and `RIGHT_AD_CONTENT` environment variables

## 🔍 Troubleshooting

If you encounter issues:

1. Make sure all scripts are executable (`chmod +x script_name.rb`)
2. Verify that you have the required dependencies installed
3. Check the GitHub Actions workflow output for build errors

## 🤝 Contributing

Feel free to enhance these scripts or add new ones to improve your Jekyll blogging experience.

## 📜 License

This toolkit is available under the MIT License. Feel free to use and modify it for your own projects.
