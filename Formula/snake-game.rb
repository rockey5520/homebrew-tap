class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.31"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_darwin_arm64.tar.gz"
        sha256 "dd24ffd9d5db94ce2e73fe6a68cb70b40c32a5d73d844eeae5f8508e034669f3"
      else
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_darwin_amd64.tar.gz"
        sha256 "dd24ffd9d5db94ce2e73fe6a68cb70b40c32a5d73d844eeae5f8508e034669f3"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_linux_arm64.tar.gz"
        sha256 "dd24ffd9d5db94ce2e73fe6a68cb70b40c32a5d73d844eeae5f8508e034669f3"
      else
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_linux_amd64.tar.gz"
        sha256 "dd24ffd9d5db94ce2e73fe6a68cb70b40c32a5d73d844eeae5f8508e034669f3"
      end
    end
  
    def install
      bin.install "snake-game"
    end
  
    test do
      assert_match "usage", shell_output("#{bin}/snake-game --help")
    end
  end
  