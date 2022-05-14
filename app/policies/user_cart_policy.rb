class UserCartPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def new?
      true
    end

    def create?
      record.user_cart.user == user
    end

    # def update?
    #   owner?
    # end

    # def edit?
    #   owner?
    # end

    # def destroy?
    #   owner?
    # end

    private

    def owner?
      record.user == user
    end
  end
end
