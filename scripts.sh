#! /bin/zsh

blog_path="$HOME/gitdisk/projects/bitsapien-blog"

newpost () {
	post_file=$(echo "$1" | awk '{print tolower($0)}')
	post_file=${post_file// /-}
	pushd "$blog_path" || return
	hugo new posts/"$post_file.md"
	"$EDITOR" "$blog_path/content/posts/$post_file.md"
}


findpost() {
  rg --files -g "*$1*" "$blog_path/content"
}


editpost() {
  looked_up_post=$(findpost "$1" --max-count 1)
  $EDITOR "$looked_up_post"
}
