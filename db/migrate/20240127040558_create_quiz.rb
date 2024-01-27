class CreateQuiz < ActiveRecord::Migration[7.0]
  def change

    create_table :ipv4_quizzes do |t|
      t.string :type, default: 'ipv4'
      t.integer :question_count, default: 25
      t.integer :correct
      t.integer :incorrect
      t.references :user, foreign_key: true
      t.timestamps
    end

  end
end
