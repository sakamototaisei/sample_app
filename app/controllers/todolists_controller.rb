class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end
  
  def create
    # 1. データを新規登録するためにインスタンス作成
  　list = List.new(list_params)
  　# 2. データをデータベースに保存するためのsaveメソッド実行
  　list.save
  　# 3. トップ画像へリダイレクト
  　redirect_to '/tpo'
  end
  
  def index
    @lists = List.all
  end
  
  
  
  
  
  
  
  private
  #　ストロングパラメーター
  def list_params
    params.require(:list).permit(:title, :body)
  end
end