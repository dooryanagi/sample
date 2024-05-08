class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する
    # ＠付きはインスタンス変数
    @list = List.new
  end

  def create
    # （1）（2）データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # (3)データをデータベースに保存するためのsaveメゾット実行
    list.save
    # （4）トップ画面へリダイレクト→詳細画面へリダイレクト
    redirect_to list_path(list.id)
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

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end