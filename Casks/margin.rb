cask "margin" do
  version "0.1.0"
  sha256 "8ede70dbdc6c0ae66256aa5bc4ddfb49455fe32df8ae77eba2ca03cea4772bfe"

  url "https://github.com/heapworks-in/margin/releases/download/v#{version}/Margin_#{version}_aarch64.dmg"
  name "Margin"
  desc "Private writing coach for technical documents"
  homepage "https://github.com/heapworks-in/margin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Margin.app"

  # The build is not signed yet: clear the quarantine flag so Gatekeeper opens it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Margin.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/app.margin.desktop",
    "~/Library/Caches/app.margin.desktop",
    "~/Library/WebKit/app.margin.desktop",
  ]
end
