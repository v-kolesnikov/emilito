module Api
  module V3
    class TicketsController < Api::V3::ApplicationController
      def index
        endpoint Ticket::Index
      end

      def show
        endpoint Ticket::Show
      end

      def create
        endpoint Ticket::Create
      end

      def update
        endpoint Ticket::Update
      end

      def destroy
        endpoint Ticket::Delete
      end
    end
  end
end
