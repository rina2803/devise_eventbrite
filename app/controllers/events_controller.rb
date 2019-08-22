class EventsController < ApplicationController
  def index
      @user = current_user
      @events = Event.all
  end

  def new
     @user = current_user
@event = Event.new
    
    

  end
def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else redirect_to event_path(@event)
         flash[:error] = 'YOUR EVENT IS NOT UPDATED. Please try again and make sure to update all the field.'
    end
  end

   def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(current_user)
  end

  def create
   @user = current_user

      @event = Event.create('title' => params[:title],
                   'location' => params[:location],
                   'description' => params[:description],
                   'start_date' => params[:start_date],
                   'price' => params[:price],
                   'duration' => params[:duration])

    @event.admin_id = current_user.id
    if @event.save
      flash[:succes]= "Votre evenement a bien été envoyé sur la toile"
      redirect_to event_path(@event.id)
    else
       flash[:warning] = "Pour bitcher il faut écrire quelque chose sinon quel intérêt ?"
       render 'new'
     end
  end

  def show
    
   @user = current_user
   @event = Event.find(params[:id])
   @end_time = self.end_time(@event.start_date, @event.duration)
end
  def end_time(start_date = 0, duration = 0)
     @end_time = start_date + duration*60
     return @end_time
  end




def subscribe
    @event = Event.find(params[:event_id])

    @amount = @event.price
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur'
    )

    @event.attendees << current_user
    redirect_to @event
    flash[:success] = 'You are now attending this event'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @event
  end
   def event_params
    params.require(:event).permit(:description, :date, :place, :price)
  end

  end
