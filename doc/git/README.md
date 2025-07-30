# Markdown

<!-- markdownlint-disable -->
<!--ts-->
* [Markdown](#markdown)
   * [Line Break](#line-break)
   * [Horizontal Rule](#horizontal-rule)
   * [Bot Quoting](#bot-quoting)
   * [Image Links](#image-links)
      * [Leading <em>bang</em> symbol](#leading-bang-symbol)
   * [Image resizing](#image-resizing)
      * [ImageMagick in a Codespace](#imagemagick-in-a-codespace)
      * [Markdown Using Scaled Image - which is slick](#markdown-using-scaled-image---which-is-slick)
<!--te-->
<!-- markdownlint-enable  -->



## Rebase Since Branch Point

**me**:  
I am using git.  How do I say "I want to rebase -i everything since I branched from /main"

**GitHub Copilot**:  
You can use the following command to start an interactive rebase from the point where your branch diverged from `main`:

    git rebase -i $(git merge-base main HEAD) 

This finds the common ancestor of your current branch and `main`, and starts an interactive rebase from there.