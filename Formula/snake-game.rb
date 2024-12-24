class SnakeGame < Formula
    desc "A fun terminal-based snake game written in Go"
    homepage "https://github.com/rockey5520/snake-game"
    version "1.0.32"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.32/snake-game_1.0.32_darwin_arm64.tar.gz"
        sha256 "860b1582fe095cb402aa236e07b28742b8afc848a2d43f1e60457bbe5c84b115"
      else
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.32/snake-game_1.0.32_darwin_amd64.tar.gz"
        sha256 "6a7a0a9db529dd04a564aab138ff3946da98af9a7d5dc07d600f30f79359688f"
      end
    end
  
    on_linux do
      if Hardware::CPU.arm?
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.32/snake-game_1.0.32_linux_arm64.tar.gz"
        sha256 "37ab10e0a5eab0c562cb31b5305822deed0df76aa926ae07064367d332a5eeb2"
      else
        url "https://raw.githubusercontent.com/rockey5520/snake-game-distributions/main/releases/v1.0.32/snake-game_1.0.32_linux_amd64.tar.gz"
        sha256 "239a25edb2f2c1ac60a3ff52e40c39be1ced9d1d0edbb42304b791ff7b2039b5"
      end
    end
  
    def install
      bin.install "snake-game"
    end
  
    test do
      assert_match "usage", shell_output("#{bin}/snake-game --help")
    end
  end
  