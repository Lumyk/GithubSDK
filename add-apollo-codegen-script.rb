require 'xcodeproj'
project = Xcodeproj::Project.open('GithubSDK.xcodeproj')
project.targets.each do |target|
  if target.name == 'GithubSDK'
    can_add_phase = true
    phase_name = "Apollo codegen"
    target.build_phases.each do |phase|
      if phase.display_name == phase_name
        can_add_phase = false
      end
    end

    if can_add_phase
      phase = target.new_shell_script_build_phase(phase_name)
      phase.shell_script = "APOLLO_CODEGEN_PATH=\"$(eval find ${SRCROOT} -name \"check-and-run-apollo-codegen.sh\")\"\nif [ -z \"$APOLLO_CODEGEN_PATH\" ]; then\necho \"error: Couldn't find check-and-run-apollo-codegen.sh in APOLLO_CODEGEN_PATH; make sure that all is correct\"\nexit 1\nfi\ncd \"${SRCROOT}/Sources/${TARGET_NAME}\"\n\"${APOLLO_CODEGEN_PATH}\" generate $(find . -name '*.graphql') --schema ../../schema.json --output API.swift"
    end
  end
end

project.save
