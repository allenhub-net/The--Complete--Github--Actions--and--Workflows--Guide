# Markdown

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Markdown](#markdown)
   * [Line Break](#line-break)
   * [Horizontal Rule](#horizontal-rule)
<!--te-->
<!-- markdownlint-enable MD007 -->

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

When I want to capture a conversation with a bot I spend more time than I want fiddling around with the format.  As of summer 2025, this seems work pretty well for me:

### _summary_: what was I trying to do when I initiated this bot chat

#### _question_: Q: _the (possibly edited for clarity) bot query_

Follow with the Q & A.  The first Q will be the exact syntax of the section header.

Participants (i.e.: me, Copilot) are bolded, followed by a colon, followed by a line break (two trailing spaces).

Fiddle with the participant responses until it looks just the same as it did in chat.  The formatting seems to carry with it much of the context of the original chat.

Particpant responses are separated by a line of whitespace.

For example (from [Actions and Workflows](../actions-and-workflows/README.md)):

```markdown
**me**:  
what does this mean?  
`NEW_ENV_HEREDOC=$'foo\nbar'`

**GitHub Copilot**:  
The line

    NEW_ENV_HEREDOC=$'foo\nbar'

means that the environment variable `NEW_ENV_HEREDOC` will contain the string `foo` followed by a newline, then `bar`.

So its value is:

    foo
    bar

The `$'...'` syntax in Bash allows you to use escape sequences like `\n` for newlines.  
In the context of your workflow, this is how multi-line environment variables are set using the here-doc syntax with `$GITHUB_ENV`.
```
