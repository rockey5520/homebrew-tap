class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.8"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game/releases/download/v1.0.8/snake-game_1.0.8_darwin_arm64.tar.gz"
        sha256 "930d425e7c8236d924421c9f1e2e355230ea2b1b6ac097fdd539ccb53a57eac1"
      else
        url "https://github.com/rockey5520/snake-game/releases/download/v1.0.8/snake-game_1.0.8_darwin_amd64.tar.gz"
        sha256 "c0f3c872e3debbd1ea77eade9bf298477b6265a285aca9064eb3ef2fa62a31fe"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game/releases/download/v1.0.8/snake-game_1.0.8_linux_arm64.tar.gz"
        sha256 "9fdd7811c4a13fd5db949556fe08594bb02e657976f0f19b01894ca53e50114d"
      else
        url "https://github.com/rockey5520/snake-game/releases/download/v1.0.8/snake-game_1.0.8_linux_amd64.tar.gz"
        sha256 "f03d7fae5b55c0fc9058cbd7786740246f804dbbee8e0956518f430ec876a0b6"
      end
    end
  
    def install
      bin.install "snake-game"
    end
  
    test do
      assert_match "usage", shell_output("#{bin}/snake-game --help")
    end
  end
  