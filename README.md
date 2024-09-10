# New Mac Setup

Instructions for setting up a new Mac with my preferred development settings/configs.

## Mac Configurations

### Settings

#### Appearance

- Appearance: `Auto`
- Click in the scroll bar to: `Jump to the spot that's clicked`

#### Desktop & Dock

##### Dock section

- Position on screen: `Left`
- Minimise windows using: `Genie Effect`
- Double-click a window's title bar to: `Zoom`
- Minimise windows into application icon: `On`
- Automatically hide and show the Docker: `Off`
- Animate opening applications: `On`
- Show indicators for open application: `On`
- Show suggested and recent apps in Dock: `Off`

###  Finder

1. `cmd + ,` to open app settings

2. General Tab

- For "Show these items on the desktop, check `External disks`, `Connected servers` and uncheck everything else.
- Change "New Finder windows show" dropdown to "home" (e.g. "hao").
- Leave "Open folders in tabs instead of new windows" checked.

3. Tags Tab

- Uncheck all tags

4. Side Bar Tab

Check the following and uncheck the rest:

- Favourites
  - AirDrop
  - Applications
  - Downloads
  - hao
- iCloud
  - iCloud Drive
  - Shared
  - Desktop
  - Documents
- Locations
  - External disks
  - CDs, DVDs and iOS Devices
  - Cloud Storage
  - Bonjour computers
  - Connected Servers

5. Advanced Tab

Check the following and uncheck everything else:

- "Show warning before removing from iCloud Drive"
- "Show warning before emptying the Bin"
- "Remove items from the Bin after 30 days"

Change "When performing a search" dropdown to `Search the Current Folder`.

6. View (menu bar)

- Change to "View as List"
- Turn on "Show Path Bar"

## Install Mac Apps

Copy the following and save to a text file e.g. `mac-apps`.

```txt
jordanbaird-ice
rectangle-pro
stats
itsycal
time-out
keycastr
Keka
kap
nvm
```

Then install all the apps with the following command:

```bash
xargs brew install < mac-apps
```

## VS Code

### Settings

Here are the VS code settings. Copy and paste into `user-settings.json` within VS Code.

```json
{
  "workbench.editor.showTabs": "none",
  "workbench.statusBar.visible": false,
  "workbench.list.smoothScrolling": true,
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "GitHub Dark High Contrast",
  "workbench.colorCustomizations": {
    "editor.background": "#212121",
    "editorLineNumber.foreground": "#E0E0E0",
    "editor.lineHighlightBorder": "#444",
    "editor.lineHighlightBackground": "#444"
  },
  "editor.formatOnSave": true,
  "editor.snippetSuggestions": "top",
  "editor.renderLineHighlight": "all",
  "editor.minimap.autohide": true,
  "editor.minimap.renderCharacters": false,
  "editor.wordWrap": "on",
  "editor.suggestSelection": "first",
  "editor.scrollbar.vertical": "auto",
  "editor.guides.bracketPairs": false,
  "editor.fontFamily": "JetBrains Mono, Menlo, Monaco, 'Courier New', monospace",
  "editor.fontLigatures": true,
  "editor.guides.indentation": false,
  "editor.inlineSuggest.enabled": true,
  "editor.scrollBeyondLastLine": false,
  "editor.smoothScrolling": true,
  "editor.fastScrollSensitivity": 1,
  "editor.mouseWheelScrollSensitivity": 0.5,
  "editor.renderLineHighlightOnlyWhenFocus": true,
  "diffEditor.ignoreTrimWhitespace": false,
  "diffEditor.wordWrap": "off",
  "git.autofetch": true,
  "git.confirmSync": false,
  "githubPullRequests.pullBranch": "never",
  "gitlens.hovers.currentLine.over": "line",
  "gitlens.currentLine.enabled": false,
  "gitlens.plusFeatures.enabled": false,
  "gitlens.ai.experimental.provider": "openai",
  "gitlens.ai.experimental.openai.model": "gpt-4-1106-preview",
  "typescript.enablePromptUseWorkspaceTsdk": true,
  "typescript.updateImportsOnFileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "cSpell.enabled": false,
  "cSpell.language": "en-GB",
  "totalTypeScript.hideAllTips": true,
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.smoothScrolling": true,
  "terminal.integrated.mouseWheelScrollSensitivity": 1,
  "markdown-preview-enhanced.scrollSync": false,
  "indentRainbow.indicatorStyle": "light",
  "indentRainbow.lightIndicatorStyleLineWidth": 2,
  "indentRainbow.colors": [
    "rgba(255,255,64,0.07)",
    "rgba(127,255,127,0.07)",
    "rgba(255,127,255,0.07)",
    "rgba(79,236,236,0.07)"
  ],
  "window.zoomLevel": 1,
  "search.searchOnType": true,
}

```

### Extensions

Save the following list of extensions into a file e.g. `vscode-extensions`.

Tip: you can see a list like this by running `code --list-extensions | xargs -L 1 echo code --install-extension` command in the terminal.

```txt
fosshaas.fontsize-shortcuts
74th.monokai-charcoal-high-contrast
ardenivanov.svelte-intellisense
bashmish.es6-string-css
benjaminbenais.copilot-theme
bierner.markdown-mermaid
blzjns.vscode-raml
bpruitt-goddard.mermaid-markdown-syntax-highlighting
chakrounanas.turbo-console-log
christian-kohler.npm-intellisense
cssho.vscode-svgviewer
davidanson.vscode-markdownlint
dbaeumer.vscode-eslint
eamodio.gitlens
editorconfig.editorconfig
enkia.tokyo-night
erd0s.terraform-autocomplete
esbenp.prettier-vscode
firsttris.vscode-jest-runner
fivethree.vscode-svelte-snippets
github.copilot
github.copilot-chat
github.github-vscode-theme
github.vscode-github-actions
github.vscode-pull-request-github
graphql.vscode-graphql
graphql.vscode-graphql-execution
graphql.vscode-graphql-syntax
gruntfuggly.todo-tree
hashicorp.terraform
johnpapa.vscode-peacock
kumar-harsh.graphql-for-vscode
leodevbro.blockman
mattpocock.ts-error-translator
mhutchie.git-graph
mikestead.dotenv
ms-azuretools.vscode-docker
ms-playwright.playwright
ms-vsliveshare.vsliveshare
nrwl.angular-console
oderwat.indent-rainbow
pkief.material-icon-theme
pmndrs.pmndrs
prisma.prisma
ryanolsonx.zenburn
shd101wyy.markdown-preview-enhanced
sleistner.vscode-fileutils
streetsidesoftware.code-spell-checker
styled-components.vscode-styled-components
stylelint.vscode-stylelint
svelte.svelte-vscode
syler.sass-indented
takumii.markdowntable
teabyii.ayu
techer.open-in-browser
tobermory.es6-string-html
unifiedjs.vscode-mdx
usernamehw.errorlens
visualstudioexptteam.intellicode-api-usage-examples
visualstudioexptteam.vscodeintellicode
vitest.explorer
vivaxy.vscode-conventional-commits
wooodhead.vscode-wrap-console-log-simple
```

Then run the following command to install them:

```bash
cat vscode-extensions | xargs -L1 code --install-extension
```
