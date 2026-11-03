# heapworks-in/homebrew-tap

Homebrew tap for [Margin](https://github.com/heapworks-in/margin), a private writing coach for technical documents.

```bash
brew tap heapworks-in/tap
brew install --cask margin
```

Margin needs Node.js and Claude Code logged in (`claude`, then `/login`) for the bundled coach.
The app is not signed yet; the cask clears the quarantine flag after install.
