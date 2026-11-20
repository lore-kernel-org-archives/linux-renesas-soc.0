Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134372;
	b=DhJkelWmde9T19C3rA7S4fOAZ0Gu4IyMLmKuHMfhXARn7wzaWq8Ft6qOsqZwZrIJmQH6
	 7c2u+PFxjuYgxkhDo7UcDM/pUw1hw/yC7u2V6r4hWCgRz/j1tn9KO+VBVjFnFZeyQvVAT
	 P8ii7Q4CIE8Bu2KLwpF4tIvaOSq4cJl5wk5pYrK/Vtwhpp/218yUcSPaVJsO+O7XrTviB
	 ZKuZGAxDMYF84SkCoGF3mxcBedLPLr2Wv+yiqCXh4z1L66Ak5yrjcIbLA8tr9YyQIyTCo
	 wnNyZvQnoYii50yfToWlHRq4L7ZNXz/AhrKh0+AFXAIot2ZLGCdkKPSQGyySClNqv+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
	b=enC8QglgWm4cywM1aKp3hLVVaQ58BnkpC8nI4kdmCv5R8NtGFWyMEmFzEI2vONAr7qs7
	 N6lDtnZSMpK4/3Hh8h5QDJc75y+1iYPq3IWx4PNitWWEP8cFqqxknfW+6nRmQr+EiFRas
	 NxMnwt79ddKNQXRabEH1ODAOLLi0J5XJU1m875JnuPTikNrjjV1vhWx83pCFHFIJZC6QZ
	 5ZucabebmNx4sFXgf6qi/KvPYwdEnulMk2s8Btljp2ruOjDDHHWZVoTDCDKzuagjFhHPD
	 jK7S8MIiZcSjXORtZGt7a7SJHhmRDBoJoov4LIjiHkhAVdNxFceHffC/V+OvH8wjrFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GiZW4/dA";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F360A380A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12F360A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GiZW4/dA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso2643245e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134370; x=1795739170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=GiZW4/dAH9BIl7CvYo9gwvJdIS5Wdn//a2nc1Gq5CnnI35dO7CSUUEVDmikHc4mio4
         9uyKwKkDpA8KHzowUCfRFBGuJbfkbqXNZ7V1KF8aqy7CyjmTGahrsxWhIO1fD3XCPiTu
         wjlDAanNYCT3voftYyUuJfNXhhZOvEGVa3uCQ3tWD1ZvF1tU/FPuUuhVB2G2/ShAm27I
         wRJOe7hGgvauz08SfLaSIvtTRJLDSVw9pH5CL0bG41vVPWVVw5ugGOi8HGUzoDXKUg/f
         AY5YfIRkanNgSemfmg1XjmR2F76cR6dBrOaT7ksAqgSoQVN5ciaZgBkAW+9ij3Q4IkzN
         87TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134370; x=1795739170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MYuoPEXokos/7FC3STr/BeJTYcH3uf8nARH/KURCuw=;
        b=vsBXaeQPwjs2YwDX2MVzY/7+Ot5GXJg7X1yhRBd6e4db2voGP/nYtXhklFOMh5kGkM
         tG2tjdeNKGxTSA6HyWuBQ/oAb94Rna5ZRCFnrXgu+JysoGoNfjFzbcVSFj1cyXdCIYeL
         D6UYkN/cbNXPeXmplOZMquU+nhK5FCnCHK+p3JniQbOvgv/YkjNNX22xFk0u4AEAjr60
         z6tPKpMW4Y7Q8BoJQnaawQfMuw1N0N60u4Xo2ciYuejkwDXCQWjC/aKUBXBr1yHUgUnw
         eje2mnwT6Jfd1sVFWBHKzP6wdCVzVsNmypjotS/WSyQrn7iqQmOY3sEEJPuNhmOjI1WV
         lyjA==
X-Forwarded-Encrypted: i=1; AL+hErE+un3rUHE7zwtrmTkXDbc0pvbcumVOBztgo/zsTjHgGQt0+vnS3IIbFs6QPzPO/uNSt4N4cjLxwuf1XeRK2lmGiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ch3Ru5Bop9JGZJiSoFGzNjKXaG2kSsMkmwB0DZUTeDw+rAi1Q
	BkC+CZN1Ka52a527mgP8nW6a7JbYnp1+mrCRFon0tgW6CE+eRORFH44Y
