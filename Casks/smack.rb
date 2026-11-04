cask "smack" do
  version "1.0.0"
  sha256 "abf48f9082b95d1c734e216a1e6d19d8308ad0f99f74d197339f19f89f0ebbad"

  url "https://github.com/alvagante/smack/releases/download/v#{version}/Smack-v#{version}-macOS-arm64.zip"
  name "Smack"
  desc "Live system monitor in the notch and menu bar"
  homepage "https://github.com/alvagante/smack"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Smack.app"
  binary "#{appdir}/Smack.app/Contents/Helpers/smack"

  zap trash: [
    "~/Library/Application Support/Smack",
    "~/Library/Preferences/it.lab42.smack.plist",
  ]
end
