# Internalize

![App banner](./non_code_icons/internalize-canva-banner.jpg)

A flutter app to help you memorize passages using fill in the blanks!

This was my first app using Flutter! I've used React Native a lot but wanted to try out Flutter to compare! While this was fun, I ended up deciding that I'd rather focus my efforts on learning native android rather than learning another cross platform solution. So once I got a super simple MVP created for this, I stopped working on this project to work on the [native version](https://github.com/brighamandersen/internalize).

## Feature set

- Create passages
- Edit passages
- Delete passages
- Memorize passages (view the passage entirely with nothing hidden, only see the first letters and hide the rest, or hide all the letters)

## Build and install release apk

```bash
flutter build apk --release
```

```bash
flutter install
```

## Regenerate Hive Adapters

To regenerate the Hive adapter files after modifying your models, run the following command:

```bash
dart run build_runner build
```

## Font Sizes

General font sizes that we're following are 24px for header text, 18px for main text, then 16px for miscellaneous text like on segmented buttons and save buttons.

## Launcher/Store App Icons

You can find the master icon used to generate all the iOS/Android variations in `/non_code_icons/`. There you can also find the app icons used for the iOS App Store and the Google Play Store. All these icons in this folder are not actually used in the code, I just keep them in the repo so they're easy to find. As for the icons that are generated from the icon and used directly in the app, you can find them on iOS in `ios/Runner/Assets.xcassets/AppIcon.appiconset/` or on Android in `android/app/src/main/res/mipmap*`.
