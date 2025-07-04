# Codespaces

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Codespaces](#codespaces)
   * [GitHub Codespaces/VSCode](#github-codespacesvscode)
      * [Note VSCode Extensions to Document/Reproduce Codespace](#note-vscode-extensions-to-documentreproduce-codespace)
      * [Manual List](#manual-list)
<!--te-->
<!-- markdownlint-enable MD007 -->

## GitHub Codespaces/VSCode

### Note VSCode Extensions to Document/Reproduce Codespace

**me**:  
what is the smallest amount of information I need to keep about vscode extensions in order to build a new codespace that has the same extentions as the old one.  this is for disaster recovery

**ChatGPT**:  
Great question — for disaster recovery and rebuilding a VSCode environment (e.g., in a new Codespace) with the **same extensions**, you only need a **minimal list of extension identifiers**.

✅ Minimum Required Information
The only thing you absolutely need is the list of extension IDs, in the form:

```text
publisher.extension-name
```

For example:

```bash
ms-python.python
esbenp.prettier-vscode
dbaeumer.vscode-eslint
```

This list allows you to reinstall all extensions using a script or VSCode’s CLI (`code --install-extension`).

🧰 How to Get the List
You can easily export this list with the following command:

```bash
code --list-extensions > extensions.txt
```

This produces a file like:

```text
ms-python.python
esbenp.prettier-vscode
dbaeumer.vscode-eslint
```

🔁 How to Restore Extensions

In a new Codespace (or fresh install), restore with:

```bash
xargs -n 1 code --install-extension < extensions.txt
```

This re-installs all extensions listed in extensions.txt.

📝 Optional (But Useful) Enhancements

While the extension list alone is sufficient to rebuild your environment, you might also consider saving:

* settings.json (user or workspace settings)

* keybindings.json (custom shortcuts)

* snippets/ (any custom snippets)

* extensions.json (from .vscode/ folder, if using recommended extensions per project)

But again — for just restoring extensions, the extension ID list is the smallest and only required input.

### Manual List

```shell
echo ": $(date)" ; code --list-extensions | awk '!/^Extensions/ {print "code --install-extension", $0, "--force"}' | sort
```
<!-- extension-list -->

```shell
: Fri Jun 27 14:42:19 UTC 2025
code --install-extension bierner.markdown-mermaid --force
code --install-extension davidanson.vscode-markdownlint --force
code --install-extension github.codespaces --force
code --install-extension github.copilot --force
code --install-extension github.copilot-chat --force
code --install-extension github.github-vscode-theme --force
code --install-extension github.vscode-pull-request-github --force
code --install-extension gruntfuggly.todo-tree --force
code --install-extension redhat.vscode-yaml --force
```
<!-- noisnetxe-tsil -->

Note: `github.vscode-github-actions` does not work well in my GitHub Codespaces.
