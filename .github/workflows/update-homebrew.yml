name: Update Homebrew Formula

on:
  repository_dispatch:
    types:
      - update_formula

jobs:
  update-formula:
    runs-on: ubuntu-latest

    steps:
      # Step 1: Checkout Public Repository
      - name: Checkout Public Repository
        uses: actions/checkout@v4

      # Step 2: Fetch Tag and Metadata
      - name: Fetch Trigger Data
        run: |
          echo "Fetching release metadata..."
          echo "version=${{ github.event.client_payload.version }}" >> $GITHUB_ENV
          echo "tag=${{ github.event.client_payload.tag }}" >> $GITHUB_ENV

      # Step 3: Download Release Files
      - name: Download Release Files
        run: |
          mkdir -p dist
          wget -O dist/snake-game_darwin_arm64.tar.gz "https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_darwin_arm64.tar.gz"
          wget -O dist/snake-game_darwin_amd64.tar.gz "https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_darwin_amd64.tar.gz"
          wget -O dist/snake-game_linux_arm64.tar.gz "https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_linux_arm64.tar.gz"
          wget -O dist/snake-game_linux_amd64.tar.gz "https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_linux_amd64.tar.gz"

      # Step 4: Calculate SHA256
      - name: Calculate SHA256
        id: calculate_sha
        run: |
          echo "Calculating SHA256 checksums..."
          SHA_DARWIN_ARM64=$(sha256sum dist/snake-game_darwin_arm64.tar.gz | awk '{print $1}')
          SHA_DARWIN_AMD64=$(sha256sum dist/snake-game_darwin_amd64.tar.gz | awk '{print $1}')
          SHA_LINUX_ARM64=$(sha256sum dist/snake-game_linux_arm64.tar.gz | awk '{print $1}')
          SHA_LINUX_AMD64=$(sha256sum dist/snake-game_linux_amd64.tar.gz | awk '{print $1}')
          echo "sha_darwin_arm64=$SHA_DARWIN_ARM64" >> $GITHUB_ENV
          echo "sha_darwin_amd64=$SHA_DARWIN_AMD64" >> $GITHUB_ENV
          echo "sha_linux_arm64=$SHA_LINUX_ARM64" >> $GITHUB_ENV
          echo "sha_linux_amd64=$SHA_LINUX_AMD64" >> $GITHUB_ENV

      # Step 5: Update Homebrew Formula
      - name: Update Formula
        run: |
          sed -i "s/version \".*\"/version \"${{ env.version }}\"/" Formula/snake-game.rb
          sed -i "s|url .*darwin_arm64.*|url \"https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_darwin_arm64.tar.gz\"|" Formula/snake-game.rb
          sed -i "s/sha256 \".*\"/sha256 \"${{ env.sha_darwin_arm64 }}\"/" Formula/snake-game.rb
          sed -i "s|url .*darwin_amd64.*|url \"https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_darwin_amd64.tar.gz\"|" Formula/snake-game.rb
          sed -i "s/sha256 \".*\"/sha256 \"${{ env.sha_darwin_amd64 }}\"/" Formula/snake-game.rb
          sed -i "s|url .*linux_arm64.*|url \"https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_linux_arm64.tar.gz\"|" Formula/snake-game.rb
          sed -i "s/sha256 \".*\"/sha256 \"${{ env.sha_linux_arm64 }}\"/" Formula/snake-game.rb
          sed -i "s|url .*linux_amd64.*|url \"https://github.com/rockey5520/snake-game/releases/download/${{ env.tag }}/snake-game_${{ env.version }}_linux_amd64.tar.gz\"|" Formula/snake-game.rb
          sed -i "s/sha256 \".*\"/sha256 \"${{ env.sha_linux_amd64 }}\"/" Formula/snake-game.rb

      # Step 6: Commit and Push
      - name: Commit and Push Changes
        run: |
          git config --global user.name "GitHub Actions"
          git config --global user.email "actions@github.com"
          git add Formula/snake-game.rb
          git commit -m "Update formula for version ${{ env.version }}"
          git push
