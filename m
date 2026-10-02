Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B04534BB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939837; cv=none; b=uU91KqaDWlpc5deZGHQabCks21IjKBsbHZqW2UdAdb7vyJKBQ+K7T0IlT6V2L3mcgsASehpyxRVYl/iCGQ/bSM/c228dyDBiSY+iwWxSXMDme5hQUwKUNZJpAm1tsDq/hCW+vPxxILBdLlJKYZuHYbOIMzLNai7CjhXVweZEedw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939837; c=relaxed/simple;
	bh=7JTcOd11Q70mBUoiSxBzlvx+nqFlZLWI/SLbM1KRmrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vspm0ZvErUP+DRGBK/tSVOyH1b93yGHDYybYhE+5SyX71O0WmJdCHD6ZEwdaBTqaX4GXaiNPTa5WwuqvxMrsRBW6jPjOQdMJmAH1t+NQ8Jqw4J47V+9nw1fJqZ7FvLgEkkhun/oN8R7cdbnCqzXoKQCYPCg//YSrKiIgYpRdL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY7PdYyI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY7PdYyI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso77558645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939834; x=1791544634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNzEm/cEjquphq5UtLmRVgw/IjJ8/cROs/riqhvq8GM=;
        b=BY7PdYyIsbz/CDINnyXbma3C3o1QKo0ZOoc+nYHSTBQFqf2LWbSGKF96Siy+ApgbzR
         /6GEOBYiamhPpbNhk/kc12GIeto8nMUh6LxvodRRJvJJCG1FhpoMq4qhzEaZ4t28JQPK
         0pvXRC0l/TpUpItsg1eac0b+1GiaTRnNGgUyLQYTgPKiB2E6uP7xNapbi8+xNXSFTJHL
         pCE0zIxaHQvaKnWC5BNlbqzj0p5h9uGfssmmDvSetx2Wly7TBCnkYmDIEdsemPPtdkXH
         OXBOW60GUegVv0fLSAOJR+LmiTFPV+2fjaBilJtzZoU8Xj2LxGv91Yhzc0u8+o4K3QaB
         IE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939834; x=1791544634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNzEm/cEjquphq5UtLmRVgw/IjJ8/cROs/riqhvq8GM=;
        b=K+GKPUtqSqFsY3zUzkZnzZdZbURF+dDtJ5ehULH/JSvXsCnvikf22oJEDjFzbFoWhW
         dcFM7/gAVv/uKAaPfV++GcSPrAnuRu753m72xInVC5TAiFz8gyt5r6hh/fhl0kq2JFzI
         voPjQjBkVyV2lJtYfsi3jDbPkk6LbxORwDRvCwmX29QclvkqdQUdRYLeXXDDw8ZgZ/bx
         HZ1WMi65vcpWVcdwv3jDNIh2uh+Y6KSK5ZtDlASH9TibuyEBpg2/MhkEyLv7DoBaDZhO
         cTA564rirPjCdEQk0+v1NVFujCt9bwdyrDGY8D5u+YEXC165lLzj2syc2tMWzLvq+9As
         nhQg==
X-Forwarded-Encrypted: i=1; AKwUvBxfGTNz1AXQfoZg+KuYSXC3IrvpQRg6eVpfzA1dcXxebiWV+B9P43QbwtpipOVSZ6cEdB7+bgpxas3vKlzUhNWzfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kQYP1acWocpE0u5Ttpo/JZ08+kmjzJgXOyXqHFZLpQ7UPmu1CN
	yt6Vmp8Fcc2n+XTULuYV6oCIFHpW7yFCenutrZSCoCx1BWKWLXv3Ly2W
X-Gm-Gg: AYBFou2wPUDBu3Y41vuEK8qTzIQG0zlLSj9GuZghJzlfEUApEuM7Ol8/kQNBCUtT1Vf
	ghRlsdxuQ50cc3Vye3lp0z1TXiA+cY0NM8wFPce3KzGGN4oH3SJjNTvqTwPiEYYoPvf56Rwn2xD
	w8WlqMoXskwMr0Ug/MI6Ifq2EiRVJTLorJv6+bzTjxerXPq3bc4LZzEwahc4w+U/860jcsELmFr
	fVbJEPwjW5X9SXYay1pNTAWkzg8c9oIVJBNJLuDg+X0mwtKuMScbXNiYFIUHJij0RpPQ/eYJhqp
	Ehm0xWYSrbZ+0UdTmnRnbhI7aQy/Ik5miJyOG+4N85NrBhHhlwbO4Euvzeig4MGCc18v+VF4JJJ
	MFv6HsMB/5ERtv3YQ7/XxY0swfAjL7vJVoDf3BjHJ3iwI8Gw4Xzx0DsJHTfTpFMW0+SgqYxFRXz
	bTMMTLQd35uqQQ8z+W65KGGsAtVX2woYv2ihoykY7hB8/Pz1c9J38Mijow4LLy26QXEBVEgs3Vv
	MyBSFI=
X-Received: by 2002:a05:600c:6089:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a02757a74dmr35745475e9.15.1790939833425;
        Fri, 02 Oct 2026 04:17:13 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Fri,  2 Oct 2026 12:16:58 +0100
Message-ID: <20261002111708.234957-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
References: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
The new struct currently carries a pwrrdy boolean. The probe function
now retrieves this struct via device_get_match_data() and
conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
pwrrdy flag, removing the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated the commit description.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f90fdb7e6ea4..79503f6f4b23 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,10 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +110,15 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +158,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +188,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +207,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
-- 
2.43.0

