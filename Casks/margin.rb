cask "margin" do
  version "0.2.1"
  sha256 "1b808f5085cc5f313063e5fc0f9054c30c3820a31ff11b288930463441d1112f"

  url "https://github.com/heapworks-in/margin/releases/download/v#{version}/Margin_#{version}_aarch64.dmg"
  name "Margin"
  desc "Private writing coach for technical documents"
  homepage "https://github.com/heapworks-in/margin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Margin.app"

  zap trash: [
    "~/Library/Application Support/app.margin.desktop",
    "~/Library/Caches/app.margin.desktop",
    "~/Library/WebKit/app.margin.desktop",
  ]

  caveats <<~EOS
    Margin is not code-signed yet, so macOS warns on first launch.
    Right-click Margin.app in /Applications and choose Open (once), or run:
      xattr -dr com.apple.quarantine /Applications/Margin.app
    The bundled coach needs Node.js and Claude Code logged in (run `claude`, then /login).
  EOS
end
