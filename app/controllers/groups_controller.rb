class GroupsController < ApplicationController
before_action :find_group, only:[:show,:edit, :update,:destroy]
before_action :authenticate_user!, only:[:new,:create, :edit, :update, :destroy]

  def index
    @groups=Group.all



  end

  def new
    @group=Group.new
  end


def create
  @group=Group.new(group_params)
  @group.user=current_user
  if @group.save
    redirect_to groups_path
    flash[:notice]="Create success"
  else
    render :new
  end
end

def show
end

def edit
end

def update
  if @group.update(group_params)
    redirect_to groups_path
    flash[:notice]="Update success"
  else
  render :edit
end
end

def destroy
  @group.destroy
  redirect_to groups_path
  flash[:warning]="delete success"
end

private
def group_params
  params.require(:group).permit(:title, :description)
end

def find_group
    @group = Group.find(params[:id])
  end

end
