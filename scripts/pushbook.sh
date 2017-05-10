#!/bin/sh

setup_git() {
  git config --global user.email "nathan.eastwood@icloud.com"
  git config --global user.name "nathaneastwood"
}

commit_website_files() {
  git add docs
  git commit -m "chore: Travis build $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/datasciencecampus/coding-standards.git > /dev/null 2>&1
  git push --quiet --set-upstream origin master
}

setup_git
commit_website_files
upload_files