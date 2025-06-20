
# Actions and Workflows

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Actions and Workflows](#actions-and-workflows)
   * [Workflow Run Title](#workflow-run-title)
      * [Q: why does the title of this workflow run show up as "semantic release", and not the commit summary?](#q-why-does-the-title-of-this-workflow-run-show-up-as-semantic-release-and-not-the-commit-summary)
      * [Q: why does the title of this workflow show up at the commit summary and not "github-markdown-toc"](#q-why-does-the-title-of-this-workflow-show-up-at-the-commit-summary-and-not-github-markdown-toc)
      * [Q: what will the title of the workflow run be if the triggering event was "workflow_run"?](#q-what-will-the-title-of-the-workflow-run-be-if-the-triggering-event-was-workflow_run)
<!--te-->
<!-- markdownlint-enable MD007 -->

## Workflow Run Title

### Q: why does the title of this workflow run show up as "semantic release", and not the commit summary?

**me**:  
why does the title of this workflow run show up as "semantic release", and not the commit summary?

**GitHub Copilot**:  
The title of the workflow run shows up as "semantic-release" because that's the value set in the name: field at the top of your workflow file:

    name: semantic-release

The value you set here determines the workflow's display name in the GitHub Actions UI.

---

The string you have in the job name:

    name: Semantic Release (triggered by "${{ github.event.head_commit.message || github.event.workflow_run.head_commit.message }}")

...only affects the **job name** within the workflow run, not the overall workflow run title.

---

**To show the commit summary as the workflow run title:**  
GitHub Actions does not currently support dynamic workflow names based on commit messages or event data. The `name:` field at the top must be static.

**Summary**:

* The workflow run title comes from the static `name:` field.
* Dynamic names are only possible for jobs/steps, not the workflow run itself.

### Q: why does the title of this workflow show up at the commit summary and not "github-markdown-toc"

**me**: why does the title of this workflow show up at the commit summary and not "github-markdown-toc"

**GitHub Copilot**:  
The **title of this workflow run** still shows up as "**github-markdown-toc**" (from the `name:` field at the top of your workflow file):

    name: github-markdown-toc

However, **if you see the commit summary as the workflow run title**, it's likely because:

* When a workflow is triggered by a `push` event, **GitHub displays the commit message as the workflow run title** in the Actions list, instead of the static workflow name.
* When triggered by `workflow_dispatch` (manual run), it uses the static `name:` field.  

**Summary**:

* For `push` events: The workflow run title is the commit message.
* For manual runs: The workflow run title is the value of `name:` in the workflow file.

This is default GitHub Actions UI behavior.

### Q: what will the title of the workflow run be if the triggering event was "workflow_run"?

**me**:  
what will the title of the workflow run be if the triggering event was "workflow_run"?

**GitHub Copilot**:  
If the triggering event was `workflow_run`, **the title of the workflow run will be the value of the `name:` field at the top of your workflow file**:

    name: semantic-release
    
So, the workflow run will be titled `"semantic-release"` in the GitHub Actions UI.

> The dynamic job name (`Semantic Release (triggered by "...")`) only affects the job name inside the run, not the overall workflow run title.  
For `workflow_run` triggers, GitHub always uses the static `name:` field for the workflow run title.

## Dollar Sign Prefix to a Bash String

### Q: what does this mean? NEW_ENV_HEREDOC=$'foo\nbar'

GitHub Copilot
The line

means that the environment variable NEW_ENV_HEREDOC will contain the string foo followed by a newline, then bar.
So its value is:

The $'...' syntax in Bash allows you to use escape sequences like \n for newlines.
In the context of your workflow, this is how multi-line environment variables are set using the here-doc syntax with $GITHUB_ENV.