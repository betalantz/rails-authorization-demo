class JournalEntriesController < ApplicationController
    before_action :authenticate
    before_action :get_journal_entry, only: [:edit]
    

    def index
        @journal_entries = JournalEntry.all
    end

    def edit
    
    end

    private

    def get_journal_entry
        @journal_entry = JournalEntry.find(params[:id])
    end
end
