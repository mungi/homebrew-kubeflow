class Kfctl < Formula
  desc "Kubeflow CLI tool"
  homepage "https://www.kubeflow.org"
  url "https://github.com/kubeflow/kfctl/releases/download/v1.0.1/kfctl_v1.0.1-0-gf3edb9b_darwin.tar.gz"
  version "1.0.1"
  sha256 "330ed76a622623cd95cfb33f3319e545fc1f96679b1c8ab72ad94c264d3a2d67"
  head "https://github.com/kubeflow/kubeflow.git"

  bottle :unneeded

  depends_on "kubernetes-cli"

  def install
    bin.install "kfctl"
  end

  test do
    ohai "Verify that `kfctl version` contains \"kfctl v#{version}\" ..."
    assert_match "kfctl v#{version}", shell_output("#{bin}/kfctl version 2>&1")

    ohai "Verify that `kfctl --help` contains \"Available Commands\" ..."
    assert_match "Available Commands", shell_output("#{bin}/kfctl --help 2>&1")
  end
end
