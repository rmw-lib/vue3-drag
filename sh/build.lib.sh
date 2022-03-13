cd src
echo 'export default 0' > config/is_dev.coffee
npx coffee -bc ./vite.config.coffee ./config/*.coffee
LIB=1 npx vite build
