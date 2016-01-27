RSpec.describe 'makersinit' do
  before do
    allow(Kernel).to receive(:system).with('git init')
  end

  it 'initializes a git repo' do
    # execute `makersinit`
    load './exe/makersinit'
  end

  it 'creates a pre-push file' do
    load './exe/makersinit'
    expect(File).to exist(".git/hooks/pre-push")
  end

  after do
    if File.exist?('.git/hooks/pre-push')
      File.delete(".git/hooks/pre-push")
    end
  end
end