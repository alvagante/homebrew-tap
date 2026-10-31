cask "smack" do
  version "0.7.0"
  sha256 "1bd8fadbf19bef9d01871de6e379c1f78677031b002f3442b739ca3e4e8b7c81"

  url "https://github.com/alvagante/smack/releases/download/v#{version}/Smack-v#{version}-macOS-arm64.zip"
  name "Smack"
  desc "Live system monitor in the notch and menu bar"
  homepage "https://github.com/alvagante/smack"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Smack.app"

  # Remove once releases are signed with a Developer ID and notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Smack.app"],
        chdir:          "{{appdir}}",
        writable_paths: ["{{appdir}}/Smack.app"]
  end

  zap trash: [
    "~/Library/Application Support/Smack",
    "~/Library/Preferences/it.lab42.smack.plist",
  ]
end
