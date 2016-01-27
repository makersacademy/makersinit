require "makersinit/version"

module Makersinit
  def self.initialize_pre_push_script
    File.open('scripts/pre-push') do |f|
      f.read
    end

    IO.copy_stream('scripts/pre-push', '.git/hooks/pre-push')
  end
end
