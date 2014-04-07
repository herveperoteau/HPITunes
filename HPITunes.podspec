Pod::Spec.new do |s|
  s.name     = 'HPITunes'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'API ITunes'
  s.author   = { 'Herve Peroteau' => 'herve.peroteau@gmail.com' }
  s.description = 'ITunes API'
  s.platform = :ios
  s.source = { :git => "https://github.com/herveperoteau/HPITunes.git"}
  s.source_files = 'HPITunes'
  s.requires_arc = true
  s.dependency 'iTunesSearch'
end
