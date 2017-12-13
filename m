Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751470AbdLMXKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:10:20 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/4] py: pyvid: Provide stream_off binding
Date: Wed, 13 Dec 2017 23:10:10 +0000
Message-Id: <f1877f6b75214f041d838c8018a99d247825ce1d.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The videodevice module defines a stream_off function call, but this is
not available in the python bindings interface.

Provide the binding of VideoStreamer::stream_off.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 py/pykms/pyvid.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/py/pykms/pyvid.cpp b/py/pykms/pyvid.cpp
index 6a6080e4b2b7..92006c404038 100644
--- a/py/pykms/pyvid.cpp
+++ b/py/pykms/pyvid.cpp
@@ -34,5 +34,6 @@ void init_pyvid(py::module &m)
 			.def("queue", &VideoStreamer::queue)
 			.def("dequeue", &VideoStreamer::dequeue)
 			.def("stream_on", &VideoStreamer::stream_on)
+			.def("stream_off", &VideoStreamer::stream_off)
 			;
 }
-- 
git-series 0.9.1
