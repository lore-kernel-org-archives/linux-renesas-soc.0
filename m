Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7381E51E0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777642065; cv=none; b=elSMpaiNWxkmlT3N/MVNatGiuH6qzqXfXCxcunfzwejnyA4/mVe31VE9hy22Uo9r91FctJH7WKe9Ubi0XcV/8TMrCf8tZ4gOJRRZP0fztglqdD0S9KpYIb+Dtac/rTm0ZJ6IbbWuq4A82/21bkZP5QIWnDNRNLnI04VcW85pZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777642065; c=relaxed/simple;
	bh=kQSNSYmTMlz+OH2SiR6PgIlLNI9GbnqTynjJVEQtLDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Os9Nr2+l8KvalMiVT3IVgC9eIvDcP99ie3vKpjxio0ypdXdWK2C/8aY+o6ixovkHJhVnyhELnTS/MJJlOwKUHx93BGTtP/E6Sbk/Y4F5LpO9T+rjmE7zk9ZZJabqiRKpQgw0b9crXc41WBRowpTsl8II8sJLZSEzWEUuwxBAxEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: RP04hyrcSWuI7wUa81c4kw==
X-CSE-MsgGUID: IXuloCCoSOG+CRWjGoHmVg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 May 2026 22:22:34 +0900
Received: from lenovo-p330 (unknown [132.158.152.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B72394007208;
	Fri,  1 May 2026 22:22:31 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pavel Machek <pavel@nabladev.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Date: Fri,  1 May 2026 09:21:35 -0400
Message-ID: <20260501132135.196701-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of error, we should unwind correctly.
Switching to using dmam_ instead of dma_ and moving the code earlier
fixes the issue.

Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")
Suggested-by: Pavel Machek <pavel@nabladev.com>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

---
V2->V3:
 - Removed Acked-by because it was for V1 (Hugo)
 - Added Reviewed-by (Biju)

V1->V2:
 - Need to take into account mipi_dsi_host_register was already called (Geert)
 - Switch to using dmam_alloc_coherent to automate unwinding (Chris)
 - Added Acked-by (hugo)
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 29f2b7d24fe5..b908e702b607 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1442,6 +1442,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
 				     "failed to get prst\n");
 
+	dsi->dcs_buf_virt = dmam_alloc_coherent(dsi->dev, RZG2L_DCS_BUF_SIZE,
+						&dsi->dcs_buf_phys, GFP_KERNEL);
+	if (!dsi->dcs_buf_virt)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, dsi);
 
 	pm_runtime_enable(dsi->dev);
@@ -1474,11 +1479,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm_disable;
 
-	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
-					       &dsi->dcs_buf_phys, GFP_KERNEL);
-	if (!dsi->dcs_buf_virt)
-		return -ENOMEM;
-
 	return 0;
 
 err_phy:
@@ -1493,8 +1493,6 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
-	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
-			  dsi->dcs_buf_phys);
 	mipi_dsi_host_unregister(&dsi->host);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.52.0

