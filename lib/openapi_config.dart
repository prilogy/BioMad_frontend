import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        AdditionalProperties(pubName: 'api', pubAuthor: 'ksydex'),
    inputSpecFile: 'spec/openapi.yaml',
    generatorName: Generator.DART,
    alwaysRun: true,
    outputDirectory: 'apiTmp')
class OpenapiConfig extends OpenapiGeneratorConfig {}
