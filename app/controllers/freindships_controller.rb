class FreindshipsController < ApplicationController

  def create
    @freindship1 = Freindship.new(status: params[:status1], user_id:  params[:freind], freind_id: current_user.id)
    @freindship2 = Freindship.new(status: params[:status2], user_id:  current_user.id, freind_id: params[:freind])
    if (@freindship1.save & @freindship2.save)
      redirect_to root_path, notice: "Freind Request is Sent !"
    else
      redirect_to root_path , notice: "You Already sent !"
    end
  end

    def update
      @freindship1 = Freindship.find_by(user_id: current_user.id, freind_id: params[:freind])
      @freindship2 = Freindship.find_by(user_id: params[:freind], freind_id: current_user.id)
      @freindship1.status = params[:status1]
      @freindship2.status = params[:status2]
      if (@freindship1.save & @freindship2.save)
        redirect_to current_user
      end
    end

    def destroy 
      @freindship1 = Freindship.find_by(user_id: current_user.id, freind_id: params[:freind])
      @freindship2 = Freindship.find_by(user_id: params[:freind], freind_id: current_user.id)
      @freindship2.destroy
      if  (@freindship1.destroy)
        redirect_to current_user, notice: "Request Deleted !"
      else
        redirect_to current_user, notice: "Unable To Delete Request"
      end
    end
end
