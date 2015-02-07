require 'ostruct'
require 'erb'

module MIX
    class Mixer
        def initialize()
            @result = []
            @deeps  = 0
        end
        #get all variables if the level, binds it and templates it
        #this is important to maintain the order of buildingblock for the input


        def premix(data,templatePath)
            bind_hash={}
            data.each do |k,v|
                if v.kind_of?(Hash) 
                elsif v.kind_of?(Array)
                else
                    bind_hash[k] = v
                end
            end
            et = ErbIT.new( bind_hash)
            template = getTemplate(bind_hash[:id],templatePath)
            filled = et.render(template)
            @result.push(filled)
        end


        def mixItRuby(data,templatePath=nil)
            ###putting an Index to the elements to find the sequence which has been in the json###
            @deeps=@deeps + 1
            premix(data,templatePath)
            bind_hash={}
            data.each do |k,v|
                if v.kind_of?(Hash) 
                    mixItRuby(v)
                elsif v.kind_of?(Array)
                    ar = v
                    ar.each do |element|
                        mixItRuby(element)
                    end
                else
                    #done in premix
                end
            end
            puts @deeps.inspect
            @deeps = @deeps -1
        end


        def writeResult2File(filename)
            File.write(filename,@result)
        end

        def getResult 
            @result
        end



        def getTemplate(id,path = File.dirname(__FILE__))
            path = File.join(path, '../templates')
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
