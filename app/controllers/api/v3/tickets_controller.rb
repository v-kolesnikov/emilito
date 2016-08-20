module Api
  module V3
    class TicketsController < Api::V3::ApplicationController
      def index
        respond Ticket::Index
      end

      def show
        respond Ticket::Show
      end

      def create
        respond Ticket::Create, namespace: [:api, :v3, workspace]
      end

      def update
        respond Ticket::Update, namespace: [:api, :v3, workspace]
      end

      def destroy
        respond Ticket::Delete, namespace: [:api, :v3, workspace]
      end

      protected

      def workspace
        @workspace ||= Workspace.find(params[:workspace_id])
      end
    end
  end
end
