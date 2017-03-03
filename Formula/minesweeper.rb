class Minesweeper < Formula
  desc "An implementation of minesweeper that runs in the terminal"
  homepage "http://nikhilprasad.com"
  url "https://github.com/globmont/minesweeper/archive/v1.32.tar.gz"
  sha256 "5cbfab5c48b4f4c0bd2455b85c790b5c681c9593a5dc48bab237a1a8514bb2b5" # obtained via brew fetch --force minesweeper.rb

  depends_on :python3

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec
    bin.install "minesweeper"
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test minesweeper`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "minesweeper"
  end
end
