'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.bin": "bda69b2d94259a62c8374769b8373c49",
"assets/AssetManifest.bin.json": "1f17fcf8fa0f6e563df96725fec3c72e",
"assets/AssetManifest.json": "491f300584ee76691ac1f791d93d4b8e",
"assets/assets/logo.png": "d013345a5b42963f5cc7f8e888d0a84a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2eee5f4e1b8b74fc40200894e83e4491",
"assets/NOTICES": "b79a5a80efc7e726726ff61f8b16b2fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "03dce141b0562e9c7ba427babaceecfb",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/android-icon-144x144.png": "38eb50a964156fd6696d79a5d5896425",
"icons/android-icon-192x192.png": "4b6320efe6ce04f51aa5fcd9ff8312ba",
"icons/android-icon-36x36.png": "0db2fb01b531fc3cd451c679198b097d",
"icons/android-icon-48x48.png": "43ce345214b8d78d4bdebc995640e13d",
"icons/android-icon-72x72.png": "4988d13f01ac03043474d6aaf2d80bb7",
"icons/android-icon-96x96.png": "d4289fdb889ea5a1e315139b91275f6e",
"icons/apple-icon-114x114.png": "fb8924ec572930989e102e1632746016",
"icons/apple-icon-120x120.png": "3f79521f107ef90d80029760de6ca101",
"icons/apple-icon-144x144.png": "38eb50a964156fd6696d79a5d5896425",
"icons/apple-icon-152x152.png": "869c632ef8e590cc562a9b657de0667b",
"icons/apple-icon-180x180.png": "742b41c18705f96f3b8ff17311f6d209",
"icons/apple-icon-57x57.png": "2c1b94a6d9a20045a72fdc752f024cc7",
"icons/apple-icon-60x60.png": "341df57c808114f219addef76ecf7b9c",
"icons/apple-icon-72x72.png": "4988d13f01ac03043474d6aaf2d80bb7",
"icons/apple-icon-76x76.png": "ebe16ed34c5a10fa027f0856101b5bdd",
"icons/apple-icon-precomposed.png": "c64d2dbb14f385b1e6a372df31817c73",
"icons/apple-icon.png": "c64d2dbb14f385b1e6a372df31817c73",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/favicon-16x16.png": "7ac269a6ea1a0f95ca0fe8b435838fda",
"icons/favicon-32x32.png": "f85bc2a18bab11ef86c2a69a4b97e7c1",
"icons/favicon-96x96.png": "d4289fdb889ea5a1e315139b91275f6e",
"icons/favicon.ico": "b4542f2f09267b0e0a8cdc1efc4cfd15",
"icons/Icon-192.png": "b2bb5e5b713dc9bc4d0e4bedfc518292",
"icons/Icon-512.png": "b432812e34f9c85049623bf86c59007f",
"icons/Icon-maskable-192.png": "b2bb5e5b713dc9bc4d0e4bedfc518292",
"icons/Icon-maskable-512.png": "b432812e34f9c85049623bf86c59007f",
"icons/ms-icon-144x144.png": "38eb50a964156fd6696d79a5d5896425",
"icons/ms-icon-150x150.png": "803261e5ec6a51c0ece8747aedd42814",
"icons/ms-icon-310x310.png": "0136c1011fd79e3b4c6d4b8859f068f3",
"icons/ms-icon-70x70.png": "5ea77b0e242ba627745facdeef698c1c",
"index.html": "11e71cfe74881a5263361c5bd17c6614",
"/": "11e71cfe74881a5263361c5bd17c6614",
"main.dart.js": "07b010e9093752ff801cc71275017c82",
"manifest.json": "6af66666adb109dc59e8085d66192751",
"version.json": "48f48f1a061d6d8e8f01453f5bfe7f78"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
