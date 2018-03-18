require "spec_helper"

describe VirtualView::ActiveRecord::Base do

  let!(:dale) {
    DeletedUser.create(name: 'Dale', email: 'dale@twilightcoders.net', deleted_at: Time.now)
  }

  let!(:jimmy) {
    User.create(name: 'Jimmy', email: 'jimmy@twilightcoders.net')
  }

  it 'can count' do
    expect(DeletedUser.count).to eq(1)
  end

  it 'can filter and count' do
    expect(DeletedUser.where(name: 'Dale').count).to eq(1)
  end

  it 'can filter' do
    expect(DeletedUser.where(name: 'Jimmy')).to be_empty
    expect(DeletedUser.where(name: 'Dale')).to be
  end

  context 'when delegating' do
    it 'can count' do
      expect(DeletedUser.all.count).to eq(1)
    end

    it 'can filter and count' do
      expect(DeletedUser.all.where(name: 'Dale').count).to eq(1)
      expect(DeletedUser.all.where(name: 'Jimmy').count).to eq(0)
    end

    it 'can filter' do
      expect(DeletedUser.all.where(name: 'Jimmy')).to be_empty
      expect(DeletedUser.all.where(name: 'Dale')).to eq([dale])
    end
  end

end

