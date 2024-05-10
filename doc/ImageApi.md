# openapi.api.ImageApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiImagesIdGet**](ImageApi.md#apiimagesidget) | **GET** /api/images/{id} | Get image metadata with download url
[**apiImagesLabelPost**](ImageApi.md#apiimageslabelpost) | **POST** /api/images/{label} | Upload an image  NOTE: the image has to be included as form-data file


# **apiImagesIdGet**
> CapturedImageWithDownloadUrl apiImagesIdGet(id)

Get image metadata with download url

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ImageApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.apiImagesIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling ImageApi->apiImagesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**CapturedImageWithDownloadUrl**](CapturedImageWithDownloadUrl.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiImagesLabelPost**
> CapturedImage apiImagesLabelPost(label)

Upload an image  NOTE: the image has to be included as form-data file

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ImageApi();
final label = label_example; // String | 

try {
    final result = api_instance.apiImagesLabelPost(label);
    print(result);
} catch (e) {
    print('Exception when calling ImageApi->apiImagesLabelPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **label** | **String**|  | 

### Return type

[**CapturedImage**](CapturedImage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

