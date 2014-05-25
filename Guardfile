# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :tmux, display_message: true
guard :rspec do
  watch(%r{^lib/(.+)\.rb$})  { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('bin/mixit')  { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/spec_helper\.rb})
end
guard :cucumber do
  watch(%r{^features/(.+)\.feature$})  { "bundle exec cucumber" }
end
