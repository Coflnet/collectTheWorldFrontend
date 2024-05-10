# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAuthAnonymousPost**](AuthApi.md#apiauthanonymouspost) | **POST** /api/auth/anonymous | 


# **apiAuthAnonymousPost**
> apiAuthAnonymousPost(anonymousLoginRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final anonymousLoginRequest = AnonymousLoginRequest(); // AnonymousLoginRequest | 

try {
    api_instance.apiAuthAnonymousPost(anonymousLoginRequest);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthAnonymousPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **anonymousLoginRequest** | [**AnonymousLoginRequest**](AnonymousLoginRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

