require "makersinit/version"

module Makersinit
  GIT_HOOKS_PATH = ".git/hooks"

  def self.initialize_pre_push_script
    copy_script_to_hook
    remove_sample_hook
  end

  private

  def self.script_path
    File.join(File.dirname(File.expand_path(__FILE__)), '../scripts/pre-push')
  end

  def self.copy_script_to_hook
    IO.copy_stream(script_path, target_path)
  end

  def self.remove_sample_hook
    file = target_path + '.sample'
    File.delete(file) if File.exist? file
  end

  def self.target_path
    "#{GIT_HOOKS_PATH}/pre-push"
  end
end
