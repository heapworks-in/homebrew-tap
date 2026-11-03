# heapworks-in/homebrew-tap

Homebrew tap for heapworks apps.

```bash
brew tap heapworks-in/tap
brew trust heapworks-in/tap   # Homebrew asks before loading casks from a tap it does not know
```

## [Second Brain](https://github.com/heapworks-in/second-brain)

Local-first capture, search, planning and a meeting recorder that transcribes and summarises on
your own machine.

```bash
brew install --cask second-brain
```

The cask pulls in `node`, `llama.cpp`, `whisper-cpp` and `ffmpeg` — the app looks all four up at
runtime and treats each as a feature switched off when it is missing, so installing this way is
how they come to be there. First launch downloads about 6 GB of models and shows the progress.

## [Margin](https://github.com/heapworks-in/margin)

A private writing coach for technical documents: a desktop editor where the coach's notes land on
your text.

```bash
brew install --cask margin
```

Margin needs Node.js and Claude Code logged in (`claude`, then `/login`) for the bundled coach.

---

Both builds are Apple Silicon and not signed yet; each cask clears the quarantine flag after
install.
