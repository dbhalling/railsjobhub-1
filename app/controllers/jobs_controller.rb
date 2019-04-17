class JobsController < ApplicationController
  before_action :trix, only: [:new, :show]
  before_action :nofollow, only: [:new, :create, :edit, :update, :show]

  def index
    @jobs = Job.all.reverse_order
    @valid_job_array = []
    @jobs.each do |x|
      if x.expiration.nil?
      elsif (x.expiration.between?(Time.now, Time.now + 31.days))
          @valid_job_array << x #[x.id, x.title, x.description, x.expiration]
      end
    end
    @valid_array_count_half = @valid_job_array.count / 2
    @valid_array_left = @valid_job_array[0...@valid_array_count_half]
    @valid_array_right = @valid_job_array[@valid_array_count_half..-1]
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      skills = []
      skills_pre = job_params[:skills].split(',')
      skills_pre.each { |x| skills << x.strip }
      @job.update(skills: skills, source: "RailsJobHub",
        date: Time.now.utc, job_id: @job.id)
      session[:job_id] = @job.id
      redirect_to new_job_path
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_job_path
      flash[:danger] = "Oops please enter something."
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
      flash[:success] = "Updated!"
    else
      redirect_to edit_job_path(@job)
      flash[:alert] = "Please provide input!"
    end
  end

  def destroy
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :email, :link,
                                :location, :price, :company, :skills)
  end

  def trix
    @trix = true
  end

  def nofollow
    @nofollow = 1
  end
end
