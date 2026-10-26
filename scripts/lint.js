import { spawnSync } from 'child_process';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

const hasDart = (() => {
  try {
    const res = spawnSync('dart', ['--version'], { stdio: 'pipe' });
    return res.status === 0;
  } catch {
    return false;
  }
})();

if (hasDart) {
  console.log('[Lint] Running dart analyze web/main.dart...');
  const res = spawnSync('dart', ['analyze', 'web/main.dart'], {
    cwd: rootDir,
    stdio: 'inherit',
  });
  process.exit(res.status ?? 0);
} else {
  console.log('[Lint] Dart executable not found; checking project build & assets...');
  const res = spawnSync('node', ['scripts/build.js'], {
    cwd: rootDir,
    stdio: 'inherit',
  });
  process.exit(res.status ?? 0);
}
