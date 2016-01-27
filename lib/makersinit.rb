require "makersinit/version"

module Makersinit
  def self.initialize_pre_push_script
    File.open('./lib/scripts/pre-push') do |f|
      f.read
    end

    IO.copy_stream('./lib/scripts/pre-push', '.git/hooks/pre-push')
  end
end
