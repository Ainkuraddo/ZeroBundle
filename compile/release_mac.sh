rm ../../Ainkuraddo-mac/.DS_Store
rm -Rfv ../../Ainkuraddo-mac/Ainkuraddo.app/Contents/Resources/core
cp -fv dist/Ainkuraddo.app/Contents/MacOS/Ainkuraddo ../../Ainkuraddo-mac/Ainkuraddo.app/Contents/MacOS/Ainkuraddo
cp -Rv dist/Ainkuraddo.app/Contents/Resources/core ../../Ainkuraddo-mac/Ainkuraddo.app/Contents/Resources/
cp -Rv dist/Ainkuraddo.app/Contents/Resources/*.py ../../Ainkuraddo-mac/Ainkuraddo.app/Contents/Resources/
codesign --verbose=3 --force --sign "Developer ID Application: Tamas Kocsis (4977YF9Q3Z)" ../../Ainkuraddo-mac/Ainkuraddo.app
cd ../../Ainkuraddo-mac/
git status
read -p "OK?"
git add .
git commit -m "Update Update Ainkuraddo source code"
git push