class SketchesController < ApplicationController
  protect_from_forgery with: :null_session, only: %i[ create ]
  before_action :set_sketch, only: %i[ show edit update upvote destroy ]
  before_action :authenticate_admin!, except: %i[ index create upvote ]

  # GET /sketches or /sketches.json
  def index
    @lastSketch = Sketch.last
    @sketches = Sketch.all.order(upvotes: :desc)
  end

  # GET /sketches/1 or /sketches/1.json
  def show
  end

  # GET /sketches/new
  def new
    @sketch = Sketch.new
  end

  # GET /sketches/1/edit
  def edit
  end

  # POST /sketches or /sketches.json
  def create
    @sketch = Sketch.new(sketch_params)

    respond_to do |format|
      if @sketch.save
        format.html { redirect_to sketch_url(@sketch), notice: "Sketch was successfully created." }
        format.json { render :show, status: :created, location: @sketch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sketch.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    respond_to do |format|
      if @sketch.update(upvotes: @sketch.upvotes + 1)
        format.html { redirect_to sketch_url(@sketch), notice: "Sketch was successfully updated." }
        format.json { render :show, status: :ok, location: @sketch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sketch.errors, status: :unprocessable_entity }
      end
    end
    @sketch.upvotes = @sketch.upvotes + 1 unless @sketch.nil?
  end

  # PATCH/PUT /sketches/1 or /sketches/1.json
  def update
    respond_to do |format|
      if @sketch.update(sketch_params)
        format.html { redirect_to sketch_url(@sketch), notice: "Sketch was successfully updated." }
        format.json { render :show, status: :ok, location: @sketch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sketch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sketches/1 or /sketches/1.json
  def destroy
    @sketch.destroy

    respond_to do |format|
      format.html { redirect_to sketches_url, notice: "Sketch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sketch
      @sketch = Sketch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sketch_params
      params.require(:sketch).permit(:artist, :upvotes, :image)
    end
end
