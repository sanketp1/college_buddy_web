'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "8eccff9e7a39e2e4d657aaae3b37a5c2",
"assets/assets/C1.png": "0470747c6da0b5e555150257e1826209",
"assets/assets/fonts/Roboto-Light.ttf": "6090d256d88dcd7f0244eaa4a3eafbba",
"assets/assets/fonts/Roboto-Regular.ttf": "f36638c2135b71e5a623dca52b611173",
"assets/assets/fonts/Rokkitt-VariableFont_wght.ttf": "94e6e741e668a89d3db79b52de88b3f6",
"assets/assets/LoginPage.png": "2269747e076030249c579988714f3408",
"assets/assets/LoginPage.svg": "569eab19f1e57996243b1f9c2b836c6c",
"assets/assets/questions.xlsx": "2d17ee88e565f94fbcd9c1928aab59b0",
"assets/assets/Rectangle2.png": "25b494806c1a6693534f73b5fc6993c6",
"assets/FontManifest.json": "4f4d12e3931fbf4f61c2fe0b00be2645",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "ef5614e1963968d8bd81aeb58d16425c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"favicon.png": "77c5b33b5fc73b411c2b02ef8726d6a7",
"icons/android-icon-144x144.png": "4380bb89314f68b15e97d80c820df4b2",
"icons/android-icon-192x192.png": "ccb75cc626b5c89d775395eaf1081e66",
"icons/android-icon-36x36.png": "b561eda04001cc18e39f284472e4d5ff",
"icons/android-icon-48x48.png": "ae2eeb94d07e14e8f7c0840c820d83f8",
"icons/android-icon-72x72.png": "7299d5737bf1be955a6c91f30b8f56dc",
"icons/android-icon-96x96.png": "8d45382499d9ab682c6d1de5538aaffb",
"icons/apple-icon-114x114.png": "1be9fd6e5244ed50ddc76305bbe3134b",
"icons/apple-icon-120x120.png": "2e37b41c6f7fbb219885e5138c31098e",
"icons/apple-icon-144x144.png": "4380bb89314f68b15e97d80c820df4b2",
"icons/apple-icon-152x152.png": "bfdbcfa5c6446cfccb6576cee59985dd",
"icons/apple-icon-180x180.png": "17925f84e204a3f1a39983f3304a66d9",
"icons/apple-icon-57x57.png": "122270a8d5503226b936e4e01ea99fc8",
"icons/apple-icon-60x60.png": "59399b371ddc6587f222b3dc4bd20e2a",
"icons/apple-icon-72x72.png": "7299d5737bf1be955a6c91f30b8f56dc",
"icons/apple-icon-76x76.png": "c859b3c7cfb580a8b969d9f5cbc5bf42",
"icons/apple-icon-precomposed.png": "70ed8448069287948e580e1fe3cbfc45",
"icons/apple-icon.png": "70ed8448069287948e580e1fe3cbfc45",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/favicon-16x16.png": "77c5b33b5fc73b411c2b02ef8726d6a7",
"icons/favicon-32x32.png": "5bde37f652bb3b78421fbe928e24a0ae",
"icons/favicon-96x96.png": "8d45382499d9ab682c6d1de5538aaffb",
"icons/favicon.ico": "1d0bf140af7dfd534273cd373236c20a",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/ms-icon-144x144.png": "4380bb89314f68b15e97d80c820df4b2",
"icons/ms-icon-150x150.png": "3bb6329b114ad7500125b716562850af",
"icons/ms-icon-310x310.png": "055668c9034b6e609bbf79e80333361f",
"icons/ms-icon-70x70.png": "f6ea1eaac24eef364c420c7854817a5a",
"index.html": "f8c9a359c30ebddb3eb7942bd8707462",
"/": "f8c9a359c30ebddb3eb7942bd8707462",
"main.dart.js": "b842886c3b23000e6933cc7b001c3b58",
"manifest.json": "baa33b9d47830b50f0ea3fe76ffb7c22",
"version.json": "228410e7a4d3b9050abaafa435fd93d3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
