function git_tags_match_remore
    git tag --list | xargs git tag -d
    git fetch --tags
end
