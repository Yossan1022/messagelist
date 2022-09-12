class MessagesController < ApplicationController
  #set_messageの部分をまとめる
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    #一覧ページは全てのレコードを取得するからallを使う
    @messages = Message.all
  end

  def show
   
  end

  def new
    @message = Message.new
  end

  def create
    #ストロングパラメータを使いMessage.new(content: '...') となることが担保されます。
    @message = Message.new(message_params)
　　#条件分岐と、@message の保存を同時に行ってる
    if @message.save
      #ユーザにお知らせとしてページ上に表示するためのもの
      #redirect_toの前ならflash
      flash[:success] = 'Message が正常に投稿されました'
      #リンク先を指定して強制的に飛ばすメソッド。リンク先は自動的にmessage のshowルーティング（messages/:id）
      redirect_to @message
    else
      #renderの前は.now
      flash.now[:danger] = 'Message が投稿されませんでした'
      #renderはmessages/new.html.erb を表示する
      render :new
    end
  end

  def edit
    
  end

  def update
    
#ストロングパラメータを使用
    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      #show.html.erb を表示
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      #edit.html.erb を表示
      render :edit
    end
  end

  def destroy
    
    @message.destroy

    flash[:success] = 'Message は正常に削除されました'
    #リダイレクトの場合だけは prefix + _url にすると決まっている。messages なのでindexへリダイレクト
    redirect_to messages_url
  end
  
  #ここから下は私用のメソッド
  private

  def set_message
    #@message = Message.find(params[:id])を共通化
    @message = Message.find(params[:id])
  end
  
  #  def message_paramsがStrong Parameter
  def message_params
    #params.require(:message) でMessageモデルのフォームからのデータに関するものだと明示
    params.require(:message).permit(:content,:title)
    #.permit(:content,:title)でcontentとtitle以外のデータを捨てる
  end
end
