# frozen_string_literal: true

require 'rake'

class Dotfile
  IGNORE = %w[
    Brewfile
    Brewfile.lock.json
    Rakefile
    README.md
    tags
    mac
    setup-env
  ]

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name_with_dot
    ".#{name}"
  end

  def skip?
    IGNORE.include?(name) ||
      File.identical?(name, File.join(ENV['HOME'], name_with_dot))
  end

  def exist?
    File.exist?(name_with_dot)
  end

  def replace
    remove
    link
  end

  def remove
    `rm "$HOME/#{name_with_dot}` # TODO: May need force
  end

  def link
    puts "linking ~/#{name_with_dot}"
    `ln -s "$PWD/#{name}" "$HOME/#{name_with_dot}"`
  end
end

desc 'Create symlinks of dotfiles in $HOME dir'
task :link do
  replace_all = false
  dotfiles = Dir['*'].map { |f| Dotfile.new(f) }
  dotfiles.each do |df|
    next if df.skip?

    if df.exist?
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        df.replace
      when 'y'
        df.replace
      when 'q'
        exit
      else
        puts "skipping ~/#{df.name_with_dot}"
      end
    else
      df.link
    end
  end
end
