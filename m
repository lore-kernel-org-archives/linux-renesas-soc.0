Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751092AbdLMXKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:10:19 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/4] videodevice: Fix minor spacing
Date: Wed, 13 Dec 2017 23:10:09 +0000
Message-Id: <494504a89241ba23024e8e125e8d6950fb70a18d.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Provide a space between the return type and the function definition

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 kms++util/src/videodevice.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kms++util/src/videodevice.cpp b/kms++util/src/videodevice.cpp
index e21916bcd06b..efe1678d031e 100644
--- a/kms++util/src/videodevice.cpp
+++ b/kms++util/src/videodevice.cpp
@@ -436,7 +436,7 @@ void VideoStreamer::queue(DumbFramebuffer* fb)
 	v4l2_queue_dmabuf(m_fd, idx, fb, get_buf_type(m_type));
 }
 
-DumbFramebuffer*VideoStreamer::dequeue()
+DumbFramebuffer* VideoStreamer::dequeue()
 {
 	uint32_t idx = v4l2_dequeue(m_fd, get_buf_type(m_type));
 
-- 
git-series 0.9.1
