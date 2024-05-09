class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する
    # ＠付きはインスタンス変数
    @list = List.new
  end

  def create
    # （1）（2）データを受け取り新規登録するためのインスタンス作成
    # list = List.new(list_params)
    # (3)データをデータベースに保存するためのsaveメゾット実行
    # list.save
    # （4）トップ画面へリダイレクト→詳細画面へリダイレクト
    # redirect_to list_path(list.id)

    # (1)データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    #（2）データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # （3）フラッシュメッセージを定義、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    # すべてのデータを参照する
    # @listsはインスタンス変数→複数のListレコードを取得するためlists
    # List.allはListモデルのデータベースのすべてのレコード
    @lists = List.all
  end

  def show
    # 詳細ページはデータを一つだけ取り出すため、インスタンス変数名は単数のlist
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    # ここの変数がインスタンス変数ではなくローカル変数なのは、updateアクション以外では参照されず、ビューファイルの参照が不要であるため
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    # データを一件取得
    list = List.find(params[:id])
    # データの削除
    list.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to '/lists'
  end


  private
  # ストロングパラメータ
  def list_params
    # permitは値を受け取る許可
    params.require(:list).permit(:title, :body, :image)
  end

end
