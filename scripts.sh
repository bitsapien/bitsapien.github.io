#! /bin/zsh

blog_server=$(which hugo)
blog_path="$HOME/gitdisk/projects/bitsapien-blog"

alias editnow="$blog_server server -D > /tmp/hugo.log & $EDITOR $blog_path/content/now/index.md"

newpost () {
  if [ $# -lt 2 ]
  then
    echo "Usage: newpost <article-type> <title>"
    return 1
  fi
  type=$1
  title=$2
  pushd $blog_path
	post_file=$(echo "$title" | awk '{print tolower($0)}')
	post_file=${post_file// /-}
  post_file=${post_file//(.|\')/}
	pushd "$blog_path" || return
	hugo new $type/"$post_file.md"
	"$EDITOR" "$blog_path/content/$type/$post_file.md"
  git add $blog_path/content/$type/$post_file.md
  git commit -m "Article[$type]: $title"

}

editblog() {
  pushd $blog_path
  post_path="content"
  looked_up_post=$( ls $post_path/**/*.md | fzf )
  $EDITOR "$looked_up_post"
  popd
}

til() {
  pushd $blog_path
  tilfilepath="$blog_path/notes/til.md"
  echo "#### `date`\n$1\n" >> $tilfilepath
  echo "Filepath: $tilfilepath"
  echo ""
  tail -n 10 $tilfilepath
  git add $tilfilepath
  git commit -m "TIL: ${1}:5 ..."
  popd
  echo "Push changes when ready"
}

idea() {
  pushd $blog_path
  ideafilepath="$blog_path/content/ideas/index.md"
  echo "$1 | tags: $2\n\n------\n\n" >> $ideafilepath
  echo "Filepath: $ideafilepath"
  echo ""
  tail -n 10 $ideafilepath
  git add $ideafilepath
  git commit -m "Idea: ${1}:5 ..."
  popd
  echo "Push changes when ready"
}

willread() {
  readinglistpath="$blog_path/notes/read.csv"
  name=$1
  isbn=$2
  context=$3
  echo "ISBN: $isbn"
  bookdata=$(curl -sL https://openlibrary.org/isbn/$isbn.json)
  bookname=$(echo $bookdata | jq ".title")
  bookauthorref=$(echo $bookdata | jq -r ".authors[].key")
  bookauthor=$(curl -s https://openlibrary.org$bookauthorref.json | jq .name)
  booktags=$(echo $bookdata | jq -r ".subjects[]")
  goodreadlink=$(curl -s "https://www.goodreads.com/book/auto_complete?format=json&q=$isbn" | jq -r ".[].description.fullContentUrl")
  booktagscsv=$(echo $booktags | tr '\n' ' |')

  csventry=",$bookname,$bookauthor,$context,$booktagscsv,$goodreadlink"

  echo $csventry
  echo "Is this fine? (y/n)"
  read response
  if [[ $response == "y" ]]; then
    echo $csventry >> $readinglistpath
    echo "Wrote to $readinglistpath"
  fi
  echo "commiting"
  pushd $blog_path
  git add $readinglistpath
  git commit -m "Read: Added $name"
  git push origin
  popd
}

function jobapp() {
  pushd $blog_path
  $EDITOR notes/jobs.md
  git add notes/jobs.md
  git commit
  popd
}
