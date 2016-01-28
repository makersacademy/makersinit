require "makersinit/version"

module Makersinit
  GIT_HOOKS_PATH = ".git/hooks"

  def self.initialize_pre_push_script
    File.open(script_path) do |f|
      f.read
    end
    copy_script_to_hook
    remove_sample_hook
  end

  private

  def self.script_path
    File.join(File.dirname(File.expand_path(__FILE__)), '../scripts/pre-push')
  end

  def self.copy_script_to_hook
    IO.copy_stream(script_path, "#{GIT_HOOKS_PATH}/pre-push")
  end

  def self.remove_sample_hook
    if File.exist?("#{GIT_HOOKS_PATH}/pre-push.sample")
      File.delete("#{GIT_HOOKS_PATH}/pre-push.sample")
    end
  end
end
