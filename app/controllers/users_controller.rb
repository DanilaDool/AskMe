class UsersController < ApplicationController
  def index
      @users = [
        User.new(
          id: 1,
          name: 'Danila',
          username: 'Dool',
          avatar_url: 'https://shapka-youtube.ru/wp-content/uploads/2021/10/ava-sobaka-v-kapyushone.jpg'
        ),
        User.new(
          id: 2,
          name: 'Kirill',
          username: 'Pineple')
        ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Danila',
      username: 'Dool',
      avatar_url: 'https://shapka-youtube.ru/wp-content/uploads/2021/10/ava-sobaka-v-kapyushone.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2000')),
      Question.new(text: 'Ты дотер?', created_at: Date.parse('27.03.2000'))
    ]

    @new_question = Question.new
  end
end
