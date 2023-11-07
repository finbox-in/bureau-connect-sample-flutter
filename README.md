# BureauConnect: Flutter

BureauConnect Flutter SDK is a wrapper around Android SDK which helps you take consent from the user through your Android application before fetching the bureau details.

## Add Plugin

Specify the following in `local.properties` file:

  ```
    ACCESS_KEY=<ACCESS_KEY>
    SECRET_KEY=<SECRET_KEY>
    FBC_SDK_VERSION=<FBC_SDK_VERSION>
```

Add plugin dependency in `pubspec.yaml` file:

  ```yml
  finbox_bureau_plugin: any
  ```

::: warning NOTE
Following will be shared by FinBox team at the time of integration:

- `ACCESS_KEY`
- `SECRET_KEY`
- `FBC_SDK_VERSION`
- `CLIENT_API_KEY`
  :::

## Build Bureau Connect

Build the `FinBoxBureauConnect` object by passing `apiKey`, `customerId`, `firstName`, `lastName` and `phoneNumber`.

`ENVIRONMENT` is an optional field. Default value of environment is `PROD`.

::: tip Note
`ENVIRONMENT` needs to be updated to `PROD` when migrating application to production.
:::

Now that all required parameters are available, we can start the SDK flow as follows:

```dart
FinBoxBureauPlugin.initSdk("<ENVIRONMENT>",
        "<CLIENT_API_KEY>",
        "<CUSTOMER_ID>",
        "CUSTOMER_FIRST_NAME",
        "CUSTOMER_LAST_NAME",
        "CUSTOMER_PHONE_NUMBER");
```

## Start SDK flow

Start BureauActivity

```dart
FinBoxBureauPlugin.startBureauJourney();
```

## Parse the results

Once the user has granted the consent, the SDK will be automatically closed. Once the SDK closes, the success or failure result will be returned

Listen to the result callbacks from `build` method.

```dart
FinBoxBureauPlugin.platform.setMethodCallHandler(_getJourneyResult);
```

```dart
static Future<void> _getJourneyResult(MethodCall call) async {
if (call.method == 'getJourneyResult') {
        var resultJson = call.arguments
    }
}
```

Following json will be received

```json
{"consent_given":true,"error_type":"error_code","message":"msg"}
```