# GitHub Actions

## Update @wppconnect/wa-js

This workflow automatically updates the `priv/data/wppconnect-wa.js` file to the latest version of @wppconnect/wa-js package.

### Trigger Configuration

1. **Scheduled**: Workflow runs every day at 5:00 UTC
2. **Manual**: Can be triggered manually via GitHub interface (Actions → Update @wppconnect/wa-js → Run workflow)

### What the workflow does

1. **Gets latest release info** via GitHub API
2. **Compares versions** - current (from file) and latest available
3. **Downloads new version file** if update is needed
4. **Creates Pull Request** with the update

### Workflow structure

- `Get latest release info` - fetches information about the latest release
- `Get current version` - determines current version from the file
- `Check if update is needed` - compares versions
- `Download and update wppconnect-wa.js` - downloads new version (if needed)
- `Create Pull Request` - creates PR with changes

### Requirements

- Repository must have permissions to create Pull Requests
- Uses standard `GITHUB_TOKEN`

### Examples

#### Pull Request Title
```
chore: update @wppconnect/wa-js to v3.17.8
```

#### Branch Name
```
update-wppconnect-js-v3.17.8-{timestamp}
```

### Monitoring

The workflow automatically:
- Skips execution if version is already up to date
- Adds `dependencies` and `automated` labels to PR
- Assigns the workflow author to the PR
- Automatically deletes branch after PR merge

## Repository Settings Required

### GITHUB_TOKEN Configuration

**Good news**: `GITHUB_TOKEN` is automatically provided by GitHub Actions - **no manual configuration needed**.

However, you need to ensure the following repository settings:

### 1. Actions Permissions
Go to **Settings → Actions → General**:
- ✅ **Allow all actions and reusable workflows** (or configure as needed)
- ✅ **Workflow permissions**: Select "Read and write permissions"
- ✅ **Allow GitHub Actions to create and approve pull requests**: **ENABLE THIS**

### 2. Branch Protection (Optional but Recommended)
If you have branch protection on `master`/`main`:
- Go to **Settings → Branches**
- Make sure GitHub Actions can create PRs (usually enabled by default)

### 3. Required Settings Summary
| Setting | Location | Required Value |
|---------|----------|----------------|
| Actions permissions | Settings → Actions → General | Allow actions |
| Workflow permissions | Settings → Actions → General | Read and write permissions |
| Create PRs | Settings → Actions → General | ✅ Enabled |

### What happens if settings are incorrect:
- ❌ **No write permissions**: Workflow will fail when trying to create PR
- ❌ **Cannot create PRs**: Workflow will complete but no PR will be created
- ❌ **Actions disabled**: Workflow won't run at all 