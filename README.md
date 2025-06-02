# Git Bulk Rewrite Author

## ⚠️ WARNING: Use With Extreme Caution

**The `bulk-force-push-repos.sh` script uses `git push --force` across multiple repositories. This will overwrite history on remotes.**  
If used carelessly, it can **permanently destroy data** on shared branches.

> **DO NOT** use on production or collaborative repositories without explicit backups and consent.

---

## Installation

### Requirements

Before using these scripts, make sure the following tools are installed:

#### 1. [Git](https://git-scm.com/)
Install Git via your system's package manager or from the official site.

#### 2. [GitHub CLI (`gh`)](https://cli.github.com/)

Used to list and clone repositories from GitHub.

#### 3. [`git-filter-repo`](https://github.com/newren/git-filter-repo)

Used to rewrite Git commit author information.

## Overview

This project provides a set of Bash scripts to manage multiple Git repositories in bulk.  
The scripts automate tasks such as:

- Cloning multiple repositories  
- Searching for commits by a specific author  
- Rewriting Git author information  
- Force-pushing rewritten history to remotes  

---

## Scripts (Usage Order)

### 1. `bulk-clone-git-repos.sh`

Clones multiple Git repositories from a GitHub user or organization.

**Configuration:**
- `USERNAME`: GitHub username or organization to clone from  
- `CLONE_DIR`: directory to clone the repositories into (default: `./cloned-repos`)

**Usage:**
```bash
./bulk-clone-git-repos.sh
````

---

### 2. `bulk-find-author-name.sh`

Searches for commits by a specific author across multiple Git repositories.

**Configuration:**

* `SEARCH_NAME`: the author name to search for
* `ROOT_DIR`: root directory to search for Git repositories (default: current directory)

**Usage:**

```bash
./bulk-find-author-name.sh
```

---

### 3. `bulk-rewrite-git-author.sh`

Rewrites Git author information (name and email) across multiple Git repositories.

**Configuration:**

* `OLD_EMAILS`: array of old email addresses to replace
* `NEW_NAME`: new author name to set
* `NEW_EMAIL`: new author email to set
* `ROOT_DIR`: root directory to search for Git repositories (default: current directory)

**Usage:**

```bash
./bulk-rewrite-git-author.sh
```

---

### 4. `bulk-force-push-repos.sh`

Force-pushes changes to remote repositories for all Git repositories in the current directory.

**Usage:**

```bash
./bulk-force-push-repos.sh
```

> ⚠️ **DANGER:** This script will overwrite remote history using `git push --force`.
> Only run this if you fully understand the consequences.

---

## Usage Instructions

1. Clone this repository and copy the scripts to a directory with all the repos you would like to change. Or, use `bulk-clone-git-repos.sh` to clone all your repos in to a directory
2. Edit the configuration variables at the top of each script.
3. Run the scripts in the order listed above, adjusting configs as needed.

---

## Notes

* Test the scripts in a non-production environment before using on real repositories.
* Always ensure you have backups before rewriting or pushing history.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

