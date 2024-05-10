# openapi.api.ObjectApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiObjectsCategoriesGet**](ObjectApi.md#apiobjectscategoriesget) | **GET** /api/objects/categories | 
[**apiObjectsCategoryCategoryNameGet**](ObjectApi.md#apiobjectscategorycategorynameget) | **GET** /api/objects/category/{categoryName} | 
[**apiObjectsGet**](ObjectApi.md#apiobjectsget) | **GET** /api/objects | 
[**apiObjectsObjectIdGet**](ObjectApi.md#apiobjectsobjectidget) | **GET** /api/objects/{objectId} | 


# **apiObjectsCategoriesGet**
> List<Category> apiObjectsCategoriesGet()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ObjectApi();

try {
    final result = api_instance.apiObjectsCategoriesGet();
    print(result);
} catch (e) {
    print('Exception when calling ObjectApi->apiObjectsCategoriesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Category>**](Category.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiObjectsCategoryCategoryNameGet**
> List<CollectableObject> apiObjectsCategoryCategoryNameGet(categoryName)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ObjectApi();
final categoryName = categoryName_example; // String | 

try {
    final result = api_instance.apiObjectsCategoryCategoryNameGet(categoryName);
    print(result);
} catch (e) {
    print('Exception when calling ObjectApi->apiObjectsCategoryCategoryNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryName** | **String**|  | 

### Return type

[**List<CollectableObject>**](CollectableObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiObjectsGet**
> List<CollectableObject> apiObjectsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ObjectApi();

try {
    final result = api_instance.apiObjectsGet();
    print(result);
} catch (e) {
    print('Exception when calling ObjectApi->apiObjectsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<CollectableObject>**](CollectableObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiObjectsObjectIdGet**
> CollectableObject apiObjectsObjectIdGet(objectId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ObjectApi();
final objectId = objectId_example; // String | 

try {
    final result = api_instance.apiObjectsObjectIdGet(objectId);
    print(result);
} catch (e) {
    print('Exception when calling ObjectApi->apiObjectsObjectIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectId** | **String**|  | 

### Return type

[**CollectableObject**](CollectableObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

