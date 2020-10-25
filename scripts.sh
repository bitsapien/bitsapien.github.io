#! /bin/zsh

blog_path="$HOME/gitdisk/projects/bitsapien-blog"

newpost () {
	post_file=$(echo "$1" | awk '{print tolower($0)}')
	post_file=${post_file// /-}
  post_file=${post_file//(.|\')/}
	pushd "$blog_path" || return
	hugo new posts/"$post_file.md"
	"$EDITOR" "$blog_path/content/posts/$post_file.md"
}


findpost() {
  rg --files -g "*$1*" "$blog_path/content"
}


editblog() {
  pushd $blog_path
  post_path="content"
  looked_up_post=$( ls $post_path/**/*.md | fzf )
  $EDITOR "$looked_up_post"
  popd
}

til() {
  tilfilepath="$blog_path/notes/til.md"
  echo "#### `date`\n$1\n" >> $tilfilepath
  echo "Filepath: $tilfilepath"
  echo ""
  tail -n 10 $tilfilepath
}

idea() {
  ideafilepath="$blog_path/notes/ideas.md"
  echo "$1 | tags: $2i\n\n------\n\n" >> $ideafilepath
  echo "Filepath: $ideafilepath"
  echo ""
  tail -n 10 $ideafilepath
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
}

jobs() {
  vi $blog_path/notes/jobs.md
}
