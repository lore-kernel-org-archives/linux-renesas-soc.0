Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816477;
	b=HNpiimWnC632UTBLuokECDFqCnIn7dFkH11is51PRVa1hDAQoYfa0fd0fZ8AsG4NafJa
	 1TvbMXjnCz/R+KwyXs33JMnBhb8Pi6RcpBQdZkBJAOltn5iXio19AMo7BT8P+9jXZ/VPD
	 JMG9LBjjNR5Rzfa+PYZR8rzN3RJdzt/I2Z6Q6g9gKup3W93fxjo8kY4nW5pCC7ru4xN9C
	 fjB6Z2o6w/wV36ESvdkQkeicfPHT8kUnEWJSghNgKrzA3mJnHvA4eYyCXtPrdI3paj5UN
	 3g4XlxJr9r66Wv/e0ep22hmp0kf1N705VhtNmB9EAaRQMhWzGiukbSMyoROu6TBs29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
	b=LFkvcWKtnA7C6ECiZYSlGaQ8p/3mTEq2hnakS5PAzzETYoPL8lK/x608y+ya+ArK5RGx
	 /WIxmSAEjgPzVKGF1aVV8iZo7ce4od4t6yut9Ggu/LYm0W1EBStTwiuygyx20gMA2dUQa
	 1o4o35A4LTJvAIQhN+WhvgeNp++rm+Gwp18FRaedn7D332cXL3WxECAd3N5si6+GOfswO
	 1E0UXrlQw+GqMeZKOiSg4qrTUtZaTaCLugEBouriUlOCZNQ+4CZBOHAic6T1sYp3DD5rU
	 SZZCAf7wbRgCtTSwBf3DtEgsRsGd7EkimbRRXOuFGC5ZamaW64R9kAwiwAbcwDYrHLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xa6Y3dV7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9B606EEB9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC9B606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xa6Y3dV7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10917655e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816476; x=1794421276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=Xa6Y3dV7BOBuu008o7dJpTqw+bbRLRusO2s8tzFIqtO76asoZdFLLv8tUHrFTdg3A6
         esIMC+5YYYMkwwolGIbLHG0ZhpNIvJ6TeNjW4aWXA+9YMO6XweuzT3KpYM2JLdhKBNcK
         YYxFOgxSstvUA6DI5I+ZVQMkANRtP++Mj4KeNnet65o8jlgavBA8grMkJcxnYBPo+kNP
         PA7lrALbGaAGbLZufFPitSH+pE+cMrgyYoNbFvCzOAhbqujagiHr7j00orHlxJUhySVU
         +t749BpJN7m8EdJ16DEmsP2whm8z6+WqYCOCqLhRkN0ypLMl+NP3M/RI6PhCWZuN5MQh
         HLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816476; x=1794421276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=yZznXtOCFxmM+44AboDEAyJVqpEvGKrBxZyGi8FaR/qJTlJb6JGWYfjXPdWv5vfd7P
         68tRjFbL4/o/Yp6uB9mfZGaUtMIamBYP4dQw0EnBWfpNcPEGugg0UhLa1czunNCEFE/3
         o6r/GLbADOPtVuTAUF5DD1e4XYCZJNqFmXsay5/Fgrs0YcwvySC7OwY6iE47bFA/P2ET
         UYLXi0Aclzzf8vKxkp0W8vNfPznObuWhD3eBSL9WySxsxbUmmWNCR0Et/VnxZtozephT
         9S3Dnf2mY6OrR/yrlU+qoSFsJy9AJDtRRc1sjgkwAVu7p5NqY1xON/baQnZBnETf4edJ
         IlUA==
X-Gm-Message-State: APuU4Z9KJ+0SQGb9vOWw052x+XoVb/hqSoqcDi93nyxs+eaYahw4im2E
	9cpHpdZtbVmR6n5Iqns50NpzxAOtqMxVZoxIi8OST+05inyLM37rAbb8
X-Gm-Gg: AYBFou0ak2cWMWfYA3Q0le07RbKRhmUFQqfKsui2S4fud4pTNo15bOoE6xgxMlLfbRh
	BTPuGOOe9VBYbLf5HYjXJ6NpHkZEi810X/SCjqyOcgxlJCpZuqj+UqZSCFJQ4pV5aYUCOQhs1xF
	wJCvpF15ETFqp0dQZUuBLpv7DGjkFcCPU+My43EhwG0G9NSK6UCsXW1KEzDfN6NdQbVZrrZF/TM
	nBAh+4fxZLFK2i8AGALnZJrdf9+CQDWd3g2v7zPPBeWQT+DRphPRctobFJoAvs5l1z8/1WHKQ1c
	y65dodl3daGAGtdsj1YDRCh/fzSrplMGEjoCSQHo6nZgkRBpp7XnPlysT9oU8iR5GPdguN82zaT
	SPEXrLjd0k65k+SXf6HlB3bcOaTsEbqNNquxmZ5CBzSYzc+iNRb0he+aZhxTMx9/+wiJP4NXY88
	qejxk8qLti/GdATy+6jL8OrUfGPaimgTZwSkyyuAf0fbmcjtdhYfjmWzdfWrF7QyaUF9INvEQDj
	1AHyBoAH64xQmMC4ZL+l8PH2OKiuDxhl7XkbqnZ8SkXIuQAQ0gD/9VTFA6IfWLduB40eDqKF1kw
	sTzlIOJCZCRaDY+SjYMPxu+qC6BaJOX2OI91B0iMbNoDYnn7Ok3DkO8htCd9X2i1nXqTYTm7MKN
	jiNVIiKFieang2QgvrAkyH4pw0KlRzyvwpvZulw==
X-Received: by 2002:a05:600c:628d:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4ac17d16b99mr372467265e9.11.1793816475506;
        Wed, 04 Nov 2026 10:21:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:13 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 03/14] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Wed,  4 Nov 2026 18:20:51 +0000
Message-ID: <20261104182105.1102555-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
index 4f44bf3ede23..88e181ad4cc3 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -188,11 +188,12 @@ config NET_DSA_TAG_RTL8_4
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
2.56.0

