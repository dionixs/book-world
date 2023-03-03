# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe StaticPagesController, type: :controller do
#   describe 'GET #home' do
#     it 'returns http success' do
#       get :home
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe 'root path' do
#     it 'routes to home action' do
#       expect(get: '/').to route_to(controller: 'static_pages', action: 'home')
#     end
#   end
#
#   describe 'GET #about' do
#     it 'returns http success' do
#       get :about
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe 'GET #contacts' do
#     it 'returns http success' do
#       get :contacts
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe 'GET #help' do
#     it 'returns http success' do
#       get :help
#       expect(response).to have_http_status(:success)
#     end
#   end
#
#   describe 'GET #terms' do
#     it 'returns http success' do
#       get :terms
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
