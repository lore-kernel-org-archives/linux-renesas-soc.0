Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134364;
	b=nh63civYOKxdK0Ya1raFw7HD1vpB5FVa0u5nxdQgrCHa9rceDD3ZAD0bHoY3vVbgpI68
	 nQCHyVryz+peOksNiT6Bw2jSrZ4gP3VhRCCWcBJWLSNx//7bqy1Veomc5bRQ0wf+jQtbT
	 ZqRj/1QGNq8S2X7M/WhhuwEASZc23W18/9n+dQt2y6RiJdBM8nnlvWsEPxtbvTs7Z2+Bx
	 cpcI0ysa7Fsn+2TQ5+nFOzTkMANDLIVTFPCTFLPsX4NYPgjC0IQZeuIouML1fcHbDmSWH
	 Ezgl1pW8AtnrEM7YZbv8JB2xZ5vY5vIE+6UPrq4MbVXJnDN1AeEIxJXEqjERG/p358g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
	b=v4ohLlrjNm72szFGBY6VCQKEnzOCDHVNxl8wta3MsxfHCud596bqTnxIEjIm6OOSHBS8
	 wcYg4wkSa9VgPptFSYAZ8N8G7E9730qv+N7bY8LhYoU1Ly1hLZRTRNcBZtqlosk9s3FlF
	 qVZjNwSyt7b2d45FbVb0FOYbJy+2Mgwz4vOijw1g4fepWmUdPuI8yY06WB/fJ3b2ft7+8
	 d2f1OSo5lu5RbIh5EkeGPKKVf6fuU4/KyYdIHSPIWewQ9rnpiL0wNqkvtGVsBr4qld5d8
	 sW0Y3E78LP0f/DPGi+GBnanfutrP2j64dsUHUo4SmUx/AKCpss93xTK/dyg8ENLVI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3960A2615
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B3960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490f38e9688so213830f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134363; x=1795739163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=AsAePrb9EkRIpPCiAm33DMP9zvl2+uxn7OVNkOjp4Iq4VaZwO6/f/7msTwkTJSWEFP
         jeB7J3sDfEwjHTM65gRoKJfvpeeAhcYEo/cuHL9VISBt0l3x2iihGo2LUvZc+sx95DKz
         rgUwBCNMjgG2RdjozNyFtJM/lFmFdRcRB3iSztcmPc6TlU5Zh/UifZKwylp1GurBcKxH
         EP5GELp6s5ndln7VkX+QjY+6P0X8fdpBVnb3cwg31u1ssc3lzsCuCArEoUCrVHfEl30z
         aD1uYqoj6Lt7qqEyaH/OB55xh410uGlwDpbly1PSQV7P/fMtJ7ucu05u6/k83ltenaNp
         a83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134363; x=1795739163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=Bbt2RUwgQiffGA8MoDTtqG/CKu3G8UpsVhhQPFiqfvE0ySTSBZhtzCsD/KVrd4Garn
         s2s7ke4ofBj+4cLJN7bSnfeu1Zn0bE2tu2GUGKcx3APZ0VMyZ7qUDBmVhcG1jZYvoloD
         lM0KRFkoK6Me7I2A8NGkqnKs6J/PWMx1MNFrz31XFM27ljj8e1du/BBZvWiaBkSD033t
         9b/ovYFvur0AhHgUOiDoYrlAIn6tXQRv63kE7E+3Pv7I2SBU2Pa58miVQvLRjbOfWm0F
         1vWSyC+of1tcLAwfWnM32Dq7RDkjcVM167VkKJgkn/vyops3ZFdiPXGtm81kAxFfqrH3
         kEvA==
X-Forwarded-Encrypted: i=1; AL+hErGkNPh8H/XhHbexAFgw5qEZeiuuluH0joRlCh0rL48ZsDKpwjf0xRfiQ9l4hm3HuyBY0vVwSI3lzM7vWjdCgqahCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9P6E1s3JeaX5JutfOTviOGJRbE5UhtdbqPR5lxzQNyxwWmH+/b
	RIB6KjIWm/+jakBfeNhIDQ/lM70A7jpGzig1N2YeFV9OerV1dPe4jVyZ
X-Gm-Gg: AZFdTZfkTcnSVMpNf1HsHjBtIdAIVelB6ijzcg/Yp8oalc63i1CzmO3ZW8dFmdcF9lQ
	TvC/mGJ+h0jHSlRgFhLBqpPQXfbCEDjt9StyoVMFs/MkD30WwWWgWwlJwoeF8Psk9mchezMr1HH
	bZftRnbdaSDdOPltlwQVYQ8Uxpr67dEmvRrGHln7rHUq1R5kp5ohYjhp0VakGyQqH+baBT+qVqP
	PmeqRYYydjOybwWRLeBxBilydsR8Sbcyy0E1NXmrUZjmPpbV8sw2fIn8OjxpnoH7vWAeREVdpDu
	Kfqa32fZJJkiEKBv7+uasb43EcJ7BuAxOy9LmlwQCnyElKOLTGfm2MT4sDnOn647zNkLMP9pDyx
	/5FtM6sDcVW5ggxeodO+n2n/B+M24q1apKVFo3y8Z7VDYsZfGMXFHckCjpVNrEMfLdBVuNXVpts
	8em2hWzuc32hsjPbwo/CqCvz15mSO/kHIQRb6RMCn6MKgKqLWnj1g4ybaBRoTrlNYX1zMVUMzTX
	bA+LAdfKTLts1PrYmudme+bc30d/wZaHfdzOSkL0M/8RBLcjsgbdX57CMVWQ4rAG9/3/wWbr2eS
	Snp6nYtfw/L93u2q0tnPzehz6rP/NlyxwU+nD1mlBR4/RE3nfaYGBdIW7tvJkNxod56vOGfUhcZ
	RCAK4xbiyJjUzAMuQ1ATXbqk0s2B8yw0f4+u122Nj0aUe5x1cVnPj4rRFp21VbWMWJ038poZj
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr2216640f8f.21.1795134362863;
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
Date: Fri, 20 Nov 2026 00:25:19 +0000
Message-ID: <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 hardware manual places the VLANTransmittedOK counter at
offset 0x8f4, not 0x8ec. Correct the register offset so the driver
reads the counter from the right location.

Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..9693f8503b0b 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -185,7 +185,7 @@
 #define A5PSW_etherStatsFragments		0x8E0
 
 #define A5PSW_VLANReceived			0x8E8
-#define A5PSW_VLANTransmitted			0x8EC
+#define A5PSW_VLANTransmitted			0x8F4
 
 #define A5PSW_aDeferred				0x910
 #define A5PSW_aMultipleCollisions		0x914
-- 
2.56.1

