# frozen_string_literal: true

require 'spec_helper'
require 'invest_tinkoff/v2/quotation'

describe InvestTinkoff::V2::Quotation do
  subject { ::InvestTinkoff::V2::Quotation.create price }

  context '114.25' do
    let(:price) { 114.25 }

    it do
      is_expected.to have_attributes(
        units: '114',
        nano: 250000000
      )
    end
  end

  context '-200.20' do
    let(:price) { -200.20 }

    it do
      is_expected.to have_attributes(
        units: '-200',
        nano: -200000000
      )
    end
  end

  context '0.01' do
    let(:price) { 0.01 }

    it do
      is_expected.to have_attributes(
        units: '0',
        nano: 10000000
      )
    end
  end

  context '-0.01' do
    let(:price) { -0.01 }

    it do
      is_expected.to have_attributes(
        units: '-0',
        nano: -10000000
      )
    end
  end
end
