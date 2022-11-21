function git_tags_match_remote
    git tag --list | xargs git tag -d
    git fetch --tags
end
