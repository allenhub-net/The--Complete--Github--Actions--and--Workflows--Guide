# Renovatebot

## create PRs in github not renovate console

🦠 renovate web service by default will create the dependency dashboard in the
 web console (the "developer console"), and not in a github issue.
  I found it difficult to find this setting based on naming.

"Silent Mode" seems to be the culprait, as least as far as naming clarity is concerned.

1. go to "SETTINGS"  
   ![Mend Renovate Settings](mend-renovate-settings.png)

1. Selection "Dependencies"

1. Configure

   ![Renovate Config Example](renovate-config.png)

   * ✅ Dependency Updates
   * ❌ Silent Mode
   * Renovate
     * ✅ Automated PRs
     * ✅ Require config file
     * ✅ Create onboarding PRs

## Commit message

![PR Settings](pr-settings.png)

### Default message

doesn't trigger semantic release the
way I want

### Pull Request Title

seems good

### 🏆 WINNER 🏆 PR Title and description

includes the branch and (clickable) PR number in the commit summary
