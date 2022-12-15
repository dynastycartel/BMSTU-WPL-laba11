Rails.application.routes.draw do
  root 'calc#input', as: "home"
  get 'calc/output'
  get 'calc/db_check_input'
  get 'calc/db_check_output'
  get 'calc/check_data_xml', as: 'xml'
end
