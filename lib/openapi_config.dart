import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        AdditionalProperties(pubName: 'api', pubAuthor: 'ksydex'),
    inputSpecFile: 'C:/Users/aolychkin/AndroidStudioProjects/git/BioMad_frontend/spec/openapi.yaml',
    generatorName: Generator.dart,
    alwaysRun: true,
    outputDirectory: 'C:/Users/aolychkin/AndroidStudioProjects/git/BioMad_frontend/apiT')
class OpenapiConfig extends OpenapiGeneratorConfig {}
