require 'rails_helper'

RSpec.describe ProgrammeItem, "#exists" do
    it "creates a programme item" do
        programme_item = create(:programme_item)
        expect(programme_item.format).to be_truthy
        expect(programme_item.setup_type).to be_truthy
        expect(programme_item).to_not be_published
        expect(programme_item.people).to be_empty
        expect(programme_item.programme_assignments).to be_empty
        expect(programme_item.duration).to be_nil
        expect(programme_item.minimum_people).to be_nil
        expect(programme_item.maximum_people).to be_nil
    end
end
