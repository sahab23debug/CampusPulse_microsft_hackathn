# CampusPulse - University Study-Buddy & Campus Event Platform

CampusPulse is a campus life and academic collaboration platform built with pure Dart and HTML, styled with modern Tailwind CSS.

## 🚀 GitHub Pages Deployment Guide

This project is fully configured to work seamlessly on **GitHub Pages**, whether your repository is hosted at a subpath (`https://<username>.github.io/<repository-name>/`) or at a custom root domain.

### Option 1: Automatic Deployment via GitHub Actions (Recommended)

1. Push this repository to GitHub.
2. On GitHub, navigate to your repository's **Settings** tab.
3. In the left sidebar, click on **Pages** (under the "Code and automation" section).
4. Under **Build and deployment > Source**, select **GitHub Actions**.
5. Once selected, pushing any commit to `main` (or `master`) will automatically trigger the included workflow (`.github/workflows/deploy.yml`), which builds the project and deploys it directly to GitHub Pages.
6. Your live site will be ready at `https://<username>.github.io/<repository-name>/`.

---

### Option 2: 1-Click Deployment via `/docs` Folder (No Actions Needed)

If you prefer deploying directly from your repository branch without running GitHub Actions:

1. Run `npm run build` locally (this automatically generates the production bundle in the `/docs` folder).
2. Commit and push the changes (including the `/docs` folder) to your repository.
3. On GitHub, go to your repository **Settings > Pages**.
4. Under **Build and deployment > Source**, select **Deploy from a branch**.
5. Choose your default branch (`main` or `master`) and select the `/docs` folder from the dropdown.
6. Click **Save**. GitHub Pages will publish the site within 1–2 minutes.

---

### Key Fixes Included for GitHub Pages:

- **Relative Asset Base (`./`)**: Configured `base: './'` in `vite.config.ts` and relative asset links in `index.html`, eliminating 404 errors caused by GitHub repository subpaths.
- **Dart Runtime Bundling**: Copies `main.dart.js` into `public/web/` so Vite copies it into the production build distribution.
- **Jekyll Bypassed (`.nojekyll`)**: Includes `.nojekyll` in the build output to prevent GitHub's default Jekyll processor from ignoring assets or breaking files.
- **SPA Fallback (`404.html`)**: Automatically generates a `404.html` copy of the application so deep links and refreshes on GitHub Pages route smoothly.
- **Relative Media Assets**: Converted all background and event images to relative paths (`./assets/images/...`), ensuring images load properly on any domain or subpath.
