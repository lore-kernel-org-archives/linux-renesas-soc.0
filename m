Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751092AbdLMXKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:10:22 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/4] kms++util: Add verification module
Date: Wed, 13 Dec 2017 23:10:11 +0000
Message-Id: <2804f59b2ecafc22abb57428f38a9b2d267ff0b7.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a util module to provide helpers involved in validation and verification
of data frames.

The first addition is a raw frame binary output with bindings to python modelled
on Tomi's implementation in wbcap.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 kms++util/inc/kms++util/kms++util.h |  2 ++
 kms++util/src/verification.cpp      | 21 +++++++++++++++++++++
 py/pykms/pykmsutil.cpp              |  5 +++++
 3 files changed, 28 insertions(+)
 create mode 100644 kms++util/src/verification.cpp

diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
index 8e45b0df3cde..431de0bb159a 100644
--- a/kms++util/inc/kms++util/kms++util.h
+++ b/kms++util/inc/kms++util/kms++util.h
@@ -27,6 +27,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const std::string& str
 void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
 
 void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
+
+void save_raw_frame(IFramebuffer& fb, const char *filename);
 }
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
diff --git a/kms++util/src/verification.cpp b/kms++util/src/verification.cpp
new file mode 100644
index 000000000000..3210bb144d2b
--- /dev/null
+++ b/kms++util/src/verification.cpp
@@ -0,0 +1,21 @@
+
+#include <kms++/kms++.h>
+#include <kms++util/kms++util.h>
+
+#include <fstream>
+
+using namespace std;
+
+namespace kms
+{
+
+void save_raw_frame(IFramebuffer& fb, const char *filename)
+{
+	unique_ptr<ofstream> os;
+	os = unique_ptr<ofstream>(new ofstream(filename, ofstream::binary));
+
+	for (unsigned i = 0; i < fb.num_planes(); ++i)
+		os->write((char*)fb.map(i), fb.size(i));
+}
+
+}
diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
index 518d5eaa88f0..2d741751ba75 100644
--- a/py/pykms/pykmsutil.cpp
+++ b/py/pykms/pykmsutil.cpp
@@ -59,4 +59,9 @@ void init_pykmstest(py::module &m)
 	} );
 	m.def("draw_text", [](Framebuffer& fb, uint32_t x, uint32_t y, const string& str, RGB color) {
 		draw_text(fb, x, y, str, color); } );
+
+	// Verification and Validation
+	m.def("save_raw_frame", [](Framebuffer& fb, const char * filename) {
+		save_raw_frame(fb, filename);
+	});
 }
-- 
git-series 0.9.1
