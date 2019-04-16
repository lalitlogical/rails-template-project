# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :admins, join_table: :admins_roles

  validates :name, presence: true

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
