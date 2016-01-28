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
    expect(File).to exist("#{git_hooks_path}/pre-push")
  end

  it 'removes the pre-push.sample file' do
    load './exe/makersinit'
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