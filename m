Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377A530DF4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869423; cv=none; b=UkITI6CH/lKEhvuCQCR1SURFkhgI/UvWFNnVoyTzRfnYJSPkuuVG+5yz16sefHFxFvr+61b0PzKcV5u91RopsxeUOdzxA2T8CknEK4sjBfGMHvKYbnP99vD5M4JQqv8FTMDg0BLtIK+wfT827i1/3egqezyDiXT8O5DII1Y4isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869423; c=relaxed/simple;
	bh=i2Pu2bhitzIKmoRXzlWVEt4jV7n7U1Q5xSwU05dDwnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMz0EDfb31CxQVxXc3qV7Ferw6C22NMuckbfuGNlDfNS/Amg+vtCbAFOiefW7m6psCmiHdH0xm+EOJAXD+w22YxTq5rgWdnB6kpB5DuB4zJa+Qf/Vwb/XlEoiRAF0lQ/Vy0g7GlXzoZuhTdfXt4/YF33QTntZqKcGG8r0PD5S/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlobfpJO; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlobfpJO"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so2323246f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869418; x=1791474218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpnrHDatBBFHtfVjVlugEI4PNHxxMFVaxAfJQqfGtK0=;
        b=QlobfpJOQRwgST3KTN0TCpaLJne+F4r7GEMy5RM1N8pLpy9mWRS7A65HgDVmcy5yAQ
         +vDMfP3/TzmUbU+yzQNovtQ+iZChhKA9YiKBY5BVJkbmvvyipsd09JujNJ7AaIA5bZnt
         7vZJi65rxbqU7oT1bXQPe7+eJaf/8hqWMLMtaeWTg7GDRylJspNywgDB3kvshy6e3RZf
         0HQBKp/yKb9gAm99UPYwrKse/wl/quJ2B+4kDf5wuXhkkP9qKmqguA/lLMMUdpFpDXDk
         fLfjx+esrKebiwIkMVKQoKVEqTpruJaF9DgSlNksAxTVN/7vOHonKBI7cwG/Smrtrv0z
         UTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869418; x=1791474218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpnrHDatBBFHtfVjVlugEI4PNHxxMFVaxAfJQqfGtK0=;
        b=fxzC97zzP74G7Db5+SkE6iezjv5pzYfOyMaFy2oS7VfGTtVtSaQOIchZaPNFCiKg3f
         oJ1ZTYbVH81Wi+4dG6CbMbUZhziKvS/ooI+RXowY241nxL1kuC5aR0S/T/BIlZ6L+M6F
         VeOFfY6BZKjuJEZOGxu53areCzTBXFKeXeDdFO5ASf1pzPjAscFpxqHrvJGlDLnqD7hT
         we38K0CxotvFqNREs3SL6I56+HU9dO0G93o/QdIiTq6pvnuvFFVUPT4b2BwLYMTfa0tP
         53gmtnTZhEbwyDovExxgaxiHMtsNXGqL52n3nepOMCrRDX5kNEaPIrAs0iOjCQdoJpTm
         1Ykg==
X-Gm-Message-State: AFuF++l2zzU9fgDejdeIxbAW8LxTglkrNoggMueC14HtvKaaSJB5PsIv
	lp1oSfXZA6Ak8J456WHtudcqwQBPs1RCagisLpjvCBG1A8lQ70T2gVsV
X-Gm-Gg: AYBFou0kRRHX7BeNCZ+igCBudjwQYqSQKUjgxmlfG4VZTKNhQlUXGBuCAbcBD3IikQy
	vlVUBp/nHXV2DO16ONpYW+463nbIznVOw2Ih9IhkDCdpRhdjj6mBEcp/njxtPoO88YRdNB+2gB7
	FWWg/QHT3hrxb+uOBDUsfi16hgMJNixd+ILmp/L39yDpQ+HLAyXLR0EfYDHY+Yw+/wMi212cHoi
	jaO06ayxLe0UhaJheSU0FIvHsfy6UJf0WdzzSNfZos/bbXrtErdSGNvhDeLpvoxUAreNe4DC4QZ
	Qyeg9LTMiC/m5OgmYhwnNdyriJB9dd5DJZDxMbUuFwf6XJxxsKM6dmjuoPGNKkWJRdNcQD2T8w3
	OtBF2eUcvRLpU4LnKZNIyd9qF/1XKC5mqxW4oWuEirf17YC4/SXKt5NVT6pGoyYm3cuIrtTt4KY
	iRnRTBIEnhemckddazHY9uQkxKtVLhdfp1IHV45/c9mbBIOuVO5b2JCf+MDvFYTtKfjrd6K1moR
	TwHvmDuThuF/XV6gCxEkIsWuOqYapsgJhB7uwFLfQ+7UFtGi+7xsZxzhIxkpK+v6wYcIqWyHyy0
	OhEBGVbm
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr715025e9.3.1790869418439;
        Thu, 01 Oct 2026 08:43:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 05/12] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Thu,  1 Oct 2026 16:43:18 +0100
Message-ID: <20261001154326.754314-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional reset control to the RZN1 A5PSW driver.
Obtain the reset line using
devm_reset_control_get_optional_exclusive_deasserted() during probe
to ensure that the Ethernet switch (ETHSW) block is properly released
from reset before initialization.

This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
SoCs, where the ETHSW IP block is connected to a dedicated reset line
that must be controlled by software.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- Added RB tags
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 85ff1fd2bbfb..9daa5d8245df 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1207,6 +1208,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1243,6 +1245,12 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
-- 
2.55.0

