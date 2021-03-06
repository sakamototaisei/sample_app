class TodolistsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create
    # 1. データを新規登録するためにインスタンス作成
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    redirect_to todolist_path(list)
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  
  
  private
  #　ストロングパラメーター
  def list_params
    params.require(:list).permit(:title, :body)
  end
end