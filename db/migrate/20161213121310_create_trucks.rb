class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.integer :id,    null: false                          #ID
      t.string  :maker, null: false                          #メーカー名
      t.string  :category, null: false                       #車種 （トラクターヘッド、トラックなど）
      t.integer :number_tire, null: false                    #タイヤ本数（車型）
      t.string  :engine_type, null: false                    #エンジンタイプ（ディーゼル/CNG）   
      t.integer :number_company                              #登録番号
      t.integer :number_vehicle, null: false                 #車両番号
      t.string  :model_name, null: false                     #モデル名
      t.boolean :administrator, null: false, default: false  #管理者フラグ
      t.timestamps
    end
  end
end
