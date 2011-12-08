class MicropostsController < ApplicationController

  def index
    @microposts = Micropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @microposts }
    end
  end


  def show
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @micropost }
    end
  end


  def new
    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @micropost }
    end
  end


  def edit
    @micropost = Micropost.find(params[:id])
  end


  def create
    @micropost = Micropost.new(params[:micropost])

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, :notice => 'Micropost was successfully created.' }
        format.json { render :json => @micropost, :status => :created, :location => @micropost }
      else
        format.html { render :action => "new" }
        format.json { render :json => @micropost.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to @micropost, :notice => 'Micropost was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @micropost.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to microposts_url }
      format.json { head :ok }
    end
  end
end
