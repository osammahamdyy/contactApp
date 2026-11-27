# Route

A simple Flutter contacts app: splash screen, empty state, add-contact bottom sheet, and a contact grid with delete.

## Setup

1. Create the platform folders (android / ios) inside this folder:

   ```
   flutter create . --project-name route_app
   ```

2. Install packages:

   ```
   flutter pub get
   ```

3. Replace the placeholder images in `assets/images/` with your own (keep the same file names, or change them in `lib/core/app_assets.dart`):

   | File | Used for |
   | --- | --- |
   | `splash_logo.png` | Native splash logo |
   | `route_logo.png` | Logo in the app bar |
   | `empty_list.png` | Empty-state illustration |
   | `image_placeholder.png` | Picture placeholder icon |
   | `email_icon.png` | Email icon on contact cards |
   | `phone_icon.png` | Phone icon on contact cards |
   | `delete_icon.png` | Trash icon (Delete buttons) |
   | `add_icon.png` | Optional "+" icon |

   Search for `TODO(assets)` to find every place an asset is used.

4. Generate the native splash:

   ```
   dart run flutter_native_splash:create
   ```

5. iOS only: add this to `ios/Runner/Info.plist` so the image picker works:

   ```xml
   <key>NSPhotoLibraryUsageDescription</key>
   <string>Choose a photo for the contact.</string>
   ```

6. Run:

   ```
   flutter run
   ```

## Colors

All colors are in `lib/core/app_colors.dart`. Edit the hex values there.

## Structure

```
lib/
  main.dart
  core/        app_colors.dart, app_assets.dart
  models/      contact_model.dart
  screens/     home_screen.dart
  widgets/     add_contact_sheet.dart, contact_card.dart, empty_contacts.dart
```
