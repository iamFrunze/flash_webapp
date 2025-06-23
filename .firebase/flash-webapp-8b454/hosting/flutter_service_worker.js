'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.bin": "3c822aac5fe0f6a18af75b6e51fd4e53",
"assets/AssetManifest.bin.json": "52c4226757bf7a2d2e67f60d97bcebce",
"assets/AssetManifest.json": "a05e743a5e31d799dcdd5c0f02f5695f",
"assets/assets/board.json": "a42de7701aac1d580cb697fab3481ce2",
"assets/assets/common.json": "d8c2ba8ca4acc39294d84d008cb9f6b5",
"assets/assets/logo.png": "d013345a5b42963f5cc7f8e888d0a84a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c11f8975b355edadc51f42a4a951e5b9",
"assets/NOTICES": "13823d52ed0334cc9af000e9f73a2511",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "03dce141b0562e9c7ba427babaceecfb",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "61f95f4a74a15f43eb1f0fff8c02f177",
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
"index.html": "613f857a17310eb0a7d33900d81cf19a",
"/": "613f857a17310eb0a7d33900d81cf19a",
"main.dart.js": "3072c19a3b02cc624bfde4c6ce92e96f",
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
