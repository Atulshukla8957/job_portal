module Api
  module V1  
    class JobPostController < Api::V1::ApiController
      
      def index
        @job_posts = JobPost.find(params[:id])
        render_success_response({
            job_post: array_serializer.new(@job_posts, serializer: JobPostSerializer)
          })
        end
    
      def show
        begin
          @job_post = JobPost.find(params[:id])
          if @job_post
           render_success_response({
                                      job_post: single_serializer.new(@job_post, serializer: JobPostSerializer)
                                    })
          else
            render_unprocessable_entity(error:  "job_post with id #{params[:id]} not found.")
          end
        rescue => e
          render_unprocessable_entity(error: e.message)
        end
      end

      def update
        begin
          @job_post = job_post.find(params[:id])
            if @job_post.update!(job_post_params)
              render_success_response({
                job_post: single_serializer.new(@job_post, serializer: JobPostSerializer)
              })
            else
               render_unprocessable_entity(error: "Invalid job post information")
            end
        rescue => e
           render_unprocessable_entity(error: e.message)
        end
      end

      private

      def job_post_params
        params.require(:job_post).permit(:title,:description,:job_type,:location,:zipcode,:salary,:salary_type,:start_at,:expire_at,:active,:company_id,:user_id)
      end
    end
  end
end