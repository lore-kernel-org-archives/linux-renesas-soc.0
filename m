Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134377;
	b=lb4+GDRb8o6pd+eM1I0uUcW7ffW0AhEU/jXuMx9Uiv00uBu1+tuoVGbBc4Z66pgGEPXx
	 to2R9Q1lHRaLes5q3LKIAULoX8NjFVE8Iq2cRToPdSIKgI/DiwHJEHDRVLpt68zqfvaI0
	 volczTqgOVvm+WMEhCJT9hKpV5KxyZ4DmYI8nbKeBiSSk9zusDN05r8AakwnHBXeMExGR
	 4VyvaRwM/pYXjExiAgWgPnm3Kf8XjjzL84cE1bS4TFDUejTdlt1klhJojMa+hcjnN1OAY
	 OdY9gIMNYZsATYY7eguQ6DMN0lFV1lrpiYaGL04M/34VBUSec9j8KPlokNIB2r4xoNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
	b=0XfD43gVv9/L3doPhdtOgPvt720UaQfaWx8I6ZvYeXLa1IgJ6jW09UeGdMIDWeIAIW0B
	 04HpH2dbEifORxPJX3jgVEPF6qeAB+B7oKZzWMRtNRELzg1ZQXZrARlYwpL+SCyMyDKDq
	 D6nPGkA1qGSuKzoiTFqeVqGac73kEtCx8Ys6hb5ebihxW701QyfVS+SUt3XcEqXf42XXS
	 1Zdj6gmdOCpYPMEk789U9feXJ9A3WBw8yxeIG9x6BBpkjo4UrUOjNG8Ze73lL1X54nqVc
	 tqCmey3Sct+Lx2M6SSgST+gsHlGIGwRkHNIy8/Uvzk3ZGCVb1jnN3Y6JZNPz0ZgtYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168D6606A960
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168D6606A960
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzGwlSSR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso2573695e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134375; x=1795739175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=JzGwlSSRnJ/pM1jzIynWx0Mj9l+P2kGmykNiNarXiqYNS+A110hdsPW7czY7Akpbm0
         Xz/CamNAUbrx1m1XphPuLG49RNDJAaHotX0PR6jv9lEPsm2ftb7wm+FyOMxJJOi6s5zG
         67bxUbbB3M70YuPHUMb7H8f5/a9lFgXF1zXVFrNwqifN8DwkoHmTvJNqqucB8SsJZl2n
         2pMh8AF/BURqD6PAjDG7Dxe6A/dMBjS3CGsqunyde88cETbwjlsqBwveXf9NccFk+YXg
         onPxtbW8vQOLE2M2cGEE0HsaSOVVu9XYvc1TEgeaFIFcvMW1fXez2DogcZlGApDJfJP5
         zT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134375; x=1795739175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qk3aVd4VbRKTIc00sE53YNcKxH8rylinMd/aVzIhDmI=;
        b=W/gvggHiE1gMXK3wEsrX9IvOWzx/1e5HSb3sggTXmutaOyJ6wTG4tqz45DK0chlaIg
         B4v9GHGqHAYBysh3xFAcsxXGiPkNhGHTVEy223BQSylBTAYNOjMOrwoM4i5wvKWTMDSc
         ofKXH9AkgrVkBFXB3ok6pV4JjNTuL8AJwNItihkC+dtJ10n/YwsgBP6AT3BxumJyfHPb
         A2vhWGnAU21Fb0Nobb+BTzYsNUSYZHITZDtCRf2IU5dNqm3KvgBlUb+Z/xE8ENtzNPiP
         fttJq+U8+Ox8G46tKJpIT2AmiVnuMUW9LKwtlmTF2nKeL9VW8oH63cTL6LBiRrZvC1oi
         RccA==
X-Forwarded-Encrypted: i=1; AL+hErHtdAQHpGUmbOqi1cnPBUDj3w7JRxJnlVXLJnlj6dZYITHI97k5GzKBm9KYeQLMOMarvoOUVlZj+NpGtyRi6CGyTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ggY+YpJkoAeUJiOiRpZpE+qPFhE2PXdw09OmTlRSBoyIe1I02
	bhuv8yMjK+wCgZ2Xy5ezq7LsfUaKuy219pUVHWDAB8nH0WyP0uWUCahN
X-Gm-Gg: AYBFou1l6O7CtXucxkyIKgkTLCVNDJRxtJ2aeClT9g0oj76jx283vfpwiPBlXyxX+q9
	0858vHxhZ0317897ztoCgQI6zqlNXWUKNpaCKiZzusfgBrfDsdqR6b0zlXQlyT/p6LfvIEI+9Lk
	//HslaA/ZzUZPglXQs9sbIrHbTdI/vQXQ/FxjBVX98OoW1pMryafShXmpbH/pVCY6mo233/DOrF
	FqqQ2jBNKWAQRudUZ7eQy+quM7UgBOZeeX90mTNeO/6yCbJhfN8d/iBCqB2+IRaVUCe+Dh8ox6C
	eNuyxzgcB6kuNHlio1GuGPtzkrZ8ZIWj5Db68+VfeoV5GA628WWKW38kUHHLmet8jTCNbTak+MK
	3CAs4hlqjkZx4HaOC9+mKDFjFChbWC3p4/5KON/GFtB7qMzMpaSh2m61vV5PN807aI3OAfawBsZ
	+6a5A2uBwC29T8IRluBSnrPG85/oBvjRbnwTathzgOVvwqoDvSLTaCQweaJPKf238uTE29KSH53
	hyzpwFV7aXyAc2eaAf9qu1xlPegTBSum+Q60BE6tctW1f8v1vwznJLrIxCcnWtYc5Pm2H92oIrn
	RVfL8K9Bu1tjLjYjIX4SkyPAKabjqFsib+rjrxgYtEJ/RRLoJokNlzhlhZJn/viHuJSHnw1TcUn
	sGvbqMVAhsxAc+TlVoElzqj2I+YlBwIxzaGfZK4FW+Q+drKXCGGFGtu9w4vI9iTI1OyDkYPy+84
	BzTvCy20OhaGM4FbNLNw==
X-Received: by 2002:a05:600c:848d:b0:4bb:694e:496c with SMTP id 5b1f17b1804b1-4bb88810b39mr28871365e9.22.1795134375399;
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:15 -0800 (PST)
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
Subject: [PATCH net-next v5 24/24] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 20 Nov 2026 00:25:34 +0000
Message-ID: <20261120002549.1908299-25-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index d62f0cccf13d..5af8bc1a4dce 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -103,13 +103,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.56.1

