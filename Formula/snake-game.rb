class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.31"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.31/snake-game_1.0.31_darwin_arm64.tar.gz"
        sha256 "83e6384e7cafe45f5bf707a483c400a0b7552303b6cf91f55dd2c37b24b4f3df"
      else
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.31/snake-game_1.0.31_darwin_amd64.tar.gz"
        sha256 "83e6384e7cafe45f5bf707a483c400a0b7552303b6cf91f55dd2c37b24b4f3df"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.31/snake-game_1.0.31_linux_arm64.tar.gz"
        sha256 "83e6384e7cafe45f5bf707a483c400a0b7552303b6cf91f55dd2c37b24b4f3df"
      else
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.31/snake-game_1.0.31_linux_amd64.tar.gz"
        sha256 "83e6384e7cafe45f5bf707a483c400a0b7552303b6cf91f55dd2c37b24b4f3df"
      end
    end
  
    def install
      bin.install "snake-game"
    end
  
    test do
      assert_match "usage", shell_output("#{bin}/snake-game --help")
    end
  end
  