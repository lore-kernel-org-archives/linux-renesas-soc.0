Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134359;
	b=So/O1tlxlcAdhmj98TkJZ0M6Vw65i/z/4AzZdH9+e4s2h9dL8T0VFFYdXsdO9R9abh7D
	 IghYr7sAr1/PSFapJzG2C5uFSGbh/I1PdUy4zi1eKFHWWNv3hi/z1Woe6xr4Z2JJ4+YK6
	 iE+3r6L8MQRQ88PWpWo3aD8eouNzz/RG5DVeD4v6MdDhhQMp5rqA5DQOSpwCYbjTFVZk8
	 3vcBGYXf2anwrslyhq2u1JpeI2+q2u5wt0TJvbC1p3V6ueqGGJ1SGTWudlqpi8Ws/rxlU
	 3rn1gEx5FO9xZGm92xlcTB2XdLUSMdN/9eNMk6TC2SPqLbrryySYBeSSubb9Fmmd7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
	b=D70tT36Jj5DxjPYIeT5H+3wneT13ijD9x5H8jPbqJ/ck3E1xPgsgs+6D31VQ/AOfvcRc
	 HsXXw6yQ1Hr1wA/WW7rmSpKtREobiIgdQQzv9YH1lCMVfJjGk0iIEbDHud8qL8HOcRVyT
	 3HU3KjsGQiPkkHLPJ93G1nGtK7bki/VFy8LB46xqacTPIwmaBrajlMMpaUC8TV1CuzG4X
	 nHXXHKh9aWk8J6r0uIZ1KYvhcAzcW40ChSKgkbyTs/dAH4pSBTVr+OxLCBZvEHJp2jjT4
	 LbODk3INATZ6LeTDT+yIXax9FAbJ/7Vk0R4YiuMPWaq1YH1jQR80T2Cr3EwO3o0GQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED929606A330
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED929606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so152662f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134357; x=1795739157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=Y+68JXiwd/j08nP+pIDYDnrw+BUax68CSMjbEUagvJEJ1zGW2O7NTGBVo22nVZVbcd
         kjPzUA+KXrlyPpF0QX0Kd4xaVh/It/jnKEcSbZ5yP7HFEwEPf1io5L7Piply6x5s4TEn
         0AEFaNip/3lk3KPAkrxqE4U5kju9s3r/QvZ/ViR8/KM6Zx5IapY9LGd4bjCC5AMEgVpB
         TaJyZNVj1RrHswqWcyaPCyYCqDOz8UxjHM3rMAC85EHFmtKsaN2pOS2BLUmXPMK/7Km7
         1bLbV8WaxLIl1E0p5vaLuqA7GItq1UWIYfiZQcsbRSgP3fIdi3yPNl1paaDacZqJjGgk
         0LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134357; x=1795739157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=J5vFRiy5n6KuWTf7rYi5h92cPoLWuWnKBIHHZ0cXPNK4Y3BUz2LjJguKxwxQj2G4oj
         ZLSqg/rmlXO2zImGyf4wDrZEm2eQ0HyDZGhKvnadehy8Ne7ZWKCUbDKgeBq5HUIS3itn
         TZFsN2AkEV89PDTWX/IwdUJG6YcZxifN+jMTEHgUVYG4JByjlaost2pigeKv7rcOlAVB
         TadR8pZHBcH+BT5P6gX8PxIjT+d9BtItEr96cZWg7nuY8Sq62WmzbjQ6EcAvsNjbCczA
         F6FHVmK2fA6f3ca/9pqCghoJncVrMRUT2rprlpwY2i3a4vbZuil7zFAepvk5u9vxMvTu
         vsNw==
X-Forwarded-Encrypted: i=1; AL+hErHdVLixl4nG/jVqH9Byo+Ojm1t5p30ewCokvthy1VVyScjwX4NdzmBvgkVM1/mqIYohO2IYz18EW+myoeE1P/iNdg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+suZi8PGXvqde2780JisrJo5ya+Gls4XfwopOps8KYq+TSayPi
	rfDZbC/68iy4qj/M1ht/QIM3okOz38x4hMXpjV0CI+kr9BALO9m2CtuI
X-Gm-Gg: AZFdTZeGYDVs1mPFlUBiebBtmrW4EvUrIpBsJfcPrG5FEunCLin0uQw+u9sWfKKpc1f
	wz4duM3ckHV2v1HkWi+mPr0w7eFiQfB6i4irETJA3H25Ma5xtT9Ql1NzmUeoIKuE/x5VMUxZlHq
	bG/jS3vZt6pdGTH3gPmir4uZRirx8Oc7ml7zpq8He22QjLgcjnlplcCj5pPlB8usS7NmuD5DvFa
	feu3moXF71v2KNWdgMkeGhZHCxptvN4tu3bbpM3CzH4LrwJQN0EfZyjvfSydNH9Y7vOq3o+mBNC
	gG3VNXbqphKDzfWAqo8vBhpJscxOz4CdGFN7GHB9Jy64Z503fMJIk27b5QwIhGEm1phE20XBn1h
	P1PMzhDwoa90QVKA1LC+ZtwHKLD9GnrunBqhJv02cjqHabiLTpFGXK06H3DSZRjwh0A307Gd3tW
	JPbU9hhaS9bbolwzzE3GgEhwAb3gfu0iTDGrd+vcTgX7wg41U1CuWhFNBRJkUVIZOdUalEyXRMA
	WEn3VNK9yVlDhiyf14AZE6pXh0597D+OXlrsSolwG92T7EMGNQgBcP402PDwRnOJ/fyx0a/ZmvL
	sw97tdF1g2nuaN42hlDA3Ccvflko7nUETmyBQ3jPvyVa82mCLYopDpr3z3bJdidTWubXHIPKXWp
	cTRd37vrkMEEW3RuK44RMoViwf5oNntQAlQteCE/I6bapdp6P27letz9+flW/gk5Jaf1to+aO
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr2180361f8f.24.1795134357345;
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
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
Subject: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Fri, 20 Nov 2026 00:25:13 +0000
Message-ID: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
---
 net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index bdeb60af764b..3c18314aee95 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
 	help
-	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Say Y or M if you want to enable frame tagging support for embedded
+	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
+	  SoCs. These switches use an 8-byte tag located after the destination
+	  MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.56.1

