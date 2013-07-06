require 'spec_helper'

describe 'postgres', :type => 'class' do
  it do
    should contain_class 'postgres::install'
    should contain_class 'postgres::configure'
    should contain_class 'postgres::service'
  end
end

