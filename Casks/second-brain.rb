cask "second-brain" do
  version "0.5.3"
  sha256 "e0d3b74173b0da5be3a2aaf9f61053a18420fd9fa4e7535e2b4d8092cdb3426b"

  url "https://github.com/heapworks-in/second-brain/releases/download/desktop-v#{version}/Second.Brain_#{version}_aarch64.dmg"
  name "Second Brain"
  desc "Local-first capture, search, planning and meeting recorder"
  homepage "https://github.com/heapworks-in/second-brain"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^desktop[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64
  # The app ships the built server, not a Node runtime, and looks the other three up in
  # /opt/homebrew/bin at runtime -- each of them "off, not broken" when missing, which is how an
  # install without llama.cpp came to show "No summary yet" on every meeting. Declaring them is
  # what makes that impossible.
  depends_on formula: [
    "node",
    "llama.cpp",
    "whisper-cpp",
    "ffmpeg",
  ]
  depends_on macos: :monterey

  app "Second Brain.app"

  # The build is ad-hoc signed: clear the quarantine flag so Gatekeeper opens it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Second Brain.app"]
  end

  # ~/Library/Application Support/second-brain is the database, the files and the models --
  # everything the app knows. com.second-brain.desktop is the extracted server build.
  zap trash: [
    "~/Library/Application Support/com.second-brain.desktop",
    "~/Library/Application Support/second-brain",
    "~/Library/Caches/com.second-brain.desktop",
    "~/Library/WebKit/com.second-brain.desktop",
  ]

  caveats <<~EOS
    First launch downloads about 6 GB of local models (transcription and summarising) and
    shows the progress. Everything stays on this Mac.

    Recording meetings needs Microphone and Screen Recording permission, and auto-record
    needs Calendar. macOS asks the first time each is used.
  EOS
end
