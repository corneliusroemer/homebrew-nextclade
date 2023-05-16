cask "nextclade" do
  version "2.14.0"

  if OS.linux? && on_intel
    url "https://github.com/nextstrain/nextclade/releases/download/#{version}/nextclade-x86_64-unknown-linux-gnu"
    sha256 "1a9a82655830243ffd01937ebb895744ff46ec49f725ef6feff9a3f0e37d90d1"
  elsif OS.mac? && on_intel
    url "https://github.com/nextstrain/nextclade/releases/download/#{version}/nextclade-x86_64-apple-darwin"
    sha256 "432f56d2152edda49b8c4a2c3f81d9a5da7419a6cc7c4a3d5205d17d5f834cf6"
  elsif OS.mac? && on_arm
    url "https://github.com/nextstrain/nextclade/releases/download/#{version}/nextclade-aarch64-apple-darwin"
    sha256 "aaac669618d953381428eac3674fe6cb22bef66e7c1ae55552f6a1567f3d3030"
  end

  name "Nextclade"
  desc "Viral genome alignment, mutation calling, clade assignment, QC and phylogenetic placement"
  homepage "https://github.com/nextstrain/nextclade"

  # We don't have an 'app' stanza for this Cask because it seems to be a command-line tool
  # Based on the Bioconda recipe, the binary name is 'nextclade', which will be linked by Homebrew
  # If this is not correct, you may need to use 'binary', 'manpage', 'pkg', etc.

  test do
    system "#{bin}/nextclade", "--help"
  end
end
