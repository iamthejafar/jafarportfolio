#!/bin/bash

# Install Flutter
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Run Flutter doctor (optional)
flutter doctor

# Build Flutter web
flutter build web
