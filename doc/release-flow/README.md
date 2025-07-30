# Release Flow

<!-- markdownlint-disable -->
<!--ts-->
* [Release Flow](#release-flow)
   * [References](#references)
   * [Diagram Release Flow](#diagram-release-flow)
      * [Q: please diagram "release flow" as shown here: <a href="https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/" rel="nofollow">Release Flow - How We Do Branching on the VSTS Team</a>](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/)
   * [Release Flow for Udemy](#release-flow-for-udemy)
      * [How to Read the Diagram](#how-to-read-the-diagram)
      * [Diagram Notes](#diagram-notes)
   * [For This Course](#for-this-course)
   * [Release Flow Discovery](#release-flow-discovery)
<!--te-->
<!-- markdownlint-enable  -->

## References

[http://releaseflow.org/](http://releaseflow.org/)

[Release Flow - How We Do Branching on the VSTS Team](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/)

## Diagram Release Flow

### Q: please diagram "release flow" as shown here: [Release Flow - How We Do Branching on the VSTS Team](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/)

**me**:
please diagram "release flow" as shown here:
[Release Flow: How We Do Branching on the VSTS Team](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/)

please use mermaid, gitgraph, top-down

---

```mermaid


gitGraph TB:

 

   commit id: "main"
   branch release
   commit id: "release branch"
   branch hotfix
   commit id: "hotfix branch"
   checkout main
   branch user1
   commit id: "feature branch"
   commit id: "feature work"
   checkout main
   merge user1 id: "PR: Feature merged"
   checkout release
   merge main id: "PR: Main to Release"
   checkout hotfix
   commit id: "hotfix work"
   checkout release
   merge hotfix id: "PR: Hotfix to Release"
   checkout main
   merge hotfix id: "PR: Hotfix to Main"

   ```

Legend

* `main`: The trunk branch (always deployable).
* `release`: Cut from `main` for each release.
* `feature branch`: Developers work here, then PR to `main`.
* `hotfix branch`: For urgent fixes, PR to both `release` and `main`.

This diagram shows:

* Feature branches merged into `main`.
* `main` merged into release.
* Hotfix branches merged into both `release` and `main`.

---

## Release Flow for Udemy

```mermaid

gitGraph TB:


   commit id: "main"
   commit id: "main work"
   branch section_03
   checkout section_03
   commit id: "chapter_03_01 complete" tag: "v3.1.0"
   commit id: "chapter_03_02 complete" tag: "v3.2.0"
   commit id: "chapter_03_03 complete" tag: "v3.3.0"
   checkout main
   commit id: "main work"
   branch section_04
   checkout section_04
   commit id: "chapter_04_01 complete" tag: "v4.1.0"
   commit id: "hotfix applied" tag: "v4.1.1"
   checkout main
   merge section_04 id: "merge hotfix from section_04"
   checkout section_04
   commit id: "chapter_04_02 complete" tag: "v4.2.0"
   checkout section_03
   commit id: "EOL for section_03" tag: "EOL"


```

### How to Read the Diagram

* `main` is your mainline branch.
* `release/section_03` and `release/section_04` are long-lived section branches.
* Each `commit` on a section branch represents a completed chapter.
* `Tags` (e.g., `v3.1.0`, `v4.2.0`) are automatically created by
semantic-release after each chapter merge.
* You can patch chapters by merging fixes into the section branch, and
semantic-release will create a new patch tag.

### Diagram Notes

* Each `release/section_*` branch is long-lived.
* Each chapter completion is a commit.
* Each tag (e.g., `v3.1.0`) is created by `semantic-release` after merging a chapter.
* You can extend this for more sections/chapters as needed.

## For This Course

```mermaid
---
config:
  logLevel: 'debug'
  themeVariables:
      'git2': '#ff0000'
---
gitGraph TB:


commit
commit
commit
branch release/section_03
commit tag: "v3.0.0"

checkout main
commit
commit
checkout release/section_03
merge main tag: "v3.1.0"

branch maintenance/fix1
commit id: "renovate PR" tag: "v3.1.1"


checkout main
commit
commit
checkout release/section_03
merge main tag: "v3.2.0" 
merge maintenance/fix1  tag: "v3.2.1"



checkout main
commit
commit
commit
branch release/section_04
commit tag: "v4.0.0"


checkout main
commit
commit
checkout release/section_04
merge main  tag: "v4.1.0" 

checkout main
merge maintenance/fix1 id: "cherry pick to main" 

checkout release/section_04
merge maintenance/fix1 tag: "v4.1.1" id: "cherry pick to release/section_04"


checkout main
commit
commit
checkout release/section_04
merge main tag: "v4.2.0" 

checkout main
commit
commit


```

## Release Flow Discovery

[Release Flow - How We Do Branching on the VSTS Team](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/)
