'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6b592abe52103081758297ec309499dc",
"favicon.ico": "c608cb99a18b37ccfab0daf8eecfea11",
"index.html": "8738648e96ea2fd61730aeb5c38af683",
"/": "8738648e96ea2fd61730aeb5c38af683",
"main.dart.js": "b1ccf3bbe660daa03ac9e64668dd6a03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "67554c9a8ae5ef497fbc3f2c275aec52",
"assets/AssetManifest.json": "936962214ace9e640a023205b799a2b7",
"assets/NOTICES": "3532d3a1902cfa3b989608460e7f1c4c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/lib/asset/sicks/%25E0%25B9%2584%25E0%25B8%2582%25E0%25B9%2589%2520.png": "5859fa863304db419e24d932d8c098b1",
"assets/lib/asset/sicks/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B9%2580%25E0%25B8%25AA%25E0%25B8%25B5%25E0%25B8%25A2.png": "f574b372fe695e51b79ae41226a93372",
"assets/lib/asset/sicks/%25E0%25B8%25AB%25E0%25B8%2599%25E0%25B9%2589%25E0%25B8%25B2%25E0%25B8%25A1%25E0%25B8%25B7%25E0%25B8%2594.png": "f616bba298e0c746f475443dbe1be68f",
"assets/lib/asset/sicks/%25E0%25B9%2584%25E0%25B8%25AD.png": "5c195f64fc337777fbc1c94107fb097a",
"assets/lib/asset/sicks/%25E0%25B9%2580%25E0%25B8%2594%25E0%25B9%2587%25E0%25B8%2581%25E0%25B9%2580%25E0%25B8%259B%25E0%25B9%2587%25E0%25B8%2599%25E0%25B9%2584%25E0%25B8%2582%25E0%25B9%2589%2520.png": "46fa70a92e0f106d83ceb5bf4e235384",
"assets/lib/asset/sicks/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B8%259C%25E0%25B8%25B9%25E0%25B8%2581.png": "399695328d0c18fd638a587d4df52f11",
"assets/lib/asset/sicks/%25E0%25B8%25AD%25E0%25B8%25B5%25E0%25B8%25AA%25E0%25B8%25B8%25E0%25B8%2581%25E0%25B8%25AD%25E0%25B8%25B5%25E0%25B9%2583%25E0%25B8%25AA.png": "ab69c544ca88bca7893e5962e4b7e11b",
"assets/lib/asset/sicks/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B8%25AD%25E0%25B8%25B7%25E0%25B8%2594.png": "e64e1f2564c33ab5a56165bf2d1ed102",
"assets/lib/asset/sicks/%25E0%25B8%25AD%25E0%25B8%25B2%25E0%25B9%2580%25E0%25B8%2588%25E0%25B8%25B5%25E0%25B8%25A2%25E0%25B8%2599.png": "551220fba998b953b5a7ca4186d7e03c",
"assets/lib/asset/allsick/%25E0%25B9%2584%25E0%25B8%2582%25E0%25B9%2589%2520.png": "860826d30d6af7480ac6d1e1e34cc87d",
"assets/lib/asset/allsick/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B9%2580%25E0%25B8%25AA%25E0%25B8%25B5%25E0%25B8%25A2.png": "92f606754ff8c67129f0d8bde7645bbd",
"assets/lib/asset/allsick/%25E0%25B8%259B%25E0%25B8%25A7%25E0%25B8%2594%25E0%25B8%259B%25E0%25B8%25A3%25E0%25B8%25B0%25E0%25B8%2588%25E0%25B8%25B3%25E0%25B9%2580%25E0%25B8%2594%25E0%25B8%25B7%25E0%25B8%25AD%25E0%25B8%2599.png": "a33cb574346bbde3315377d131f0e31e",
"assets/lib/asset/allsick/%25E0%25B8%25AB%25E0%25B8%2599%25E0%25B9%2589%25E0%25B8%25B2%25E0%25B8%25A1%25E0%25B8%25B7%25E0%25B8%2594.png": "3bf3ecd85d6c151afad42fa82250dae6",
"assets/lib/asset/allsick/%25E0%25B9%2584%25E0%25B8%25AD.png": "aa321e0a6f2a8704ead0fd3415b9eb40",
"assets/lib/asset/allsick/%25E0%25B9%2580%25E0%25B8%2594%25E0%25B9%2587%25E0%25B8%2581%25E0%25B9%2580%25E0%25B8%259B%25E0%25B9%2587%25E0%25B8%2599%25E0%25B9%2584%25E0%25B8%2582%25E0%25B9%2589%2520.png": "aebc8055e12c6267bccf68bd269320de",
"assets/lib/asset/allsick/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B8%259C%25E0%25B8%25B9%25E0%25B8%2581.png": "91008f056289764601683c4c61902cc4",
"assets/lib/asset/allsick/%25E0%25B8%25AD%25E0%25B8%25B5%25E0%25B8%25AA%25E0%25B8%25B8%25E0%25B8%2581%25E0%25B8%25AD%25E0%25B8%25B5%25E0%25B9%2583%25E0%25B8%25AA.png": "c094f6af2a8cb69a7e7f0aee1a7bfee3",
"assets/lib/asset/allsick/%25E0%25B8%2597%25E0%25B9%2589%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B8%25AD%25E0%25B8%25B7%25E0%25B8%2594.png": "7dabb7212bf5eb3a2b6900499404df10",
"assets/lib/asset/allsick/Picture1.JPG": "98bccef0faa49104f94c43665260792e",
"assets/lib/asset/allsick/%25E0%25B8%25AD%25E0%25B8%25B2%25E0%25B9%2580%25E0%25B8%2588%25E0%25B8%25B5%25E0%25B8%25A2%25E0%25B8%2599.png": "9d0f500d51cc4e5d785f510244802378",
"assets/lib/asset/stores/%25E0%25B8%25AB%25E0%25B9%2589%25E0%25B8%25B2%25E0%25B8%2587%25E0%25B8%2582%25E0%25B8%25B2%25E0%25B8%25A2%25E0%25B8%25A2%25E0%25B8%25B2%25E0%25B8%259A%25E0%25B9%2589%25E0%25B8%25A7%25E0%25B8%2599%25E0%25B8%25AA%25E0%25B8%25B8%25E0%25B8%2599%25E0%25B8%2595%25E0%25B8%25B6%25E0%25B9%258A%25E0%25B8%2587%2520.png": "d3dbe10a3c06d308cfef880c5e3e8dd7",
"assets/lib/asset/stores/%25E0%25B8%2597%25E0%25B8%25AD%25E0%25B8%2587%25E0%25B9%2584%25E0%25B8%2597%25E0%25B8%25A2%25E0%25B9%2582%25E0%25B8%25AD%25E0%25B8%25AA%25E0%25B8%2596.png": "7ee51274cc94fe6341e09b52d764c910",
"assets/lib/asset/stores/%25E0%25B9%2580%25E0%25B8%25A7%25E0%25B8%258A%25E0%25B8%259E%25E0%25B8%2587%25E0%25B8%25A8%25E0%25B9%258C%25E0%25B9%2582%25E0%25B8%25AD%25E0%25B8%25AA%25E0%25B8%2596.png": "27cf12d860093cfcb5492555bcf6f5b6",
"assets/lib/asset/stores/%25E0%25B8%25A3%25E0%25B9%2589%25E0%25B8%25B2%25E0%25B8%2599%25E0%25B9%2580%25E0%25B8%2588%25E0%25B8%25A3%25E0%25B8%25B4%25E0%25B8%258D%25E0%25B9%2582%25E0%25B8%25AD%25E0%25B8%25AA%25E0%25B8%2596.png": "2e2dfa3af398d53b42d29cdd7a18d965",
"assets/lib/asset/logo.jpg": "830eafbe362863fafe3db4254d33953c",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498"
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
