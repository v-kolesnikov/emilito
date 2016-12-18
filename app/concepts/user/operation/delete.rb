class User
  class Delete < Emilito::Operation::Delete
    def model!(options, params:, **)
      options['model'] = User.find_by(params.slice(:id))
    end
  end
end
