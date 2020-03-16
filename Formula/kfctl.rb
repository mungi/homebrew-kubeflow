class Kfctl < Formula
  desc "Kubeflow CLI tool"
  homepage "https://www.kubeflow.org"
  url "https://github.com/kubeflow/kfctl/releases/download/v1.0.1/kfctl_v1.0.1-0-gf3edb9b_darwin.tar.gz"
  version "1.0.1"
  sha256 "e3bbfbf69dacbeda9474d8e5e87c87b8bc70d6a42d23db0be6c8eecc7514abbd"
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
