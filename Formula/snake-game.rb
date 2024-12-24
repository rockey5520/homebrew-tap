class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.23"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.23/snake-game_1.0.23_darwin_arm64.tar.gz"
        sha256 "ce0a2dd9f007b7c60d37345d8206503ce4c94624ae41723ec3b01ab3ec2f0258"
      else
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.23/snake-game_1.0.23_darwin_amd64.tar.gz"
        sha256 "ce0a2dd9f007b7c60d37345d8206503ce4c94624ae41723ec3b01ab3ec2f0258"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.23/snake-game_1.0.23_linux_arm64.tar.gz"
        sha256 "ce0a2dd9f007b7c60d37345d8206503ce4c94624ae41723ec3b01ab3ec2f0258"
      else
        url "https://github.com/rockey5520/snake-game-distributions/blob/main/releases/v1.0.23/snake-game_1.0.23_linux_amd64.tar.gz"
        sha256 "ce0a2dd9f007b7c60d37345d8206503ce4c94624ae41723ec3b01ab3ec2f0258"
      end
    end
  
    def install
      bin.install "snake-game"
    end
  
    test do
      assert_match "usage", shell_output("#{bin}/snake-game --help")
    end
  end
  