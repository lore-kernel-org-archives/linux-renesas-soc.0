Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751092AbdLMXKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:10:24 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 4/4] kms++util: Add frame compare functionality
Date: Wed, 13 Dec 2017 23:10:12 +0000
Message-Id: <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a means to compare two identically sized framebuffers.

This basic implementation expects the two buffers to have the same
formats and sizes, and will return zero for identical frames, or a
positive float representing and average difference otherwise.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 kms++util/inc/kms++util/kms++util.h |  1 +-
 kms++util/src/verification.cpp      | 31 ++++++++++++++++++++++++++++++-
 py/pykms/pykmsutil.cpp              |  2 ++-
 3 files changed, 34 insertions(+)

diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
index 431de0bb159a..753cee189451 100644
--- a/kms++util/inc/kms++util/kms++util.h
+++ b/kms++util/inc/kms++util/kms++util.h
@@ -29,6 +29,7 @@ void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
 void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
 
 void save_raw_frame(IFramebuffer& fb, const char *filename);
+float compare_framebuffers(IFramebuffer& a, IFramebuffer& b);
 }
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
index 3210bb144d2b..a46d6f924095 100644
--- a/kms++util/src/verification.cpp
+++ b/kms++util/src/verification.cpp
@@ -18,4 +18,35 @@ void save_raw_frame(IFramebuffer& fb, const char *filename)
 		os->write((char*)fb.map(i), fb.size(i));
 }
 
+float compare_framebuffers(IFramebuffer& a, IFramebuffer& b)
+{
+	unsigned int i;
+	unsigned int pixels = a.width() * a.height();
+	uint8_t *pa = a.map(0);
+	uint8_t *pb = b.map(0);
+
+	float diff = 0;
+
+	if (a.format() != b.format())
+		throw std::invalid_argument("Pixel formats differ...");
+
+	if ((a.width() != b.width() ||
+	    (a.height() != b.height())))
+		throw std::invalid_argument("Frame sizes differ...");
+
+	// Formats are identical, so num_planes are already identical
+	for (i = 0; i < a.num_planes(); i++) {
+		if ((a.offset(i) != b.offset(i)) ||
+		    (a.stride(i) != b.stride(i)))
+			throw std::invalid_argument("Planes differ...");
+	}
+
+	// Simple byte comparisons to start.
+	// This expects a frame to be identical, including non-visible data.
+	for (i = 0; i < a.size(0) && i < b.size(0); i++)
+		diff += abs(pa[i] - pb[i]);
+
+	return diff / pixels;
+}
+
 }
diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
index 2d741751ba75..b86690a3d306 100644
--- a/py/pykms/pykmsutil.cpp
+++ b/py/pykms/pykmsutil.cpp
@@ -64,4 +64,6 @@ void init_pykmstest(py::module &m)
 	m.def("save_raw_frame", [](Framebuffer& fb, const char * filename) {
 		save_raw_frame(fb, filename);
 	});
+	m.def("compare_framebuffers", [](Framebuffer& a, Framebuffer& b) {
+		return compare_framebuffers(a, b); } );
 }
-- 
git-series 0.9.1
