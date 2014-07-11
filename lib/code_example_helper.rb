module CodeExampleHelper
  def render_code_from_file(filename)
    content = YAML.load_file(File.expand_path(File.join('./resources',
                                                        'code_examples',
                                                        "#{filename}.yml")))
    code content[:language] do
      content[:code]
    end
  end
end
