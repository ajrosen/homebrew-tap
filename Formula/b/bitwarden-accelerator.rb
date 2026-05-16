# rubocop: disable Naming/FileName
# frozen_string_literal: true

# Bitwarden Accelerator
class BitwardenAccelerator < Formula
  homepage 'https://github.com/ajrosen/Bitwarden-Accelerator'
  desc 'Alfred Workflow to make using Bitwarden faster and smoother with all applications'

  version '8.1.0'

  url "#{homepage}/releases/download/bwa-#{version}/Bitwarden.Accelerator.alfredworkflow"
  sha256 '07f69b620dd55e3fe124a34cad4035a766d0ea5e76d0decdbd06ff74168b53a9'

  depends_on 'bitwarden-cli'
  uses_from_macos 'jq', since: :sequoia

  def install
    system 'open', cached_download

    # Create something so brew doesn't see an empty installation
    rm_rf bin if bin.exist?
    mkdir_p bin
  end
end

# rubocop: enable Naming/FileName
