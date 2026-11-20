Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134377;
	b=BVOv1AHSGJNxAzxq1eWi7oz8FNdYinjkSS3br7iI6iP8u5nvUmxtvsNXI78Z4d2gDjSt
	 cfB4/JY+exvBsT6Q0PXSgcdW3XRaUVS59bQos4RZ4qcNsiMip9p232kn3y2/SKsunAx+3
	 MVdfoumgkn9ljIXmjUashIUd3IXty4Z6mX01cJu88VbalbFKRc7Q2WHca+0iUso9TZ0pj
	 HVdksC2uLQtmbErNUQTa6ubjomBTD/+UR7GbAuEMC5DBCsyQgqliRjCvHxgl3fhlPY/YO
	 bQPHSAz1y4XomMsUTi7J3jOGySCgF+3nqP5xhwfdPwmkPJTRuBo6rpu2eY3NwmQkAOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
	b=3s8I9vuVAX8ApIRS0gL93P2safrLW7oig9hWzWVuYpv976D8hQFADViOqxp8DrP31c/7
	 j6CA6RLMCkNnscbNpYrUtWXH2GG9JUsh+/P8K+Y2WIXe6g4f85KeFvDYwVtcwhcmb5Mdk
	 mDj0TjNGC8eCZRtAK+IMhRtJnwNJ+hVB0kjzB+ycY+UsISciJaiEcRCAIM2yx2LLxrcoe
	 FNTwJ5bligPPf4yIFVDdAuPJN/u/kwU3e/GxQpP8XtkK0h9SLrAk+fC2l+5T2tPYRyi+I
	 CrPsQw3mBdkq533XoJlDbeZV3F9fE2BMDyjIHNjU843F3+Ms151VfLb3n6aunwM4emw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D0606A94C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B8D0606A94C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtac5sXg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2380605e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134374; x=1795739174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=dtac5sXgErpAGOsIJ3nV+/Ki18CF/Vn6k6uPUkbnq68JDFdPaf2JC+StEQuEtoNmTU
         qXBzphnLagdky6qDTom6O2KOga51GIVfYwWmci7qRuGsX+pMfUYzKppaGl4ZWQvGOSb3
         s7yY+19y/FEp/fwfeVAP95YTucen64JK+wZE5b39avE17HFcQCE00BmO4i9kxT7ysE5D
         6fEL/w6PaHugkxugh1Aj92rGDYgSAclfIxQt9umuBdf57RQuW7mgG8QlvCVZsOKrR4+E
         AYa5dYFrNt8q+9QrRU7TRbDAqPn5lGrmuHL33XcOEX7rPR93p2Fnj326DiB0VeSEyg+P
         05Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134374; x=1795739174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bL+lHPNXWqqyhS34rWZtGwllKD/FnXm+N4qzzKhnwjU=;
        b=G5F80PHM2rkEqyZfdH0EbPYUdeVmacLq3IpAgVfEsXRqLcVtqBHcupia5XN2VCasCu
         WKQP1+5BYo6WxgqT9gPXZUx3Cq1dl4F9IPP/o2+VWkl4Jx6aCD2h9KfkKN25sALiwM1o
         TFzsPe/pcebYZT05M65sob53o7t3oY090IZHxzOSILJgGAd0h/7wOukEcGR3sDJ1akrg
         jl2JY/ON64or2b3mWH3nEy1HCPgoxJMTPPjFevpCzyH8erpmQz3trBxGtJZywK0q2JfY
         UqFpKHn/WAxgHyNNHHSDXSHQu75cKBTXONTLClabW8PY+vqzk6M5ViIv3UgSghxaKWCJ
         rF9w==
X-Forwarded-Encrypted: i=1; AL+hErEEP/GfnBjdk3YOl1C4Z5r5xhhijoFvNtp9c4ZCEfupR6N/4JiQKqItIN9Lo84Pu1NwySjBXlqQ+xPGg6HRnBAW2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JV1Qh0ACa+VH0kSH2VguBjvHRj9ilyhJFemC2+WBYTe3Dd9WN
	G3Na3m1Gb9/5+rL/YwQ7/dLTBH2GxPJ+LGgguv1PDgZKgPadAgjOu64x
X-Gm-Gg: AYBFou1lyAvqOHMusMIe6KaExoaGMVmMo+nTdOQbjPgGorgR2KOVtCPuW7q1edmH5zV
	jwKU1wZOPqacH6ub1I6IgH4WiXSxCo8ARcuOsOxSKlXTXcwnhlUXMkx5uFAAhuRtE+/9SXqLIpR
	fh072W7eG2F6k3aBwvLv7HxE1cAhf9N8hqEAHt1GhbplthszZRrUTuWEfgWXXcqBvDSoox39QvS
	BwwgKzRP3nTl586fAB/tOxrNjzLossxZ87u2RlQ9lBbMh+O7eKJC42M8fV5fZZlxvdcqeF6bA0F
	GYpOliMviDyizPZyHYEQluA2YP0HvX1z3fBYUKuEDp7wnHpPIefJW9cTtUZc1JnllWmRRGMYXdD
	vL5HMe153h9s3UK8An6M4IGx4qQvxMD+d9GS1Za234z12c7dm3Tm7HsrDV2lmcldr9RbJTavymi
	uNUAc+INpBGRKvrT0ijqwMdcau7Pw59RB0v4vwgB73qQKi6so2qWqyASDKYSWNZSVscsiFYmG14
	1fpqVNX2KQFnWqkWTY52sKuHJjiHhaYM1n/r4z4ms7XAKZVtOD+MWOB7gEpAueBu0wLckNj/tyT
	XMAxeFWEuUHkrJuSJpqAmgxhJKnrPd671df+WSc4UzMWccLKIh6ANFqzjPnqfo8E4NRNm71GfJ7
	qPux1x6fC3gBmBbJ3bKewS6tFSaJJEMa8y7gtGIn6cRW6sfWTUpI5Krkx8GKCw5xl4Xb/OgNnjq
	ko70kV0JANPDI+49GqTg==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr25360005e9.19.1795134374446;
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:14 -0800 (PST)
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
Subject: [PATCH net-next v5 23/24] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Fri, 20 Nov 2026 00:25:33 +0000
Message-ID: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add OF match data for the Ethernet switch (ETHSW) found on the Renesas
RZ/T2H SoC. The ETHSW is based on the same A5PSW IP as the RZ/N1, but
has a different port configuration and register layout.

Configure the driver for the RZ/T2H variant with:
- 4 ports (3 external and 1 management), with the management port
  at port 3.
- DSA_TAG_PROTO_RZT2H_ETHSW tagging protocol.
- A fixed management port frame length of 0x3fff.
- Pattern matcher register offsets of 0x3f00 and 0x3f40.
- VLAN_RES fields using VLANID[15:4] and PORTMASK[3:0].
- 4096 lookup table entries.
- The odd MDIO clock divider formula.

Add the renesas,r9a09g077-ethsw compatible string to the OF match
table. The RZ/N2H SoC uses this compatible as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Updated rzt2h_of_data to match the RZ/T2H hardware configuration

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 86d5b9d52f8d..2b69e92e1853 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1411,6 +1411,20 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+	.rxmatch_config_base = 0x3f00,
+	.pattern_ctrl_base = 0x3f40,
+	.vlan_res_vlanid = GENMASK(15, 4),
+	.vlan_res_portmask = GENMASK(3, 0),
+	.lk_table_entries = 4096,
+	.keep_mac_tx_enabled = true,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1424,6 +1438,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.1

