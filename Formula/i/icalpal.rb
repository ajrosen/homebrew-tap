# frozen_string_literal: true

# icalPal
class Icalpal < Formula
  homepage 'https://github.com/ajrosen/icalPal'
  desc 'Command-line tool to query the macOS Calendar and Reminders'

  version '4.0.0'

  url "https://rubygems.org/downloads/icalPal-#{version}.gem"
  sha256 '938ceed353562079e27dca4c7a7bba732ea65523e6954ac79419ea3072e64381'

  depends_on 'ruby'

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
  def install
    ENV['GEM_HOME'] = prefix.to_s
    ENV['GEM_PATH'] = prefix.to_s

    system "#{Formula['ruby'].opt_bin}/gem",
           'install', cached_download,
           '--no-document',
           '--no-wrapper',
           '--no-user-install',
           '--install-dir', prefix,
           '--bindir', bin

    raise "gem install 'icalPal' failed with status #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

    FileUtils.rm_rf bin if bin.exist?
    FileUtils.mkdir_p bin

    brew_gem_prefix = prefix + "gems/icalPal-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/icalPal-#{version}.gemspec")
    ruby_libs = Dir.glob("#{prefix}/gems/*/lib")

    gemspec.executables.each do |exe|
      file = Pathname.new("#{brew_gem_prefix}/#{gemspec.bindir}/#{exe}")
      (bin + file.basename).open('w') do |f|
        # rubocop: disable Layout/HeredocIndentation
        f << <<~RUBY
#!#{Formula['ruby'].opt_bin}/ruby --disable-gems

ENV['GEM_HOME']="#{prefix}"
ENV['GEM_PATH']="#{prefix}"

require 'rubygems'

$LOAD_PATH.unshift(#{ruby_libs.map(&:inspect).join(',')})

load "#{file}"
        RUBY
        # rubocop: enable Layout/HeredocIndentation
      end
    end
  end

  # rubocop: enable Metrics/MethodLength, Metrics/AbcSize
end
