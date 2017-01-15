require 'spec_helper'
require 'rails_helper'

describe Job do
  it 'requires that the truth is out there' do
    assert true == true
  end

  it 'saves the job' do
    job = Job.new(title: 'one', company: 'iml', pay: '20000', description: 'job description')
    job.save
    expect(Job.count).to eq(1)
  end
end
