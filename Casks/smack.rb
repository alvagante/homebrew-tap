cask "smack" do
  version "0.5.0"
  sha256 "19e0f1cfcf7a9a36c2c2c52dad6e54983effba705648ae35456cdb912e35a5e4"

  url "https://github.com/alvagante/smack/releases/download/v#{version}/Smack-v#{version}-macOS-arm64.zip"
  name "Smack"
  desc "Live Mac system monitor in the notch and menu bar"
  homepage "https://github.com/alvagante/smack"

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "Smack.app"

  # Remove once releases are signed with a Developer ID and notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Smack.app"]
  end

  zap trash: [
    "~/Library/Application Support/Smack",
    "~/Library/Preferences/it.lab42.smack.plist",
  ]
end
