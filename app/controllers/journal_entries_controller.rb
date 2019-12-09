class JournalEntriesController < ApplicationController
    before_action :authenticate


    def index
        @journal_entries = JournalEntry.all
    end
end
