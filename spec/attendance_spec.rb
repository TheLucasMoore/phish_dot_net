require 'spec_helper'

RSpec.describe Attendance do
  let(:response) { JSON.parse('{"profile":"http://phish.net/user/phan1983","uid":"555","username":"phan1983"}') }
  subject { described_class.new(response) }

  describe '#profile' do
    it 'returns the user profile url' do
      expect(subject.profile).to eq 'http://phish.net/user/phan1983'
    end
  end

  describe '#user_id' do
    it 'returns the user id' do
      expect(subject.user_id).to eq '555'
    end
  end

  describe '#username' do
    it 'returns the user name' do
      expect(subject.username).to eq 'phan1983'
    end
  end

  describe '.all', :vcr do
    context 'without any parameters' do
      subject { described_class.all }

      it 'returns the correct number of attendances' do
        expect(subject.count).to eq 6
      end

      it 'returns an array of attendances' do
        subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end

    context 'with show id parameters' do
      subject { described_class.all(show_id: 1) }

      it 'returns the correct number of attendances' do
        # expect(subject.count).to eq 1048
      end

      it 'returns an array of attendances' do
        # subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end

    context 'with show date parameters' do
      subject { described_class.all(show_date: 1) }

      it 'returns the correct number of attendances' do
        # expect(subject.count).to eq 1048
      end

      it 'returns an array of attendances' do
        # subject.each { |attendance| expect(attendance).to be_a described_class }
      end
    end
  end
end
