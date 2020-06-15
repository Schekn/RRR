class TodosController < ApplicationController
    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = "Todo was creaed succesfully"
            redirect_to todo_path(@todo)
        else
           render 'new'
        end
    end
    
    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "Succesfull update"
            redirect_to todo_path(@todo)
        else
            flash[:notice] = "It was a problem with the update"
            render 'edit'
        end
    end

    private 
    def todo_params
        params.require(:todo).permit(:name, :description)
    end
end