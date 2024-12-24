class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.31"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_darwin_arm64.tar.gz"
        sha256 "b53144f999ca4cf3961a0cca38a5f53f53218bcac0aa531993f60234fac90a4b"
      else
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_darwin_amd64.tar.gz"
        sha256 "2ef3196028651b284ece0f5477b6d4b5b5aa5861e913973eaf06ef7617a2ceb9"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.31/snake-game_1.0.31_linux_arm64.tar.gz"
        sha256 "bbe58c49b7896194ac93e7fb60f75b9d787f447ffd5eca90f0848a42d9133b7a"
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
  