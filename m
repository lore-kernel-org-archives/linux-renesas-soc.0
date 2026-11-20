Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134374;
	b=3q6IFD65/rVplENKOqjPaBnsg9QyGsSe8FkAUsdgRyGek+ULRy0aNEtdfALxbBgv8G4b
	 ugeToDntHjy7khQJSFfVFXw3dfOqDLZG5T+EkFlA9eXTz0K8KtFcmQ9+ORRTOp7vGOFvu
	 0bWHWbABrMD1bBEtODKczzS7MX+BrnVxxtprVyaf15szRFHkrcgIpn/7dLP28yBubz7+Q
	 ibJ2GcujEHd1BjHj57B+oQ5auvMeOZyJWt6OhSb0VgdmNDQ8TZ987eZNnTZtI4pDC7zUL
	 lgN60MsR967n1Mml1kHwjhBwLRMgYyWzWyksl/3P6NLCJ9CHzav8/t48qUVlqDh0tYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
	b=I+pD+xdEeIvStYcspGHoeSUURV3bkF2P8KciNwogcwf1Xdfn4ivaMjVABPYEbLNX1QRi
	 SuhBUPm/L6FhMj1GksV+q4Q4LdG998daMiyQXv1ENewPPf+GiU/DBKnGmOPyYivhnLpcj
	 jI3pBcva8GA72BOT0+JKkuoJpBUefbJtGbrd8AqdLJafvvA/riW4zUCefFZzH7K9PrjVx
	 SYfuKnaM0bkUCVLXp6KdZ7yMJV8HApzWT5y0Dp03lGX4GAPtv2OvxDTd+vaoLtJxxtqaT
	 WLWNlbcumx/kJDk0t7xN0OrxkFxytM3puTCrir7TmSrGbEqjRkh44+k2ZgfO77At3SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195260A260B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6195260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnpkyVH
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2375455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134373; x=1795739173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=TbnpkyVH+yhTrKOHjWx/7zpM/66j2jIRzeSvBMJR+qCh6qNpfVPHDkV3ya7jF78JaM
         YPZZVeawh3qS2OBUVieNI3wwKxN5RGICbyG++1DUKKhsLzrs1YkHhqnNnqfJaoMdjpFx
         IClVzRMM8NUUg0HKQh0vXIF7rkWwSOVonKyLsr219Q7IYmV5/ONWmyhcdW8tFUlzG5kr
         E7jPN7CQXMLSQbuiw+ifctWcvpa7bQ9mSycRILdAZg3g5xG6EduSDZtfHIiA2KYxpr/E
         DKx2Er5qb5jYmfCpOY1Reou/72dMQFpmG41Cg76BEZPkSvCHJQMDimpVsbAdSWn2Hk6R
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134373; x=1795739173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HI2zoBly3+pjWajoQlzGpQeohSyK8NQtkZ3jxbEecU=;
        b=NtHAncawUf0v3C0xPf+B6MV4coW5+SMuy7HM+YG9/ZQQmm/w4eTRcCTzKZsC1kdq2l
         /VifdT7bDcpEKxklXtXpzafLg17MQtLODlCaytSmz5ZYvDuxuhW1D8yuezYsZGCOS8i4
         86d0x4a5kDhD1px0LtzGhCf+FUl8ngeUKrghi74f0StYJ9cilH1mA9EXHO4uvBz91/6N
         jjWJ6krnaZJiWt8W8C9OyNLWn0C/QZPJ4qPZdopBdFcm6rmm+8w7jLGXVjKitR/ZwhtE
         uzEaVgAgK2Lg9wYUcXqpQZrZJ5/PgCJvTbxPo09aOgtW5z20gzfp6xSFKMrHcOuYfds+
         mULg==
X-Forwarded-Encrypted: i=1; AL+hErGSEksMrzRanK966uhu5xJAllDBdWZ9jrdJ/6il12CES0OT6B9INlqQmNzxfAQTESJF0sYGHrBHY2HaMyGCdd9zGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+v9a3HeRsvqx3D7MWs8ZEXBWQLCmX4BDBI7bQ146gn2nFYUhgB
	6ro+gsiOS/TR7xEMsv17spV6fdbREfFSKqRfa920W+58BFoG+VvasOpB
X-Gm-Gg: AYBFou3EPCn/kBK+ylX8aYllUYq6PoVW9yC0XuU/+tRghzpa446bTbQ3LQNeM4LBq0J
	uVfd9WOybH8CQ5lDzSThWnV/ppMZ1zjBCjSBs93Rw71NylV/D7Cipw6VGfSCPGDfg0Bv+xxC6p8
	4bujjjldDIEWpkos+BC//+FXqawVECaO0c38zyXaAWqabuYNQdMasExLXbcGZXCrjcEZsZT84of
	vW0VdI2AzrmtALh8ItcRvU8c592FFPLu9taEo92gmcBqFn/SLuZr1ctw5T+7CF75AcO6mWpjjZm
	fcRjTbzNwFVIRq3H7/yNK2Ah0HfUZ7rlVGkQQHsu926jtCOvpK7P72IMAJJjxH9Ks79KV/gMHxy
	5WDk9y0KZdQFw6qTw4R5+qHNcMxmmWlKVm7C7IjBcO2w/DbLvWciBPRM/tRQWtXVAb0BddiJUim
	0+6wf046MQSKcI0/WiaRs24S6TCU+b5wTTWJPZTVpQ02r/NH/N5AtmOhGgUTrCTo4a9ggjHYNaw
	fmMy5VsY7K3uMBHi4sTorSMgQ5ntrQyIaOFmim6mQJSYc7GMdev92S6bZ2IdhCCwOB9uIIjv6UY
	DrqeQCuWfLnTvdW2DW5ljww7GeV6KfSvu3avqMWpBO5dssfjQ/UmbhyS+mObMYPg0VPCKzWur1Q
	i374Drd8XTMEbVFIxjLWFaZCSJQE7xy0j8hvK8qsVIn7DcKH4/VcGj1oCkeP9wXlZmy6TPxgg
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr26725725e9.33.1795134372763;
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:12 -0800 (PST)
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
Subject: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port comment for RZ/T2H
Date: Fri, 20 Nov 2026 00:25:31 +0000
Message-ID: <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
to the switch management port. This is only true on RZ/N1. On RZ/T2H
and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c0c1f45852da..751d03b0bde4 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_1000FD;
 
 	if (dsa_is_cpu_port(ds, port)) {
-		/* GMII is used internally and GMAC2 is connected to the switch
-		 * using 1000Mbps Full-Duplex mode only (cf ethernet manual)
+		/* GMII is used internally and the conduit GMAC (GMAC2 on RZ/N1,
+		 * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch using
+		 * 1000Mbps Full-Duplex mode only (cf ethernet manual)
 		 */
 		__set_bit(PHY_INTERFACE_MODE_GMII, intf);
 	} else {
-- 
2.56.1

