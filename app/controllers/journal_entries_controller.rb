class JournalEntriesController < ApplicationController
    def index
        @journal_entries = JournalEntry.all
    end
end
