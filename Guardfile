guard :minitest do
  watch(%r{^app/controllers/(.*)\.rb$}) { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r{^test/controllers/(.*)\.rb$}) { |m| "test/controllers/#{m[1]}.rb" }
  watch(%r{^app/models/(.*)\.rb$}) { |m| "test/models/#{m[1]}_test.rb" }
  watch(%r{^test/models/(.*)\.rb$}) { |m| "test/models/#{m[1]}.rb" }
  watch(%r{^app/presenters/(.*)\.rb$}) { |m| "test/presenters/#{m[1]}_test.rb" }
  watch(%r{^test/presenters/(.*)\.rb$}) { |m| "test/presenters/#{m[1]}.rb" }
  watch(%r{^app/queries/(.*)\.rb$}) { |m| "test/queries/#{m[1]}_test.rb" }
  watch(%r{^test/queries/(.*)\.rb$}) { |m| "test/queries/#{m[1]}.rb" }
  watch(%r{^app/services/(.*)\.rb$}) { |m| "test/services/#{m[1]}_test.rb" }
  watch(%r{^test/services/(.*)\.rb$}) { |m| "test/services/#{m[1]}.rb" }
  watch(%r{^lib/tasks/(.*)\.rake$}) { |m| "test/lib/tasks/#{m[1]}_test.rb" }
  watch(%r{^test/lib/tasks/(.*)\.rb$}) { |m| "test/lib/tasks/#{m[1]}.rb" }
  watch(%r{^lib/(.*)\.rb$}) { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/lib/(.*)\.rb$}) { |m| "test/lib/#{m[1]}.rb" }
end
