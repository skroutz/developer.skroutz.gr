module ResponseMateHelper
  FILTERED_PARAMS = [:oauth_token]

  def render_recording(recording_key, options = {})
    recording = ResponseMate::Tape.load(recording_key)

    if !options[:only]
      options[:only] = [:request, :description, :status, :body]
    end

    result = '<div class="example">'
    result << format_request(recording) if options[:only].include?(:request)
    result << add_toggler
    result << format_description(recording) if options[:only].include?(:description)
    result << format_response(recording, options)
    result << '</div>'

    result
  end

  private

  def format_request(recording)
    <<-OUT
    <p class="request">
      <span class="verb">#{recording[:request][:verb]}</span>
      <span class="path">#{recording[:request][:url]}</span>
    </p>
    OUT
  end

  def add_toggler
    '<a href="javascript:void(0)" class="toggler" data-target="js-response">' \
      'view response' \
    '</a>'
  end

  def format_description(recording)
    return '' if !recording[:meta] || !recording[:meta][:description]

    description = recording[:meta][:description]

    %(<div class="request-description"> Description: #{description}</div>)
  end

  def format_response(recording, options)
    out = '<div class="response">'

    #status = format_status(recording) if options[:only].include?(:status)
    #body = format_body(recording)   if options[:only].include?(:body)

    out << format_status(recording) if options[:only].include?(:status)
    out << format_body(recording)   if options[:only].include?(:body)
    out << '</div>'
  end

  def format_status(recording)
    %(<pre class="headers"><code>Status: #{recording[:response][:status]}</code></pre>\n)
  end

  def format_body(recording)
    body = recording[:response].fetch(:body, '')

    begin
      content = JSON.pretty_generate(JSON.parse(body))
    rescue JSON::ParserError
      content = body
    end

    Middleman::Syntax::Highlighter.highlight(content, 'javascript')
  end
end
