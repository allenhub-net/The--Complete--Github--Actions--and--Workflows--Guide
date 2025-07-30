# Git

<!-- markdownlint-disable -->
<!--ts-->
* [Git](#git)
   * [Rebase Since Branch Point](#rebase-since-branch-point)
<!--te-->
<!-- markdownlint-enable  -->



## Rebase Since Branch Point

**me**:  
I am using git.  How do I say "I want to rebase -i everything since I branched from /main"

**GitHub Copilot**:  
You can use the following command to start an interactive rebase from the point where your branch diverged from `main`:

    git rebase -i $(git merge-base main HEAD) 

This finds the common ancestor of your current branch and `main`, and starts an interactive rebase from there.