class ProfileController < ApplicationController
  #routing_navigator :on 
   @@per_page = 50
   
  
  before_filter :audit
  
  def nudge 
    profile = Profile.find( params[:profile])
    respond_to do |wants| 
      wants.js { render :text => "<li>A mail to <b>"+ profile.email+"</b> has been sent.</li>" } 
    end 
  end 
  
  
  def index
    @profiles = Profile.paginate :page => params[:page]
    
    
      if request.xml_http_request?
        puts "Rendering partial"
        render :partial => "profile_list", :layout => false
      end
      
  #  respond_to do |format| 
  #    format.html 
  #    format.xml { render :xml => @profiles.to_xml }
  #    format.json { render :json => @profiles.to_json  }
  # end 
    
    
  end
  
  def get_profile
    @profiles = Profile.paginate :page => params[:page]
    respond_to do |wants| 
      wants.js { render @profiles } 
    end
  end

  
  def test
     profile = Profile.find( params[:profile])
     flash[:notice] = "test " + profile.user_id
     redirect_to :controller => "profile" and return

   end
   
   def withdraw
     puts "withdraw"
      redirect_to :action => "index"
     
   end
  
  def done
    puts "done"
  end
  
  def error
    puts "error"
  end

  private
    def audit 
      puts "Auditings calls"
      return false
    end
  
  
end
