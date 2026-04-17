Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EB61B4156
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434599; cv=none; b=XI2MgRsBXwFYKnZk7AKglbeYfSTcbVLMuf0hQp8D872w7+qoYbiFq4DOl1ztxtmEhCTff+Ef7k7sJXTszvNIkwYbw4PnuJWFZb3g7pxNKFvtFFQLFQ3Nw93btyD/GnBK56ZqoA1SNh4TOubb2//US3l2hCBdkzEnFfK2nGnSU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434599; c=relaxed/simple;
	bh=lodqL3LhlAufdgkDxZCM/kp/P6f0G2hXS8vCjh8WV+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyMAZj1PyCSj0RXxV5RKJt3fQfauNaUterHLvxiWn7upVavPNZOCZt1erK/6nS8+puPCJANsth7s/gbysNXRk35q69lAWI1WhYI0KdmtcvfhtQsCEaYgEGpWD+BAmZRBYmlwOmNc204ptiD16mrvw+fFH3y11NHAh8yoNkAEYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 80k0bXSqSW+9rIoBkWeGQw==
X-CSE-MsgGUID: G2QPDk8mRdafwUHsb5VC8Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Apr 2026 23:03:11 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 660D44002943;
	Fri, 17 Apr 2026 23:03:08 +0900 (JST)
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
Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Date: Fri, 17 Apr 2026 10:02:31 -0400
Message-ID: <20260417140231.3972749-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of error, we should unwind correctly.

Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")
Suggested-by: Pavel Machek <pavel@nabladev.com>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 29f2b7d24fe5..92ea26ce723f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1476,8 +1476,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
 					       &dsi->dcs_buf_phys, GFP_KERNEL);
-	if (!dsi->dcs_buf_virt)
-		return -ENOMEM;
+	if (!dsi->dcs_buf_virt) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
 
 	return 0;
 
-- 
2.52.0

