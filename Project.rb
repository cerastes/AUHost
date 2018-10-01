MainFile = "#{ENV['AWL_LIB_SRC']}/Scripts/Automation.rb"
if File.exist?(MainFile)
  require MainFile
else
  Dir[File.dirname(__FILE__) + "/Vendor/WL/Scripts/**/*.rb"].each { |f| require f }
end

class Project < AbstractProject
  
  def generate()
    project = XcodeProject.new(projectPath: File.join(@rootDirPath, "Attenuator_.xcodeproj"))
    auHost = project.addApp(name: "AUHost", sources: ["Shared", "SampleAUHost"], platform: :osx, deploymentTarget: "10.11", buildSettings: {
      "PRODUCT_BUNDLE_IDENTIFIER" => "ua.com.wavelabs.AUHost"
    })
    addSharedSources(project, auHost)
    
    attenuator = project.addApp(name: "Attenuator", sources: ["Shared", "SampleAUPlugin/Attenuator", "SampleAUPlugin/AttenuatorKit"], platform: :osx, deploymentTarget: "10.11", buildSettings: {
      "PRODUCT_BUNDLE_IDENTIFIER" => "ua.com.wavelabs.Attenuator"
    })
    addSharedSources(project, attenuator)

    project.save()
  end
  
  def addSharedSources(project, target)
    project.useFilters(target: target, filters: [
      "Core/Concurrency/*", "Core/Extensions/*", "Core/Converters/*Numeric*",
      "Core/Sources/AlternativeValue*", "Core/Sources/*Aliases*",
      "Foundation/os/log/*", "Foundation/Sources/*Info*", "Foundation/Testability/*", "Foundation/ObjectiveC/*", "Foundation/Notification/*",
      "Foundation/Sources/Functions*", "Foundation/Extensions/CG*", "Foundation/Extensions/*Insets*", "Foundation/Extensions/Color*",
      "Foundation/Sources/Result*", "Foundation/Sources/Math.swift", "Foundation/Extensions/String*",
      "Types/Sources/MinMax*", "Types/Sources/Random*", "Types/Sources/Operators*",
      "Media/Extensions/*", "Media/Sources/Waveform*", "Media/Sources/Media*", "Media/Sources/*Utility*",
      "Media/Sources/*Type*", "Media/Sources/*Buffer*",
      "AppKit/Media/Media*", "AppKit/Media/VU*", "AppKit/Media/*DisplayLink*", "AppKit/Media/*Error*",
      "AppKit/Extensions/*Toolbar*",
      "Media/DSP/*Value*"
    ])
  end

end