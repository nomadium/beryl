# frozen_string_literal: true

require "spec_helper"
require "beryl/bootstrap"

RSpec.describe Transcript do
  subject(:transcript) { described_class }

  describe "show" do
    it "shows an object in stdout" do
      obj = "hello world"
      expect { transcript.show(obj) }.to output(obj.to_s).to_stdout
    end
  end
end
