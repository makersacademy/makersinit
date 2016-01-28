require 'spec_helper'

describe Makersinit do
  subject(:makersinit) { described_class }

  it 'has a version number' do
    expect(Makersinit::VERSION).not_to be nil
  end

  describe '#initialize_pre_push_script' do
    it 'creates a pre-push file' do
      makersinit.initialize_pre_push_script
      expect(File).to exist("#{git_hooks_path}/pre-push")
    end

    it 'removes the pre-push.sample file' do
      makersinit.initialize_pre_push_script
      expect(File).not_to exist("#{git_hooks_path}/pre-push.sample")
    end

    after do
      if File.exist?("#{git_hooks_path}/pre-push")
        File.delete("#{git_hooks_path}/pre-push")
      end

      if !File.exist?("#{git_hooks_path}/pre-push.sample")
        File.open("#{git_hooks_path}/pre-push.sample", "w") do |f|     
          f.write("#This is a sample pre-push hook.")   
        end
      end
    end

    private

    def git_hooks_path
      '.git/hooks'
    end
  end
end
