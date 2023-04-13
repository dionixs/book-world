# frozen_string_literal: true

module ReadingListsHelper

  # todo
  def reading_list_title(type, user)
    case type
    when 'planned'
      "Запланированные книги пользователя #{user.username}"
    when 'completed'
      "Прочитанные книги пользователя #{user.username}"
    when 'reading'
      "Книги которые читает сейчас пользователь #{user.username}"
    when 'rereading'
      "Книги которые перечитывает пользователь #{user.username}"
    when 'dropped'
      "Брошенные книги пользователя #{user.username}"
    when 'on_hold'
      "Отложенные книги пользователя #{user.username}"
    end
  end
end
