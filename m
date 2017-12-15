Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38877 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756747AbdLOPQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:27 -0500
Received: by mail-wm0-f68.google.com with SMTP id 64so18201979wme.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:26 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 4/7] drm/img-rogue: dma_buf_ops .kmap_* are now .map_*
Date: Fri, 15 Dec 2017 16:15:42 +0100
Message-Id: <1513350945-2642-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 services/server/env/linux/physmem_dmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/services/server/env/linux/physmem_dmabuf.c b/services/server/env/linux/physmem_dmabuf.c
index 5faa62d..ac651d3 100644
--- a/services/server/env/linux/physmem_dmabuf.c
+++ b/services/server/env/linux/physmem_dmabuf.c
@@ -124,8 +124,8 @@ static const struct dma_buf_ops sPVRDmaBufOps =
 	.map_dma_buf   = PVRDmaBufOpsMap,
 	.unmap_dma_buf = PVRDmaBufOpsUnmap,
 	.release       = PVRDmaBufOpsRelease,
-	.kmap_atomic   = PVRDmaBufOpsKMap,
-	.kmap          = PVRDmaBufOpsKMap,
+	.map_atomic    = PVRDmaBufOpsKMap,
+	.map           = PVRDmaBufOpsKMap,
 	.mmap          = PVRDmaBufOpsMMap,
 };
 
-- 
2.7.4
