require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#meta_title' do
    it 'returns custom title when provided' do
      custom_title = 'Custom Page Title'
      expect(helper.meta_title(custom_title)).to eq(custom_title)
    end

    it 'returns default title when no custom title provided' do
      default_title = 'İstanbul Tesisat Hizmetleri | Profesyonel Tesisat Çözümleri'
      expect(helper.meta_title).to eq(default_title)
    end
  end

  describe '#meta_description' do
    it 'returns custom description when provided' do
      custom_desc = 'Custom page description'
      expect(helper.meta_description(custom_desc)).to include(custom_desc)
    end

    it 'returns default description when no custom description provided' do
      expect(helper.meta_description).to include('İstanbul\'da 7/24 profesyonel tesisat')
    end
  end

  describe '#asset_exists?' do
    let(:path) { 'test.jpg' }
    let(:full_path) { Rails.root.join('app', 'assets', 'images', path) }

    before do
      allow(Rails.root).to receive(:join)
        .with('app', 'assets', 'images', path)
        .and_return(full_path)
    end

    it 'returns true when asset exists' do
      allow(full_path).to receive(:exist?).and_return(true)
      expect(helper.asset_exists?(path)).to be true
    end

    it 'returns false when asset does not exist' do
      allow(full_path).to receive(:exist?).and_return(false)
      expect(helper.asset_exists?(path)).to be false
    end
  end
end
