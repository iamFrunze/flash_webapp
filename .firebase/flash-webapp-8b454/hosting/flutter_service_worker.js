'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.bin": "22347fc3d7a8eb10ed0068e2c2379342",
"assets/AssetManifest.bin.json": "8cb984887d5927c4f1f3b3ef907e7b08",
"assets/AssetManifest.json": "088a1b823ab85c7c584a215601f5a115",
"assets/assets/board.json": "721dd2224df17a15f7f99bba4f8e8b0f",
"assets/assets/logo.png": "d013345a5b42963f5cc7f8e888d0a84a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4ee06a065fc321cbda18b2c720038dc5",
"assets/NOTICES": "d7a23a0b847067fb7b3b23e8b7208fb6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "03dce141b0562e9c7ba427babaceecfb",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "9c34a6f894380a072a4e01e9704591bc",
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
"index.html": "420a493b9284a21984facc90b9a8d95d",
"/": "420a493b9284a21984facc90b9a8d95d",
"main.dart.js": "1b34b8affd0c198c95163f577f5d0d00",
"manifest.json": "6af66666adb109dc59e8085d66192751",
"version.json": "48f48f1a061d6d8e8f01453f5bfe7f78"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
