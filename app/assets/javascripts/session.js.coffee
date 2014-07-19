# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#


SignupFormValidator = () ->
  @notices = []
  Notice = (error_msg, dom) ->
    error_msg = error_msg
    dom  = dom
  @show_notices = () ->
    notices.forEach (notice) ->
      console.log(notice.dom)
      console.log notice.error_msg
  @validate_signup_form = () ->
    event.stopPropagation()
    user_login_dom = $("#user_login")
    user_password_dom = $("#user_password")
    password_confirmation_dom = $("#password_confirmation")
    if user_login_dom.val().trim() == ""
      notices.push(new Notice("登陆名不能空", user_login_dom))
    return false

$ ->
  $('.sign_form form').on 'submit', SignupFormValidator.validate_signup_form
