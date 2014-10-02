class DemoController < ApplicationController

  skip_before_action :authenticate_user!
  layout false
  def index

  end

  def hello
    # render('index')
    @array = [1,2,3,5,6]
    @id = params['id']
    @page_no = params['page']
    @random = params['rand']
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index' )
  end

  def google
    redirect_to("http://www.google.co.in")
  end

end
