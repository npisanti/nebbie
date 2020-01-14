
require "strict"


local glitchcut_x = false
local glitchcut_y = false

----------------------------------------------------
function setup()

    frag.load( "evaporate", "evaporate.frag" )
    
    osc.setup_receiver( 4242 )
    
    px.canvas( 480, 640 )
    
    px.begin()
        px.clear( 240, 240, 240, 255 )
    px.finish()

    png.load( "sigil", "frames")
    
end

----------------------------------------------------
function draw()
---[[    
    frag.begin( "evaporate" )
        frag.uniform( "u_background", 0.94, 0.94, 0.94 )
        frag.uniform( "u_feedback", 0.999 )
        frag.uniform( "u_wind", 0.0004 )
        
        if glitchcut_x==true then
            frag.uniform( "u_glitch_x", 0.2 )
            glitchcut_x = false;
        else    
            frag.uniform( "u_glitch_x", 0.0 )
        end
        
        if glitchcut_y==true then
            frag.uniform( "u_glitch_y", 0.06 )
            glitchcut_y = false;
        else    
            frag.uniform( "u_glitch_y", 0.0 )
        end
    frag.finish()
--]]
end

----------------------------------------------------
function osc_received()

    if osc.address()=="/sample" then
        px.begin()    
        px.color(0)    
        png.select( "sigil" )
        png.randjump(3)
        png.draw( px.width()*0.5, px.height()*0.85)  
        px.finish()
    end 
    
    if osc.address() == "/zap" then
        glitchcut_y = true;
    end
    
    if osc.address() == "/noise" then
        glitchcut_x = true;
    end
    
    
end

