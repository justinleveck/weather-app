require_relative '../../../spec_helper'

describe Web::Views::Weather::Index do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/weather/index.html.erb') }
  let(:view)      { Web::Views::Weather::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
