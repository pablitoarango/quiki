# class QuikiBot < SlackRubyBot::Bot
#   module Commands
#     class Base
#       class << self
#         alias _invoke invoke
#
#         def invoke(client, data)
#           _invoke client, data
#         rescue StandardError => e
#           logger.info "#{name.demodulize.upcase}: #{client.owner}, #{e.class}: #{e}"
#           client.say(channel: data.channel, text: e.message, gif: 'error')
#           true
#         end
#       end
#     end
#     # class Unknown < SlackRubyBot::Commands::Base
#     #   match(/^(?<bot>\S*)[\s]*(?<expression>.*)$/)
#     #
#     #   def self.call(client, data, _match)
#     #   end
#     # end
#     #
#     # class About < SlackRubyBot::Commands::Base
#     #   command 'about', 'hi', 'help' do |client, data, match|
#     #   end
#     # end
#   end
# end
