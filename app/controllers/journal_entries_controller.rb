class JournalEntriesController < ApplicationController
    before_action :authenticate
    before_action :get_journal_entry, only: [:edit, :update]
    

    def index
        @journal_entries = JournalEntry.all
    end

    
    def edit
        authorize(@journal_entry)
    end
    
    def new
        @journal_entry = JournalEntry.new
    end
    
    def create
        journal_entry = current_user.journal_entries.build(journal_entry_params)
        if journal_entry.save
            flash[:success] = "Your entry was successfully created!"
            redirect_to journal_entries_path 
        else
            flash[:error] = "Something went wrong saving your entry!"
            redirect_to new_journal_entry_path
        end
    end
    
    def update
        authorize(@journal_entry)
        @journal_entry.update(journal_entry_params)
        flash[:success] = "Your journal entry was updated!ß"
        redirect_to journal_entries_path
    end

    private

    def get_journal_entry
        @journal_entry = JournalEntry.find(params[:id])
    end

    def journal_entry_params
        params.require(:journal_entry).permit(:title, :content, :user_id)
    end
end
