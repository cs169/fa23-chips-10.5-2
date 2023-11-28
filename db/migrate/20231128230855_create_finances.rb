class CreateFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :finances do |t|
      t.string :relative_uri
      t.string :name
      t.string :party
      t.string :state
      t.string :district
      t.string :committee
      t.string :status
      t.float :total_from_individuals
      t.float :total_from_pacs
      t.float :total_contributions
      t.float :candidate_loans
      t.float :total_disbursements
      t.float :begin_cash
      t.float :end_cash
      t.float :total_refunds
      t.float :debts_owed
      t.string :date_coverage_from
      t.string :date_coverage_to
      t.timestamps
    end
  end
end
