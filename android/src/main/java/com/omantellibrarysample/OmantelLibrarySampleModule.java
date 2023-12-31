package com.omantellibrarysample;

import android.content.Intent;

import androidx.annotation.NonNull;

import com.app.spin_and_win.SpinAndWinActivity;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = OmantelLibrarySampleModule.NAME)
public class OmantelLibrarySampleModule extends ReactContextBaseJavaModule {
  public static final String NAME = "OmantelLibrarySample";

  public OmantelLibrarySampleModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }


  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  public void loadGame( Promise promise) {

    Intent i = new Intent(getCurrentActivity(), SpinAndWinActivity.class);
    i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    getCurrentActivity().startActivity(i);
    promise.resolve("game loaded...");
  }
}
