username = ENV['ARTIFACTORY_USERNAME'] || raise("Need an artifactory username")
password = ENV['ARTIFACTORY_PASSWORD'] || raise("Need an artifactory password")

Pod::Spec.new do |s|
    s.name               = "Babbage"
    s.version            = "1.1-pre.129"
    s.summary            = "The Medidata Patient Cloud SDK"
    s.homepage           = "https://github.com/mdsol/babbage"
    s.license            = { type: "Proprietary", text: "TBD" }
    s.author             = "Medidata Solutions, Inc."

    s.source             = { http: "https://#{username}:#{password}@etlhydra-artifactory-sandbox.imedidata.net/artifactory/p-cloud-snapshots/com/mdsol/babbage/ios/1.1-pre.129/babbage-1.1-pre.129.zip" }
    s.source_files       = "artifacts/include/babbage/*.h"
    s.vendored_libraries = "artifacts/libBabbage.a"

    s.library            = "c++"
    s.platform           = :ios
    s.requires_arc       = true
    s.ios.deployment_target = '7.0'

    s.dependency         'AFNetworking', '2.5.3'
    s.dependency         'HTMLReader', '~> 0.7.1'
    s.dependency         'UICKeyChainStore', '2.0.6' # 2.0.7 does not build with XCode 6.4
    s.dependency         'OpenSSL-Universal', '~> 1.0.1j'
end