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


editpost() {
  post_path="$blog_path/content/posts"
  looked_up_post=$( ls $post_path | fzf )
  $EDITOR "$post_path/$looked_up_post"
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
