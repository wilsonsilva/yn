RSpec.describe Yn do
  it 'has a version number' do
    expect(Yn::VERSION).not_to be nil
  end

  describe '.parse' do
    context 'when the input is considered truthy' do
      let(:truthy_cases) do
        [
          'y',
          'Y',
          'yes',
          'YES',
          'Yes',
          'true',
          'TRUE',
          'True',
          true,
          '1',
          1,
          'on'
        ]
      end

      it 'returns true' do
        truthy_cases.each do |truthy_case|
          aggregate_failures do
            expect(described_class.parse(truthy_case)).to eq(true)
            expect(described_class.parse(truthy_case, lenient: true)).to eq(true)
          end
        end
      end
    end

    context 'when the input is considered falsy' do
      let(:falsy_cases) do
        [
          'n',
          'N',
          'no',
          'NO',
          'No',
          'false',
          'FALSE',
          'False',
          false,
          '0',
          0,
          'off'
        ]
      end

      it 'returns false' do
        falsy_cases.each do |falsy_case|
          aggregate_failures do
            expect(described_class.parse(falsy_case)).to eq(false)
            expect(described_class.parse(falsy_case, lenient: true)).to eq(false)
          end
        end
      end
    end

    context 'when the input is considered neither truthy nor falsy' do
      let(:undefined_cases) do
        [
          nil,
          '',
          [],
          {},
          # Numbers: only works on 0 and 1
          '10',
          10,
          '-1',
          -1,
          '0.5',
          0.5,
          '1BadIntParsing',
          '0x000',
          # Strings with a low edit-distance don't work
          'flase',
          'ture',
          'n o',
          'yn',
          # Other
          'unicorn'
        ]
      end

      it 'returns nil' do
        undefined_cases.each do |undefined_case|
          aggregate_failures do
            expect(described_class.parse(undefined_case)).to eq(nil)
            expect(described_class.parse(undefined_case, lenient: true)).to eq(nil)
          end
        end
      end
    end

    it 'returns true when the lenient option iss true and the input is considered truthy' do
      aggregate_failures do
        expect(described_class.parse('ues', lenient: true)).to eq(true)
        expect(described_class.parse('ywa', lenient: true)).to eq(true)
        expect(described_class.parse('tes', lenient: true)).to eq(true)
        expect(described_class.parse('twa', lenient: true)).to eq(true)
        expect(described_class.parse('urd', lenient: true)).to eq(true)
      end
    end

    it 'returns true when the lenient option iss true and the input is considered falsy' do
      aggregate_failures do
        expect(described_class.parse('ni', lenient: true)).to eq(false)
        expect(described_class.parse('bi', lenient: true)).to eq(false)
        expect(described_class.parse('mo', lenient: true)).to eq(false)
      end
    end

    it 'raises an error if the default is not not a boolean or nil' do
      expect { described_class.parse('10', default: 10) }.to raise_error(
        ArgumentError,
        "Expected the 'default' option to be nil or a boolean, got Integer"
      )
    end

    it "returns the default option when the value can't be parsed" do
      aggregate_failures do
        expect(described_class.parse('10', default: true)).to eq(true)
        expect(described_class.parse('10', default: false)).to eq(false)
      end
    end

    it "returns the default option when the value can't be parsed and the lenient option is set" do
      aggregate_failures do
        expect(described_class.parse('10', default: true, lenient: true)).to eq(true)
        expect(described_class.parse('10', default: false, lenient: false)).to eq(false)
      end
    end
  end
end
