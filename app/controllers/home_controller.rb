class HomeController < ApplicationController
    def index
        @buses = Bus.all
    end
    def list
      @bus_owner = current_user
      @buses = @bus_owner.buses
    end
    end