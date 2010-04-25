class String
  def cap
    a = self.dup
    a[0] = a[0..0].upcase
    a
  end
end

defines = <<EOD
- (void)beginFill:(uint)color :(FLNumber)alpha;
- (void)endFill;
- (void)clear;
- (void)drawCircle:(FLNumber)x :(FLNumber)y :(FLNumber)radius;
- (void)drawEllipse:(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height;
- (void)drawRoundRect:(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height :(FLNumber)ellipseWidth :(FLNumber)ellipseHeight;
- (void)lineTo:(FLNumber)x :(FLNumber)y;
- (void)moveTo:(FLNumber)x :(FLNumber)y;
- (void)lineStyle:(FLNumber)thickness :(uint)color :(FLNumber)alpha;
EOD

d = []
defines.each_line do |e|
  d << e.scan(/\((.+?)\)(\w+)/)
end

d.each do |e|
  name = e[0][1].cap
  puts "@interface FLGraphics#{name} : NSObject {"
  e[1..-1].each do |ee|
    puts "\t#{ee[0]} _#{ee[1]};"
  end
  puts "}"
  
  init_def = "- (id)init"
  
  if e.length > 1
    init_def = "- (id)initWith#{e[1..-1].map{|ee| "#{ee[1]}:(#{ee[0]})#{ee[1]}"}.join(' ').cap}" 
    puts "#{init_def};"

    e[1..-1].each do |ee|
      puts "@property (readonly, nonatomic) #{ee[0]} #{ee[1]};"
    end
  end
  puts "@end"
  puts ""
  puts "@implementation FLGraphics#{name}"
  e[1..-1].each do |ee|
    puts "@synthesize #{ee[1]} = _#{ee[1]};"
  end
  puts "#{init_def} {"
	puts "\tif ((self = [super init])) {"
  e[1..-1].each do |ee|
    puts "\t\t_#{ee[1]} = #{ee[1]};"
  end
  puts "\t}"
  puts "\treturn self;"
  puts "}"
  puts "@end"
  puts ""
  puts ""

end

d.each do |e|
  name = "FLGraphics#{e[0][1].cap}"
  init_def = "init"
  if e.length > 1
    init_def = "initWith#{e[1..-1].map{|ee| "#{ee[1]}:#{ee[1]}"}.join(' ').cap}"
  end
  
  puts "- #{e.map{|ee|"(#{ee[0]})#{ee[1]}"}.join(' :')} {"
  puts "\tid cmd = [[[#{name} alloc] #{init_def}] autorelease];"
  puts "\t[commands addObject:cmd];"
  puts "}"
  puts ""

end


