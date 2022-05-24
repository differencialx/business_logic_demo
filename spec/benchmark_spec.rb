require 'benchmark'

iteration_count = 10000

@count = 1

def create_params
  params = {
    name: "Name #{@count}",
    character_type: ['warrior', 'archer', 'mage'].sample
  }
end

Benchmark.bmbm do |x|
  x.report('ActiveInteraction') { iteration_count.times { ActiveInteractions::Characters::Create.run(create_params) } }
  x.report('Trailblazer') { iteration_count.times { TrailblazerOperations::Characters::Create.call(params: create_params) } }
  x.report('Interactor') { iteration_count.times { Interactors::Characters::Create.call(create_params) } }
  x.report('RegularService') { iteration_count.times { Services::Characters::Create.call(params: create_params) } }
  x.report('Decouplio') { iteration_count.times { DecouplioActions::Characters::Create.call(params: create_params) } }
end
