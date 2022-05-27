require 'benchmark'

@iteration_count = 10000

@count = 1

def create_params
  params = {
    name: "Name #{@count}",
    character_type: 'warrior'
  }
  @count += 1
  params
end

def active_interaction
  @iteration_count.times { ActiveInteractions::Characters::Create.run(create_params) }
  Character.delete_all
end

def trailblezer
  @iteration_count.times { TrailblazerOperations::Characters::Create.call(params: create_params) }
  Character.delete_all
end

def interactor
  @iteration_count.times { Interactors::Characters::Create.call(create_params) }
  Character.delete_all
end

def regular_service
  @iteration_count.times { Services::Characters::Create.call(params: create_params) }
  Character.delete_all
end

def decouplio
  @iteration_count.times { DecouplioActions::Characters::Create.call(params: create_params) }
  Character.delete_all
end

Character.delete_all
CharacterSkill.delete_all

Benchmark.bmbm do |x|
  x.report('RegularService') { regular_service }
  x.report('Decouplio') { decouplio }
  x.report('ActiveInteraction') { active_interaction }
  x.report('Trailblazer') { trailblezer }
  x.report('Interactor') { interactor }
end

Benchmark.bmbm do |x|
  x.report('Interactor') { interactor }
  x.report('Trailblazer') { trailblezer }
  x.report('ActiveInteraction') { active_interaction }
  x.report('Decouplio') { decouplio }
  x.report('RegularService') { regular_service }
end
