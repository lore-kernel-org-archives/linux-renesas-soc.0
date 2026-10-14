Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555E518143
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983966; cv=none; b=Yq3Q5P70Fg4hInXNEL4gzaBxxGqMOmt1WKhGS+vBuYBMNO5OXJCIjK6MFVzUHWDvgKD7R135yHAjpeGFMOBV9Z8ztcHVbcXvoTaESF0+ZGEzcdRAuEjwTycDIec1+aKSWhLGGe7I+CMcEdu82WoTPcTk4K3SrH9PN5g3/VwEuFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983966; c=relaxed/simple;
	bh=72d90yhMR7zvlx4slqrApPHMIYhQCIbSVcuz4SGzlnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Driw1XuhIbJBrQZSZcC8o9gEFXFqdCTgT/2i7j6lybOzQKnQ/kWxkGTkuEEBv+U90yYGZL88C/JF1cukof8HT8hAw3IazRGrHVcYC8knYcWKPy9913pN5EU3zwdQJGOjBXla+jlgzlqxK/LE1ddrImJKH7rlEVf4jv5lEJZWkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+ljriTw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+ljriTw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c45111bebso2512348f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 06:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983958; x=1792588758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6lLXTa/SKFT9KPAPo/wyEXB3uGjQ/WLunzHDdy9awk=;
        b=j+ljriTwTtWn8QMYmpX7PTRLCTpz7WzfvG6NEEZH+KT5ozz8mU7Flk224ZVSP+bbNl
         pNnNSMaPGSDzD8FDlkYuObb1f4sGRiMbsIhX9Au/zns4J5qfk+CWEcRci1sDKHBDQlgy
         RrggnkVCMgbhQwnO9zEGJI1ChJ2x26A2rxRYo++e38H7OlgUvqMXOyqm2nMuz+ch+uQ9
         92oEUi6LA91EsMpfEiM2aR4gOD0T7Xrgd67EqX0FE8E0/7kE4I5SG7EiVctgx8RFJjZw
         UkpsQ+Pu0DR4N7MXSNbbuT0Dk9s5K00HlwVJ+z7SuzwAocxlvFVDZiTNHy09zgIpHFVN
         7CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983958; x=1792588758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6lLXTa/SKFT9KPAPo/wyEXB3uGjQ/WLunzHDdy9awk=;
        b=hPXU562T5lCu1KKd0Nr4SJXsH/pxw5o5NJvrlIoekMyXIDDHg+BBosFuRML2+y5JzZ
         eh2D37Ds71xpIVF4qL/LCM4E++8IwmwoKcfcVQFGIruaqbNsgyfOaKDlu6kPgS8DUAGD
         1YvT4kNJQBzncaBgINm/Bj9zVb7UfPwUV1vdgL6mP0yXP6cJQRONH8Um89GcKySywp4j
         ImOMkrgRG/OWclC0z/rBzEgtU4kHYPMytdvnFoxbA+1azSLLcDm5l/7y6+M2EsRg/rRb
         Altzj/dxgPfKl9KtPuXyVknDs69HszhsfqXM6zI3CT3hy9Vz5YWczd9YvmwS70hu5IeW
         Fwwg==
X-Gm-Message-State: AFq9FYLzfMsI3eV0xLfPoaV58B7Xmm4umkodZtP3d65FdW7t+6pWImB6
	pY+qn70p36S/yET6sXd/eYPAhsBcSmltv3YDSaVU/sGKPKTmO3KjKzoc
X-Gm-Gg: AYBFou2Jxb/s5AyhXRlajTa+TbX3+jrDdUDy7Twftl+etEbOEd5oDUd4sO7I6RuqUOM
	eivB2nuXZutfhn0ic3sCtaPlYEFYz/roRPjzD6SfMU3bti2liccWch4z6HGJUZuMjMnWFjW7w07
	JF7G6DU/u44Hv5HnIbpGu66YLkUDx/YWHmhq+LGHZQAD4CRppDP0rQmAuUe3+Xw3gcWUtukDRBk
	8eN4K/VFs5Sia4CEL/BBNd0J2dgzX90dQQfH3tcj3pA6a05cvNvxEWWr+Kqhd+baLgxJXq0+IJy
	zyYz/o4FOizkQPurANchkp5abTQqFPzptrMH8larNdRrOwXY4CVyt8wO6ewIkiwiu+P7M1UH51F
	hANaTHQvn+1k+yF6/K+nGfbu3UMmJp2o59Jqlz7yOFwnrkY5ndv3dQA67iBo1v9xn209HOBRXoC
	jHgLhHsnzhEEG9C6vqDpIBpCrWfOsDHVIU4D32IIEjHgmvbX94gPldeWpGq6xzWo5QCkg33gi6c
	PtdoayfD4mMX+ovHha007I2zIfaowkq3pi908itYAvd9+zDnmbaPiPHKvNJclk2QiQ5L9Nn9dLY
	uVF0lEIea4Kd2JrhdQ==
X-Received: by 2002:a05:600c:8a0d:20b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a1ac6667f9mr81176745e9.26.1791983957901;
        Wed, 14 Oct 2026 06:19:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v3 06/13] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Wed, 14 Oct 2026 14:18:54 +0100
Message-ID: <20261014131906.990077-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No change

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

