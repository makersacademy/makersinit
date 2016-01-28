require "makersinit/version"

module Makersinit
  def self.initialize_pre_push_script
    File.open(script_path) do |f|
      f.read
    end

    IO.copy_stream(script_path, '.git/hooks/pre-push')
  end

  private

  def self.script_path
    File.join(File.dirname(File.expand_path(__FILE__)), '../scripts/pre-push')
  end
end
