# frozen_string_literal: true

class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    can :read, :all                 # allow everyone to read everything
    return unless admin && (admin.has_role?(:superadmin) || admin.has_role?(:admin))

    can :access, :rails_admin       # only allow admin admins to access Rails Admin
    can :read, :dashboard           # allow access to dashboard
    if admin.has_role? :superadmin
      can :manage, :all             # allow superadmins to do anything
    elsif admin.has_role? :admin
      can :manage, [] # allow managers to do anything to products and admins
      # elsif admin.role? :sales
      # can :update, Product, hidden: false  # allow sales to only update visible products
    end
  end
end
