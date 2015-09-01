require "spec_helper"

describe GridFor::GridForHelper do
  describe GridFor::GridForHelper::GridForBuilder do
    let(:object) { Struct.new(:name).new("Name") }

    def builder
      @builder ||= described_class.new(object, ActionView::Base.new)
    end

    describe "#row(options, &block)" do
      it "renders a div with bootstrap row css" do
        expect(builder.row { "Hello" }).to eq(
          "<div class=\"row-fluid\">Hello</div>"
        )
      end
    end

    describe "#col(options = {}, &block)" do
      it "renders a span of the given size with the size option" do
        expect(builder.col(size: 4) { "Hello" }).to eq(
          "<div class=\"span4\">Hello</div>"
        )
      end

      it "renders a div spanning 12 by default" do
        expect(builder.col { "Hello" }).to match(
          %r"class=\"span12\""
        )
      end
    end
  end
end
