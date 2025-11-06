# DevUtilityAndroidV2.5 - GitHub Actions Build Instructions

## Overview
This project includes GitHub Actions workflows to automatically build the Android application. The workflows will compile the DevUtilityAndroidV2.5 app and generate APKs for both debug and release variants.

## Build Workflows

### 1. Automatic Build (`build.yml`)
This workflow automatically runs when code is pushed to the main/master branch or when a pull request is made. It:
- Sets up the Android development environment
- Builds debug and release APKs
- Uploads the APKs as artifacts

### 2. Scheduled Build (`android-build-apk-hosted_Version2.yml`)
This workflow can be triggered manually or runs weekly. It provides:
- Full Android SDK setup with NDK support
- Debug and release APK builds
- Artifact upload

## How to Use

### Automatic Builds
Simply push your changes to the `main` or `master` branch, and the build workflow will run automatically.

### Manual Builds
1. Go to the "Actions" tab in your GitHub repository
2. Select the workflow you want to run
3. Click "Run workflow" 
4. Choose the branch and click "Run workflow"

### Scheduled Builds
The workflow in `github_workflows_android-build-apk-hosted_Version2.yml.txt` is set to run weekly on Sundays at 06:00 UTC. You can modify this schedule by editing the cron expression in the file.

## Generated APKs
After a successful build, you can download the APKs from the workflow run:
- `DevUtilityAndroidV2.5-debug`: Debug version for testing
- `DevUtilityAndroidV2.5-release`: Release version (unsigned, requires signing for production)

## Troubleshooting
- If builds fail due to memory issues, the workflow includes appropriate JVM options
- For large projects, ensure your GitHub plan supports the required build time
- Check the logs in the Actions tab for detailed error information

## Configuration
The build workflows are configured in:
- `.github/workflows/build.yml` - Primary workflow
- `github_workflows_android-build-apk-hosted_Version2.yml.txt` - Advanced workflow template
- `github_workflows_android-generate-and-upload-sources_Version2.yml.txt` - Source generation workflow

The project is set up to build with Android Gradle Plugin 8.2.0, targeting API level 35, with minimum SDK 29.