module Api
  module V1
    class UrlapisController < ApplicationController
      before_action :set_url, only: [:show, :destroy]

      def index
        urls = Url.all
        render json: {status: "Success", message: "Shortened URLs", data: urls}, status: :ok
      end

      def show
        render json: {status: "Success", message: "Shortened URL", data: @url}, status: :ok
      end

      def find_by_short_link
        url = find_by_link(params[:short_link])
        render json: {status: "Success", message: "Original URL", data: url}, status: :ok
      end

      def create
        min_link = sanitize(params[:urlapi][:given_link])
        params[:urlapi][:min_link] = min_link
        existing_url = Url.where(:min_link => min_link).first
          if !existing_url.nil?
            params[:urlapi][:short_link] = existing_url.short_link
            params[:urlapi][:slug] = existing_url.slug
          end
        url = Url.new(url_params)

        if url.save
          render json: {status: "Success", message: "Creaded short URL", data: url}, status: :ok
        else
          render json: url.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @url.destroy
        render json: {status: "Success", message: "Deleted URL", data: @url}, status: :ok
      end


      private

        def set_url
          @url = Url.find(params[:id])
        end

        def find_by_link(short_link)
          return Url.where(:short_link => short_link).first.min_link
        end

        def url_params
          params.require(:urlapi).permit(:given_link, :short_link, :slug, :min_link)
        end

        def sanitize(link)
          sanitized_url = link.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
          sanitized_url.slice!(-1) if sanitized_url[-1] == "/"
          sanitized_url = "http://#{sanitized_url}"
        end

    end
  end
end