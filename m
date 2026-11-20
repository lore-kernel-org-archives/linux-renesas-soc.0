Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134367;
	b=E7gnFws7Ap1iI2X2jNQ08cYe7ARu4EOBAIagRfJajPGmlo4DJnLa2wWXRcXvtxUUkC5/
	 o5TTKxEUh8s3KJAhBDYJ7/Imyogfce55qmaNoooGwFussNIxTjyERWZqV7NS0PIw8sGRV
	 dIcqoWze1ibRJNoGN9fwkcmyOaPloeIJ12W9yAs/oV7bEc3XKsKLweQCtYCACIl4xTcFb
	 9YmrWi1dk6A5YKHNP8ysMxPhtuJFQWlgz5qRfcOG7NbPnSPcmALHVjpZ5FZlLLTeOqI7F
	 CYHZbggMCPRWkOgJ1cvUC3Hbu8PeODJf5c7IolAZtqUBoa+TkNJhzAHQk+A6lq3y1WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
	b=Lx+3178e8nvyWeaOmD29o87lxhpHcxExYlOSLtVbf37aPr2uk24an3Tjyao2LZZDqef+
	 V+iV+IXDgvizOMnUqQZWLjmlscMaPqi9UR2hglIsmNB7FjdgGsSJLwLSgl9lUds0AcFhi
	 jiYILrbbjNzibWmgy3FdtS4iavlfw3wfJXQCxmJE5my78Ofe9FplaM7LONOqQzqnjvk+8
	 /FTj5O72SaeuOWDyB9FrbV4S9mxik7lk5Vrs0xonx/zGMlnC/bRxWgIS9T+REtHCB1rYg
	 DccAAzY30AURuhASXRlOfjOs/cGiv/x2eoKAs2+4Sap7q8/37PvN3MQyAsSKqS1RoUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c1/lJeXY";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98460A262A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F98460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1/lJeXY
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so152727f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134365; x=1795739165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=c1/lJeXYfyNE2K3mEiwl/l7Yj7IbiGYMfpNMgvgbqXUdTJn4kxBtiQoMR5f2ozmmCZ
         40VxkQcvw6bbknmW2IwtiiuaQRr/8hF1vYjlJiUiLQT9kPXB5Tt8P5NSYgtR+Ws+IKtx
         9w7xwISfdD6COXRGf6yrUSxImXSfM1fsC00jslz+2WpJoYUS7oT0f2z2steZkF1Q8KrO
         L4ATZ7DT69+Rvr+9YpTG0HUSy94YDCM2YkjLcMt8brxObISTuKUprfhT5BS9cjP05NnF
         9rLlvfHZVlPctKv3KcMtLzzQXXblyVICKPqtOHHl0opvS8X+qCm/+sGdwQ51N4NIvD4l
         wqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134365; x=1795739165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=rawhulY+NL9Rh+6R6n2vEO8FlJgVFK07DdEQQRqK8WQIvU11XVqBnn2vOHiRsGKZuV
         aiQVdvel2705DKc1mWBVDYPWPsLNawN1nTiJEDkjDip2Je3K3VzJvH/4Udc6diwzDVI1
         Q9rHLyJCj99J8fwAbDogEc0qulOjeWXGBfkW31uldRdmNAiV8nPW4qu/pQao7yraq5d9
         2vNsZEfC5pcz4uu3pp5/7Kt24pS7S+IGZmo7yqADj3CUcAEmpZWimUq6jSoNmbKoz/e3
         q/WJS8K3lm6kyC6AaEsx5ikbBrosHUAoaicP7spV9rAse8eazVqbjvONQz4c6bHhROFQ
         BJ8w==
X-Forwarded-Encrypted: i=1; AL+hErFeuLExwL8R/B8adjI7Ww86ZGHKOrYi+QEGxdMVnL6+yBrWeyb1EAvTG34My9ciZjkVGfUdWyPvHt6gkAzk+dGAlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Db4LP5wae1xm1C++NGb8BcouUvmmYFYjlyUzv0MAqGz7Wmcc
	aYHiXMao5yyy+IJTcAneHJ90R/0GUFtDaKSaJWk6/2Nsv+m9FMrD7DhLMfWkGfskRXU=
X-Gm-Gg: AZFdTZfW5Pg/uvycf0BI50mA8y0kKl2En56ASzgYcMP7E85M3oRtt1hcidN/etYxvEl
	DI7a3Ru6Oo/U0HYMIumE+AuLfO8OtwKT2OOPntI25MQGOHE9zHjZ2vSdLplMcjcNTj+vXfqyjKv
	PqdaPaNSvzavqrpyBI6NvDI9iU35RrgSNLTVMLhYNwcniIlAHVsZ9KSpi+KjMgucpl4ARoPTl/x
	Yz6IYWpLDFNFACsQJz+q2UjfK+RDY9vWg4+U/h8UNG38rXJLRBeX4MNb6ODyh1dufb2FieXHXDx
	whkSiZGeh3XVm542S67ma0RAytTTgqVFee3Kj6rabOMZiO6qWdOxkrVslb8/w5vMD9wSDLnnY72
	RVzPM/++gfS5Gqs7citBXWT0TAY5Sf8L50EClL7lGqUY36V7uw2ZAbvceyZtoqd41P3xuNzN7Ge
	DPSRf5kheCByDgS6w9iKrwBmIxTyFLPJ3fDQ1YGyxhSamfIA/6kPlw+EbdlZa7gi/2gSjmCh4Tz
	GtwJrtSIIqRdtW/xum3fk36Ze0MumvTsVUnnRZVElXnrizVwxLFktypxdcPJlzDcn+uNQgKvRHj
	kYdXLXh+PILZUPwZFFsAtKIHc455izOYxwkMycHy9ocUBOWV/1yLxh8Vvf7YPyufK3e70It69ui
	xOYvMY6SrJTB29Fmx0/alY7JKrifXqozJkLBdv9VCJn73RFasfXMZcqPy9Ti0mBCdUTWg6vs/
X-Received: by 2002:a05:6000:310a:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4abb5eabd3dmr2184216f8f.53.1795134365379;
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Fri, 20 Nov 2026 00:25:22 +0000
Message-ID: <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- No change

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
index 0e4bbf34ec27..669dc584e6f7 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1212,6 +1213,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1249,6 +1251,12 @@ static int a5psw_probe(struct platform_device *pdev)
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
2.56.1

