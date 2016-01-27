require 'spec_helper'

describe Makersinit do
  subject(:makersinit) { described_class }

  it 'has a version number' do
    expect(Makersinit::VERSION).not_to be nil
  end

  describe '#initialize_pre_push_script' do
    it 'creates a pre-push file' do
      makersinit.initialize_pre_push_script
      expect(File).to exist(".git/hooks/pre-push")
    end

    after do
      if File.exist?('.git/hooks/pre-push')
        File.delete(".git/hooks/pre-push")
      end
    end
  end
end
