class BookmarkPolicy < ApplicationPolicy

  class Scope < Scope
      def resolve
        scope
      end
    end
  
  #def update?
    #user.present? && (record.user == user)
  #end

  #def destroy?
    #user.present? && (record.user == user)
  #end
end
