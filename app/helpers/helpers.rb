class Helpers
   
    def self.current_user(hash)
        user = User.find_by_id(hash[:user_id])
        if user
            user
        end
    end

    def self.is_logged_in?(hash)
        !!self.current_user(hash)
    end
end