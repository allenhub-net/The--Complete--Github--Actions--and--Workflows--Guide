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
      * [Markdown Using Scaled Image](#markdown-using-scaled-image)
<!--te-->
<!-- markdownlint-enable  -->

## Line Break

two blank spaces at the end  
of a line of text  
yields a line break

## Horizontal Rule

tripple dashes `---`

---
---
---

are a horizontal rule

## Bot Quoting

When I want to capture a conversation with a bot I spend more
time than I want fiddling around with the format.  As of
summer 2025, this seems work pretty well for me:

### _summary_: what was I trying to do when I initiated this bot chat

#### _question_: Q: _the (possibly edited for clarity) bot query_

Follow with the Q & A.  The first Q will be the exact syntax of the section header.

Participants (i.e.: me, Copilot) are bolded,
followed by a colon, followed by a linebreak (two trailing spaces).

Fiddle with the participant responses until it looks just the same as it
did in chat.  The formatting seems to carry with it much of the context of
the original chat.

Particpant responses are separated by a line of whitespace.

For example (from [Actions and Workflows](../actions-and-workflows/README.md)):

```markdown
**me**:  
what does this mean?  
`NEW_ENV_HEREDOC=$'foo\nbar'`

**GitHub Copilot**:  
The line

    NEW_ENV_HEREDOC=$'foo\nbar'

means that the environment variable `NEW_ENV_HEREDOC`
will contain the string `foo` followed by a newline, then `bar`.

So its value is:

    foo
    bar

The `$'...'` syntax in Bash allows you to use escape sequences like `\n`
for newlines.  
In the context of your workflow, this is how multi-line
environment variables are set using the here-doc syntax with `$GITHUB_ENV`.
```

## Image Links

### Leading _bang_ symbol

**me**:  
what does the "!" at the beginning of the line mean

**GitHub Copilot**:  
The "!" at the beginning of the line in Markdown is used to indicate an image.  
The full syntax is:

* The `!` tells Markdown this is an image, not a regular link.
* The text in brackets (`[]`) is the alt text (shown if the image can't be displayed).
* The text in parentheses (`()`) is the path or URL to the image.

## Image resizing

I have screenshot but I don't want it to dominate the page.  Markdown
doesn't seem to reliably render the image according to the
style marks.  ChatGPT says Markdown doesn't support image resizing.

I used `ImageMagick` to resize the image and link to the original.

### ImageMagick in a Codespace

<!-- markdownlint-disable -->

```bash
sudo apt update
sudo apt install imagemagick
convert secrets.png -resize 400x400 secrets-400x400.png

: feeling gnarly?
convert  -resize 400x400 -bordercolor black -border 2 -bordercolor yellow -border 4 -bordercolor black -border 2  renovate-config.png renovate-config-400x400.png
```
<!-- markdownlint-enable -->

### Markdown Using Scaled Image - which is slick

```text
[![Secrets Example](secrets-400x400.png)](secrets.png)
```
