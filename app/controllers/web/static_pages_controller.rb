module Web
  class StaticPagesController < Web::ApplicationController
    # GET /
    def index
      run User::SignUp
    end

    # GET /personal
    def personal
    end

    # GET /open_source
    def open_source
    end

    # GET /business
    def business
    end

    # GET /explore
    def explore
    end

    # GET /pricing
    def pricing
    end

    # GET /blog
    def blog
    end

    # GET /support
    def support
    end
  end
end
