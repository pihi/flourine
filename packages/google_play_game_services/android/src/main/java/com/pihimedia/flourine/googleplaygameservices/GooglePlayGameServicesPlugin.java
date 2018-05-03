package com.pihimedia.flourine.googleplaygameservices;

import android.app.Activity;
import android.app.Application;
import android.util.Log;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.view.FlutterView;

/**
 * GooglePlayGameServicesPlugin
 */
public class GooglePlayGameServicesPlugin implements MethodCallHandler {
  private static final String CHANNEL_NAME = "flourine.pihimedia.com/google_play_game_services";

  private static final String TAG = "flourine";

  private static String googleSignInPluginKey;

  public static void registerWith(Registrar registrar) {
    Log.i(TAG, "register channel: " + CHANNEL_NAME);
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
    final GooglePlayGameServicesPlugin instance = new GooglePlayGameServicesPlugin(registrar);
    channel.setMethodCallHandler(instance);
  }

  private PluginRegistry.Registrar registrar;

  private GooglePlayGameServicesPlugin(PluginRegistry.Registrar registrar) {
    Log.i(TAG, "Creating new " + GooglePlayGameServicesPlugin.class.getCanonicalName() + " with " + Registrar.class.getCanonicalName());
    this.registrar = registrar;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    Log.d(TAG, "Received method call: " + call.method);

    GoogleSignInAccount account = GoogleSignIn.getLastSignedInAccount(registrar.activity());

    if (account == null) {
      Log.d(TAG, "Must sign in");
      result.error("anonymous", "User must sign in", null);
      return;
    } else {
      Log.d(TAG, "ACCOUNT: " + account.toString());
    }
  }
}
