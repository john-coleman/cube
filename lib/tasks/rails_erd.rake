namespace :rails_erd do

  desc 'Display Rails ERD task usage info'
  task :help do
    # rubocop:disable RailsOutput
    puts 'Usage: rake rails_erd:run[gif svg]'
    puts 'ZSH: Escape the [, ] and whitespace: rake rails_erd\[erd.gif\ erd.svg\]'
    puts 'Supported filetypes: dot gif pdf png ps svg svgz etc. that GraphViz supports'
    puts 'Default: pdf png'
    # rubocop:ensable RailsOutput
  end

  desc "Run Rails ERD"
  task :run, :filetypes do |t, args|
    # require 'rails_erd/diagram/graphviz'
    if args[:filetypes]
      formats = [] << args[:filetypes]
      formats.flatten!
    else
      formats = [ 'pdf', 'png' ]
    end

    formats.each do |format|
      # RailsERD::Diagram::Graphviz.create(filetype: format)
      # Rake::Task[:erd].invoke
      # Rake::Task['erd:generate'].invoke
      # Rake::Task['erd:options'].invoke("filetype=#{format}")
      # Rake::Task['erd:load_models'].invoke
    end
  end
end
