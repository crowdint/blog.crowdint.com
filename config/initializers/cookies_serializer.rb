# Be sure to restart your server when you modify this file.
# Change serializer due an issue with ruby-openid
# https://github.com/openid/ruby-openid/issues/75
Rails.application.config.action_dispatch.cookies_serializer = :marshal #:json
