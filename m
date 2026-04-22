Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9797A310620
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869855; cv=none; b=HA7DXYIRBuTZzzz0609ShNCBFA/52S5y4A6AzSwXl8HqtQInE0iKg+QAJCLu8H2qu3AOfQRfW6nUCIjLdLxDpOqg+HinVmg4AKBSlQaF2KuJuw6tbCdSgEgT3/GYj5kXAtmg0oBDHJsKE8d+5LIOA6XhUiIoL0qLqjJXhMj+cz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869855; c=relaxed/simple;
	bh=MOqQ4RGPe/v/5IFnz5O3La74tJ6DfA9DNlzTVXGx+Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1leJre6QnJuO0dtMWOKvaD3rGTVrE/uqrNUpprQ5F1gLTEwK3IZDNlGVpCeQOtKm/azDWuDAxBbQiJzgkIK7rTb1ibtaHv7VPYl37i7cZeXzLhfKtN8qKRHXP42C5lKdUj/o+Sg/To7pwNGZ0mOyJrpjEPyvXwxwem8jXJfxw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: ptICCgFaQaKV9hrs6FemJQ==
X-CSE-MsgGUID: Tzu1+mgJSmOWSetomb9haQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Apr 2026 23:52:24 +0900
Received: from lenovo-p330 (unknown [132.158.152.97])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 712E241ABE38;
	Wed, 22 Apr 2026 23:52:21 +0900 (JST)
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
	Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Date: Wed, 22 Apr 2026 10:51:46 -0400
Message-ID: <20260422145146.1638998-1-chris.brandt@renesas.com>
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
Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

---
V1->V2:
 - Need to take into account mipi_dsi_host_register was already called (Geert)
 - Switch to using dmam_alloc_coherent to automate unwinding (Chris)
 - Added Acked-by (Hugo)
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

