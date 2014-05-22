require 'recursive-open-struct'



module MIX

    class Mixer

        def initialize(data)
            @data = data
            @result = []
            @deeps  = 0
        end

        def mixItBaby(data)
            ###putting an Index to the elements to find the sequence which has been in the json###
            @deeps=@deeps + 1
            ros = RecursiveOpenStruct.new(data,recurse_over_array: true)
            puts ros.inspect
            bind_hash={}
            data.each do |k,v|
                if v.kind_of?(Hash) 
                    mixItBaby(v)
                elsif v.kind_of?(Array)
                      ar = v
                      ar.each do |element|
                          mixItBaby(element)
                      end
                else
                    bind_hash[k] = v
                end
            end
            puts bind_hash.inspect
            et = ErbIT.new( bind_hash)
            template = getTemplate(bind_hash[:id])
            filled = et.render(template)
            puts filled.inspect
            @result.push(filled)
            puts @deeps.inspect
            @deeps = @deeps -1
        end




        
def getResult 
    @result
end



        def getTemplate(id)
           path = File.join(File.dirname(__FILE__),'../templates')
           filename = File.join(path,id)
           template = IO.read(filename)
           template
        end



    end




    class ErbIT < OpenStruct
        def render(template)
            ERB.new(template).result(binding)
        end
    end

end
