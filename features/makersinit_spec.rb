RSpec.describe 'makersinit' do
  before do
    allow(Kernel).to receive(:system).with('git init')
    allow(Kernel).to receive(:system).with("chmod +x #{git_hooks_path}/pre-push")
  end

  it 'initializes a git repo' do
    expect(Kernel).to receive(:system).with('git init')
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

  it 'makes the script executable' do
    expect(Kernel).to receive(:system).with("chmod +x #{git_hooks_path}/pre-push")
    load './exe/makersinit'
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