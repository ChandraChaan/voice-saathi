package dev.chandra.voice_saathi

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private var speech: SpeechChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger

        val speechChannel = MethodChannel(messenger, "voice_saathi/speech")
        speech = SpeechChannel(applicationContext, speechChannel).also {
            speechChannel.setMethodCallHandler(it)
        }
        MethodChannel(messenger, "voice_saathi/phone").setMethodCallHandler(PhoneChannel(this))
    }

    override fun onDestroy() {
        speech?.dispose()
        super.onDestroy()
    }
}
