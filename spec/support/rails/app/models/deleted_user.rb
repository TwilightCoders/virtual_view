class DeletedUser < User
  arel_view do
    arel_table.where(arel_table[:deleted_at].not_eq(nil))
  end
end
