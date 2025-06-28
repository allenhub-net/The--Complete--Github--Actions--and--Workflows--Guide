
# Mermaid

<!-- markdownlint-disable MD007 -->
<!--ts-->
* [Mermaid](#mermaid)
   * [Repository Map](#repository-map)
<!--te-->
<!-- markdownlint-enable MD007 -->

## Repository Map

<!-- markdownlint-disable MD033 -->

<table>
    <tr>
        <td style="border:none;">See:</td>
        <td/>
    </tr>
    <tr>
        <td style="border:none;"></td>
        <td style="border:none;"><a href="../../section_02/update-mermaid-graph.js">Mermaid Graph Generator</a></td>
    </tr>
    <tr>
        <td style="border:none;"></td>
        <td style="border:none;"><a href="../../.github/workflows/mermaid.yml">GitHub Mermaid Workflow</a></td>
    </tr>
</table>

<!-- markdownlint-enable MD033 -->

---

```mermaid

%% Repository Structure
graph LR;
    %% Double vertical spacing
    classDef doubledSpacing height:60px;
    ROOT["/ (root)"]:::doubledSpacing
    ROOT --> ._GITHUB[".github/"]:::doubledSpacing
    ._GITHUB --> ..GITHUB_RENOVATEJSON["renovate.json"]:::doubledSpacing
    ._GITHUB --> ..GITHUB_WORKFLOWS["workflows/"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_DELETEPRERELEASESSH["delete-prereleases.sh"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_DELETEPRERELEASESYML["delete-prereleases.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_EXTERNALYML["external.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_GITHUBMARKDOWNTOCYML["github-markdown-toc.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_MERMAIDYML["mermaid.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0104FIRSTWORKFLOWYML["s01-04-first-workflow.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0114CHECKOUTYML["s01-14-checkout.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0215EVENTSYML["s02-15-events.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0221MANUALYML["s02-21-manual.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0324CONTEXTSYML["s03-24-contexts.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0328ENVYML["s03-28-env.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0329VARSANDSECRETSYML["s03-29-vars-and-secrets.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0330BIGANDSENSITIVEYML["s03-30-big-and-sensitive.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0331PRCOMMENTYML["s03-31-pr-comment.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0432STATUSYML["s04-32-status.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0434MATRIXYML["s04-34-matrix.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_S0436DYNAMICMATRIXYML["s04-36-dynamic-matrix.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_SEMANTICPRERELEASEYML["semantic-prerelease.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_SEMANTICRELEASEYML["semantic-release.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_SIMPLEACTIONYML["simple-action.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_STALEYML["stale.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_WORKFLOWCOMMANDSYML["workflow-commands.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_WORKFLOWRUNYML["workflow-run.yml"]:::doubledSpacing
    ..GITHUB_WORKFLOWS --> ..GITHUBWORKFLOWS_WORKINGDIRSANDSHELLSYML["working-dirs-and-shells.yml"]:::doubledSpacing
    ROOT --> ._READMEMD["README.md"]:::doubledSpacing
    ROOT --> ._DOC["doc/"]:::doubledSpacing
    ._DOC --> .DOC_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_ACTIONSANDWORKFLOWS["actions-and-workflows/"]:::doubledSpacing
    .DOC_ACTIONSANDWORKFLOWS --> .DOCACTIONS-AND-WORKFLOWS_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_CODESPACES["codespaces/"]:::doubledSpacing
    .DOC_CODESPACES --> .DOCCODESPACES_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_DEPENDABOT["dependabot/"]:::doubledSpacing
    .DOC_DEPENDABOT --> .DOCDEPENDABOT_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_EKS["eks/"]:::doubledSpacing
    .DOC_EKS --> .DOCEKS_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_MARKDOWN["markdown/"]:::doubledSpacing
    .DOC_MARKDOWN --> .DOCMARKDOWN_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_MERMAID["mermaid/"]:::doubledSpacing
    .DOC_MERMAID --> .DOCMERMAID_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_RENOVATEBOT["renovatebot/"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_READMEMD["README.md"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_MENDRENOVATESETTINGS400X400PNG["mend-renovate-settings-400x400.png"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_MENDRENOVATESETTINGSPNG["mend-renovate-settings.png"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_PRSETTINGS400X400PNG["pr-settings-400x400.png"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_PRSETTINGSPNG["pr-settings.png"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_RENOVATECONFIG400X400PNG["renovate-config-400x400.png"]:::doubledSpacing
    .DOC_RENOVATEBOT --> .DOCRENOVATEBOT_RENOVATECONFIGPNG["renovate-config.png"]:::doubledSpacing
    ._DOC --> .DOC_SEMANTICRELEASE["semantic-release/"]:::doubledSpacing
    .DOC_SEMANTICRELEASE --> .DOCSEMANTIC-RELEASE_READMEMD["README.md"]:::doubledSpacing
    ._DOC --> .DOC_TODO["todo/"]:::doubledSpacing
    .DOC_TODO --> .DOCTODO_READMEMD["README.md"]:::doubledSpacing
    ROOT --> ._SECTION_01["section_01/"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_READMEMD["README.md"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_APPJS["app.js"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_CONVERTJS["convert.js"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_INPUTYAML["input.yaml"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_OUTPUTJSON["output.json"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_PACKAGELOCKJSON["package-lock.json"]:::doubledSpacing
    ._SECTION_01 --> .SECTION_01_PACKAGEJSON["package.json"]:::doubledSpacing
    ROOT --> ._SECTION_02["section_02/"]:::doubledSpacing
    ._SECTION_02 --> .SECTION_02_READMEMD["README.md"]:::doubledSpacing
    ._SECTION_02 --> .SECTION_02_PACKAGELOCKJSON["package-lock.json"]:::doubledSpacing
    ._SECTION_02 --> .SECTION_02_PACKAGEJSON["package.json"]:::doubledSpacing
    ._SECTION_02 --> .SECTION_02_UPDATEMERMAIDGRAPHJS["update-mermaid-graph.js"]:::doubledSpacing
    ROOT --> ._SECTION_03["section_03/"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_READMEMD["README.md"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_SECRETJSONGPG["secret.json.gpg"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_SECRETS400X400PNG["secrets-400x400.png"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_SECRETSPNG["secrets.png"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_VARIABLES400X400PNG["variables-400x400.png"]:::doubledSpacing
    ._SECTION_03 --> .SECTION_03_VARIABLESPNG["variables.png"]:::doubledSpacing
    ROOT --> ._SECTION_04["section_04/"]:::doubledSpacing
    ._SECTION_04 --> .SECTION_04_READMEMD["README.md"]:::doubledSpacing
    ROOT --> ._UTIL["util/"]:::doubledSpacing
    ._UTIL --> .UTIL_DERENOVATESH["de-renovate.sh"]:::doubledSpacing
    ._UTIL --> .UTIL_PROTECTEDBRANCHPSH["protected-branch-p.sh"]:::doubledSpacing
```
