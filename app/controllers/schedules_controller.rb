class SchedulesController < ApplicationController
def home
 @tasks = Task.all
end
def index
 @tasks=Task.all
end

# 詳細
def show
    @task = Task.find(params[:id])
end


# 新規
def new
    @task = Task.new
end

def create
      @task = Task.new(schedule_params)
  if @task.save
    redirect_to root_path, notice: "スケジュールを登録しました"
  else
    flash.now[:alert] = "登録に失敗しました"
    render :new, status: :unprocessable_entity
  end
end



# 編集
def edit
  @task = Task.find(params[:id])
end

# 削除
def destroy
  @task = Task.find(params[:id]) # 削除したいデータを見つける
  @task.destroy                 # データを削除する
  redirect_to root_path, notice: "スケジュールを削除しました", status: :see_other
end


# 更新
def update
  @task = Task.find(params[:id])
  if @task.update(schedule_params)
    redirect_to root_path, notice: "スケジュールを更新しました"
  else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_entity
  end
end

private

  def schedule_params
    # :task はモデル名（Task）を小文字にしたもの
    # .permit() の中には、保存したいカラム名（title, content等）をすべて書く
    params.require(:task).permit(:title, :content, :start_date, :end_date, :all_day)
  end
end
