import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { spawnSync } from 'child_process';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

console.log('[Build] Starting CampusPulse build for GitHub Pages & production...');

// Step 1: Optional Dart re-compile if dart tool is installed
const hasDart = (() => {
  try {
    const res = spawnSync('dart', ['--version'], { stdio: 'pipe' });
    return res.status === 0;
  } catch {
    return false;
  }
})();

if (hasDart) {
  console.log('[Build] Compiling Dart source (web/main.dart -> web/main.dart.js)...');
  const dartRes = spawnSync('dart', ['compile', 'js', 'web/main.dart', '-o', 'web/main.dart.js'], {
    cwd: rootDir,
    stdio: 'inherit',
  });
  if (dartRes.status !== 0) {
    console.error('[Build] Warning: Dart compilation failed, falling back to existing web/main.dart.js');
  } else {
    console.log('[Build] Dart compilation succeeded.');
  }
} else {
  console.log('[Build] Dart compiler not found in environment; using pre-compiled web/main.dart.js.');
}

// Step 2: Ensure public/ directory structure exists
const publicDir = path.join(rootDir, 'public');
const publicWebDir = path.join(publicDir, 'web');
const publicAssetsImgDir = path.join(publicDir, 'assets', 'images');

fs.mkdirSync(publicWebDir, { recursive: true });
fs.mkdirSync(publicAssetsImgDir, { recursive: true });

// Step 3: Copy web/main.dart.js to public/web/
const srcDartJs = path.join(rootDir, 'web', 'main.dart.js');
const destDartJs = path.join(publicWebDir, 'main.dart.js');
if (fs.existsSync(srcDartJs)) {
  fs.copyFileSync(srcDartJs, destDartJs);
  console.log('[Build] Copied web/main.dart.js to public/web/main.dart.js');
} else {
  console.error('[Build] Error: web/main.dart.js not found!');
  process.exit(1);
}

// Also copy .deps / .map if available
const srcDartMap = path.join(rootDir, 'web', 'main.dart.js.map');
if (fs.existsSync(srcDartMap)) {
  fs.copyFileSync(srcDartMap, path.join(publicWebDir, 'main.dart.js.map'));
}

// Step 4: Copy src/assets/images to public/assets/images
const srcImgDir = path.join(rootDir, 'src', 'assets', 'images');
if (fs.existsSync(srcImgDir)) {
  const images = fs.readdirSync(srcImgDir);
  for (const img of images) {
    const fromPath = path.join(srcImgDir, img);
    const toPath = path.join(publicAssetsImgDir, img);
    fs.copyFileSync(fromPath, toPath);
  }
  console.log(`[Build] Copied ${images.length} images to public/assets/images/`);
}

// Also copy images to public/src/assets/images as fallback for any legacy paths
const publicSrcAssetsImgDir = path.join(publicDir, 'src', 'assets', 'images');
fs.mkdirSync(publicSrcAssetsImgDir, { recursive: true });
if (fs.existsSync(srcImgDir)) {
  const images = fs.readdirSync(srcImgDir);
  for (const img of images) {
    fs.copyFileSync(path.join(srcImgDir, img), path.join(publicSrcAssetsImgDir, img));
  }
}

// Step 5: Create .nojekyll in public/ to prevent GitHub Pages from ignoring assets or breaking files
fs.writeFileSync(path.join(publicDir, '.nojekyll'), '');
console.log('[Build] Created public/.nojekyll');

// Step 6: Run vite build
console.log('[Build] Executing vite build...');
const viteRes = spawnSync('npx', ['vite', 'build'], {
  cwd: rootDir,
  stdio: 'inherit',
});

if (viteRes.status !== 0) {
  console.error('[Build] Vite build failed with exit code', viteRes.status);
  process.exit(viteRes.status || 1);
}

// Step 7: Post-build optimizations for GitHub Pages
const distDir = path.join(rootDir, 'dist');
if (fs.existsSync(distDir)) {
  // Ensure .nojekyll exists in dist
  fs.writeFileSync(path.join(distDir, '.nojekyll'), '');

  // Copy dist/index.html to dist/404.html for GitHub Pages SPA routing
  const distIndex = path.join(distDir, 'index.html');
  const dist404 = path.join(distDir, '404.html');
  if (fs.existsSync(distIndex)) {
    fs.copyFileSync(distIndex, dist404);
    console.log('[Build] Created dist/404.html for GitHub Pages routing');
  }

  // Also sync dist/ to docs/ for users who select "Deploy from /docs folder" in GitHub Pages settings
  const docsDir = path.join(rootDir, 'docs');
  fs.mkdirSync(docsDir, { recursive: true });
  fs.cpSync(distDir, docsDir, { recursive: true });
  console.log('[Build] Synced dist/ to docs/ for GitHub Pages /docs deployment support');
}

console.log('[Build] Build completed successfully! Ready for GitHub Pages deployment.');
