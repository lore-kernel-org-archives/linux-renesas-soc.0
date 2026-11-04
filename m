Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816481;
	b=tX4cJiwJfTSDCRQTychq12N59KgT7ORfTrTRMuNHGjJ0HRB8u1JBjV+FrfBjA3wp8KHZ
	 atlPRc+OfBRNvxXVGJLL5T4i1xARti3C6yjiNL3mC3fAC3uXo0vJ3FRq8SfKwRhYG3/d6
	 noDX0Tkbeirn5l45TNuw5eWgyD207duw43BpdbVlLS1J1SHhVG0RlBzSXImMO9WC2IsEY
	 sv8kHU5OdLTMJ9PjB1M1XMj2+SwjEDB4oZVaSOJIFkyKFBaDgu29w0YzAxkhTFxZjuQD6
	 jbiOTysABTC6K1mO8CwM2YAdC64MbghCynFTOQDftcg57KeiqD3wVhxf4tGswmGIUUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
	b=OHx6yLWkpiSL779QyHJYt4sxoj5kf3D+faJMlLQxGEffxuKybQrnu/vfRcwqB72YwLtI
	 fUCNEOzZviJmxwHRw1aq1klXuNKQ9wvaDaaLwqKlzkE6IOCknJrqTNsP1wGJefEN+fW7y
	 Je0KD76tlTtpKzXl+jwhR6P9Odrv3dM3cYSUKf0ThYfN5VwOEnEtR8bM7slTYAwf+nENQ
	 TS8e3pTPIaqq9mNN6uH+0QK0ckhwawF7HFa7PIvlT/Cp5rHr0orLoDtrIqqCVlKW0hBsJ
	 QMK2XM71h6Cj73IkkhoYI+z7Zvm4RqJVGqFO9oHMGyeZzy5B/Rifxyj9xmlCxQpQS/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7516083606
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7516083606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c45111bebso506481f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816479; x=1794421279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=rgYBPg+z8aTcOOqgqb2NigaNQAKH/UEO51ZtpRUUUQlGUwVBl9l7W1aggtunfwT//8
         h045sPyhYjb6sBMTREFpCPj3YMH2FxuBbJS9skFQpqeZeIINduFNJD135vC9sSerjMdh
         FCOoHuGdVfF0NikfDmR1G97i7H4TJKaB028BznSDF10dhnovHyZu0mOQTNhVAvc3woZJ
         gPtbxLjZ+4FyAJarICpUFq22ZSEu2VzoaGfoIGYwQeGB/nB1x5shbEDZQ2WZwrC8zRnb
         1LYLI1piVZYRcIhO/LJ1Q6Am9+tII3CWRI05YX5KRvqdhbjs1Zv5AyOwTkupSYKkdLrS
         2MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816479; x=1794421279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=ceSBZFQpME6dFLs4Y0PqmldGhNYtPBOCVsQ4HPZ8uab0x7KOqsW0yRs0nwEsLWsCPg
         ik0URV1MqBUeEMj6dMcPdl7HyAo9lW4u/9WwVlL6u9EbUXe6qdcyjPRqENW0aiy82SUm
         HtJRZBrX4SblGl0H8zcd5SlF1gKiD4C/3UrppfkoU5JZvHn9wcE1LXwCgaAuAyv3dTkK
         kCUyLbb6IJxAwTyd0u10r2lCiGdULRzIvz8AgK6k7lbQDqLdco2QJlRPw6F0nsRrgIeB
         /GXawYXQ/eC4gaBQfgfcK0PBJ9yK67InlHhXlDUeUTWqpKnunPrLNYOSY+rNNtng7nXy
         cYNA==
X-Gm-Message-State: APuU4Z+e2SEzcRR1w8mYtVnWWUNKF59ZjIcrT98UEr6SdVJ3eFKlaN+3
	oDtrt72nh0KmAKtEYCMYxOKpUwrF6qUE7S4W4rD/Mso/aNdgbQ/D3I7O
X-Gm-Gg: AYBFou3uUoYkfGWfDFYOraniPi8X4lvLZT3C6ov+0HipwrdRTk7AbU+/CgP7lYBemkl
	Yw/NTqOEjKiL8Z0tb6lHIXAV1o6KaR3hCt+A1aaSeXzIAKXuYYwTS1cJzTrjMB3i0EM7cl+8gza
	9KwZD5e3EGqh59P451X5CwETaOFUHBXXPXmOUrXeFdhxBf8N26ssy0GJJH2dvuV3ZFrlLoFrfJU
	Pkg5ftlQnsx0JPIVKMghIzuGggRabJC/IsPyFJZKYTZONZ5ewNoebv9yaDMmo0GsdzsTW/yeInI
	qlpTtRCpteI6AWrRozs2PZ46TVI14MW2KzijwwJsd/VaXCwbS1CT9uYXoGdIXrChdNExPxOG6jk
	zE5QIyKEMy6OxkHcxJ0pbShMhga/CpWbKUnTItHInLqDgmRFwPTUZHenqW8cUXxMjhtM8p91fDY
	fhmZpL4FCHSyFXaMBb7O9FtsYwjRzv29AmuycwWoxFHVFe52lD4dthU9rk0DVO8/ABH9tpBtBiz
	tQ/h+8wtI6zsNSPK65k5vy2dXDydGjOWlArgNAfF1kx5Ynj+/CEc/47Z6ezHk9pOrZf3BgVl/7Y
	ilnoS8CrlpyGrVUMZ8RZH/CptXAI2n53f5InBtP8Ka8Ifjk5pqTpy08pJy+EiWg2yaX+UxU/5xf
	NrZvnTCjtHtyZ+mRN6QqL5HNkz+ap1Bsoetaa9w==
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e6e511219mr37783890f8f.45.1793816478980;
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 07/14] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Wed,  4 Nov 2026 18:20:55 +0000
Message-ID: <20261104182105.1102555-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
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
v3->v4:
- No change

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
2.56.0

