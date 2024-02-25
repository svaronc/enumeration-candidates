# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates
pp find(5)
pp experienced?(@candidates[0])
pp qualified_candidates(@candidates)
pp ordered_by_qualifications(@candidates)