X-Gm-Gg: AYBFou1U8043MBElZzWGUQyzYMpBpqCMTvqIJR2DEB4IIwoGk6iQ0TzCeN1UR4lw3Ry
	GIpBtDU2gnMgwsw/9zGITqO9EfIk7Q9DNCVBkRNogYI1F46J58QUZuOgZfKbM1ytA0HV8p9Tx9h
	yBYjLPGBH319RAKZKXSzewki65tLH50VOY5vcVV9P0Vex2fKlS231zIzC+lDW7EXwHD9qZZM7uU
	njw268uahBWqwqqAcM5IYWTMARGyYuK+tElqWOAlqKJqvT5PErGefVtysJilifD3xioTL1kynLc
	tBeeTC4P9jhVfyGjVApuh1zBXP15LDWL07DhHoURlq2GnO7NdpOTxz7XVFPSUMOA3iWg2WkB1ii
	mA1KuUrVxkc4OSR+VjAw/zdA3MdBQvZVJjgwBd0llzv7CJMMizuL+/pyZ07+PAMlRUDr67LO6mh
	Rka0jQUYqFFp56ixcn3AX3MhBos4aTKh1ZdlqCGNaAqmZYm3ZpQnm9/bePB+ubScwv0z58/PZUW
	XDyio4Expm6eI1iglzfMpJoYFyM61j7LtxWjiy618tUOJIinZwHzEytAHimXGgU3/oKuP1L8K8i
	pdjrYCrvpLw97K4dn8RsFK1mInwIbDG1zDZcxGKlaJVhGTNvlilTyBnNiDj6w3DomVyAjoKsZAg
	5Df3sVJS9ki1TwSFsmJolfSXDfkyJeY+h/6EuHPbDmvoZRh5/CSl+uU72eQE9wJP6/f1SkzTW
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr23286075e9.5.1795134370234;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
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
Subject: [PATCH net-next v5 18/24] net: dsa: rzn1-a5psw: Get pattern matcher register offsets from OF data
Date: Fri, 20 Nov 2026 00:25:28 +0000
Message-ID: <20261120002549.1908299-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RX pattern matcher registers are located at different offsets on
RZ/N1 and RZ/T2H/RZ/N2H. While RZ/N1 uses 0x3e80 for RXMATCH_CONFIG
and 0x3eb0 for PATTERN_CTRL, RZ/T2H and RZ/N2H use 0x3f00 and 0x3f40,
respectively.

Move the base offsets of both register arrays into struct a5psw_of_data
and use the correct values for each SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 ++++++++--
 drivers/net/dsa/rzn1_a5psw.h |  8 ++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9475e53752ce..6f3f902f9f4c 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -112,7 +112,9 @@ static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
 	if (enable)
 		rx_match |= A5PSW_RXMATCH_CONFIG_PATTERN(pattern);
 
-	a5psw_reg_rmw(a5psw, A5PSW_RXMATCH_CONFIG(port),
+	a5psw_reg_rmw(a5psw,
+		      A5PSW_RXMATCH_CONFIG(a5psw->of_data->rxmatch_config_base,
+					   port),
 		      A5PSW_RXMATCH_CONFIG_PATTERN(pattern), rx_match);
 }
 
@@ -953,7 +955,9 @@ static int a5psw_setup(struct dsa_switch *ds)
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
-	a5psw_reg_writel(a5psw, A5PSW_PATTERN_CTRL(A5PSW_PATTERN_MGMTFWD),
+	a5psw_reg_writel(a5psw,
+			 A5PSW_PATTERN_CTRL(a5psw->of_data->pattern_ctrl_base,
+					    A5PSW_PATTERN_MGMTFWD),
 			 A5PSW_PATTERN_CTRL_MGMTFWD);
 
 	/* Enable port tagging */
@@ -1348,6 +1352,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.npcs = 4,
 	.cpu_port = 4,
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
+	.rxmatch_config_base = 0x3e80,
+	.pattern_ctrl_base = 0x3eb0,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 942931cbc402..5c5f5ec25774 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -74,10 +74,10 @@
 #define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
 #define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
-#define A5PSW_RXMATCH_CONFIG(port)	(0x3e80 + 4 * (port))
+#define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
 
-#define A5PSW_PATTERN_CTRL(p)		(0x3eb0 + 4  * (p))
+#define A5PSW_PATTERN_CTRL(base, p)	((base) + 4 * (p))
 #define A5PSW_PATTERN_CTRL_MGMTFWD	BIT(1)
 
 #define A5PSW_LK_CTRL		0x400
@@ -239,6 +239,8 @@ union lk_data {
  * @tag_proto: DSA tag protocol used by the switch
  * @management_port_fixed_frame_len: Fixed frame length for the management
  *   port to account for the HW issue.
+ * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
+ * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -246,6 +248,8 @@ struct a5psw_of_data {
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
 	unsigned int management_port_fixed_frame_len;
+	u16 rxmatch_config_base;
+	u16 pattern_ctrl_base;
 };
 
 /**
-- 
2.56.1

