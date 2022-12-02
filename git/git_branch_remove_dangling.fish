# Based on https://stackoverflow.com/a/22687460/4334071
function git_branch_remove_dangling -d "Remove local branches that have been deleted on the remote"

    # Update remote refs
    git fetch origin --prune

    # Switch to main branch
    git switch main

    # Get list of local branches and remote branches
    set REMOTE_BRANCHES (git for-each-ref --format="%(refname)" refs/remotes/origin/ | sed 's#^refs/remotes/origin/##')
    set LOCAL_BRANCHES (git for-each-ref --format="%(refname)" refs/heads/ | sed 's#^refs/heads/##')

    # Iterate over local branches
    for BRANCH in $LOCAL_BRANCHES
        # Skip branch if it is in remote branches
        if contains $BRANCH $REMOTE_BRANCHES
            continue
        end

        if test (count $argv) -ne 0
            echo "Deleting branch $BRANCH"
            git branch $argv[1] "$BRANCH"
        else
            if test (read -P "Delete branch $BRANCH? [y/N]") = y
                echo "Force deleting branch $BRANCH"
                git branch -D "$BRANCH"
            else
                echo "Skipping branch $BRANCH"
                continue
            end
        end
    end
end
