class JobApplicationsController < ApplicationController
  # GET /job_applications
  # GET /job_applications.xml
  def index
    @job_applications = JobApplication.find(:all)
  end

  # GET /job_applications/1
  # GET /job_applications/1.xml
  def show
    @job_application = JobApplication.find(params[:id])
  end

  # GET /job_applications/new
  # GET /job_applications/new.xml
  def new
    @job_application = JobApplication.new
    @job_application.address ||= Address.new
  end

  # GET /job_applications/1/edit
  def edit
    @job_application = JobApplication.find(params[:id])
  end

  # POST /job_applications
  # POST /job_applications.xml
  def create
    @job_application = JobApplication.new(params[:job_application])

    respond_to do |format|
      if @job_application.save
        flash[:notice] = 'JobApplication was successfully created.'
        format.html { redirect_to(@job_application) }
        format.xml  { render :xml => @job_application, :status => :created, :location => @job_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_applications/1
  # PUT /job_applications/1.xml
  def update
    params[:job_application][:existing_address_attributes] ||= {}

    @job_application = JobApplication.find(params[:id])
    respond_to do |format|
      if @job_application.update_attributes(params[:job_application])
        flash[:notice] = 'JobApplication was successfully updated.'
        format.html { redirect_to(@job_application) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.xml
  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to(job_applications_url) }
      format.xml  { head :ok }
    end
  end
end
