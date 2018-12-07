Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:5386 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbeLGLg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 06:36:28 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/5] nvmem: check invalid number of bytes in nvmem_device_{read,write}
Date: Fri,  7 Dec 2018 11:27:42 +0000
Message-Id: <1544182066-31528-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add check in nvmem_device_{read,write}()to ensure that nvmem core never
passes an invalid number of bytes.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V3-->V4
	* New patch.
---
 drivers/nvmem/core.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d9fd110..db7de33 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1433,10 +1433,21 @@ int nvmem_device_read(struct nvmem_device *nvmem,
 		      size_t bytes, void *buf)
 {
 	int rc;
+	size_t new_bytes;
 
 	if (!nvmem)
 		return -EINVAL;
 
+	/* Stop the user from reading */
+	if ((offset >= nvmem->size) || (bytes == 0))
+		return 0;
+
+	if (unlikely(check_add_overflow(bytes, offset, &new_bytes)))
+		return -EOVERFLOW;
+
+	if (new_bytes > nvmem->size)
+		bytes = nvmem->size - offset;
+
 	rc = nvmem_reg_read(nvmem, offset, buf, bytes);
 
 	if (rc)
@@ -1461,16 +1472,29 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 		       size_t bytes, void *buf)
 {
 	int rc;
+	size_t new_bytes;
 
 	if (!nvmem)
 		return -EINVAL;
 
+	/* Stop the user from writing */
+	if (offset >= nvmem->size)
+		return -ENOSPC;
+
+	if (bytes == 0)
+		return 0;
+
+	if (unlikely(check_add_overflow(bytes, offset, &new_bytes)))
+		return -EOVERFLOW;
+
+	if (new_bytes > nvmem->size)
+		bytes = nvmem->size - offset;
+
 	rc = nvmem_reg_write(nvmem, offset, buf, bytes);
 
 	if (rc)
 		return rc;
 
-
 	return bytes;
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
-- 
2.7.4
