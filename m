Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134365;
	b=ZocsnKbVSQv/EtDED7AAv24ZlYSzdLSPqxRSfDsgsNf+bELvEKntl3KiUyEU9mBzS+UT
	 g0kSQ7WlpSohbUgzywKdpBSpddGrK20g8/39LafECQEM5pv2UfhxY5w+QZSrhzEJaWbKO
	 34J5dk/4gcdcTcuJLg56y61qnTYmT4oDfmY/S0Ase0BA9YfWtVC2WMvZib4NQIF47Un2N
	 jF7fHGXVLjuix0zvrkhk1+qOnE97Liu1kt8scUu5RzDEhJ/dSxIyQ9O0tTb5F8VCVsDH0
	 Gt8DAyKUmY77pmV8R2AMP9LzWcZTXYW7lqGYoWh3Xfh4s2Y0/GDyzD+qjD7oarsBMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
	b=M7GtNwtn/K/SmvHfMal7ufdGiVCH6WWPKs4KDiw3DA3dtoIkIz70BJQj+bSnJ7D0AEQs
	 7Eqa5xmRxIfZ8Qr4d+5/Qd4MX7fIIZUT0cmoujGKUF9g020xDXMEjRFM3YxJFNNtlJv9j
	 Z9muWHdlEx1rddE7k2jssQPpqhk846ODAbRX7DrPZtC42V929pCyUbn7OYEF68QxpBfwl
	 /7qdx7A3+hHQSae3p/gKac+TPUcT1xNuwqrJ7AmcqO9y00N+DKfv3wyalLRcQVi19VUYj
	 Ff5Dl2EF6G7MbLhxsFo7VUCzOGkwVPtxFm6O3R5rVh2Pcf1+9+BKf5khQTgKNzm/ExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8F60A3837
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF8F60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kvRmUPCV
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492690dd5daso205096f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134364; x=1795739164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=kvRmUPCVFdVm9Tvu0USFo59ybVuNY+lv/i/sbUinEHjjSz1u1oTC6qMNXiMNCd9z3X
         RsOZkXuiy3FFIHSSKoBPOY8IZuMSl0+tBrtyTxfJxC59ZHgy7RtCosCY5mP21342VOfb
         oVdxG82rBoRF/tpBq+mqaaqYUXgvGs9ZvSC+u6M7IEVel7kf94mhPdu5TS8WyKTc28bq
         QvfPdfTJAyOBjQhlsoSztQ/HIp2YMUCtt32uIw4U6ZaL76wRNBPgtXohSwXj00E+w5ew
         Y1SaCK55hGUTNGaon0Da9mR0I/64EwzQf75PqOFz2xdv0/7DhusBGU9vfAoIARLFoHJf
         Wq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134364; x=1795739164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPt8ckgxbndwPDdtomIJwXpg4ESCKJ7Dvn/Ga7ANGV4=;
        b=MBTtP/hDnuNxrKoNTamhZLTBfGBrucJ7fBp5sEDH/fh3Nx7Xb04yKJSxx/dp4djjX3
         ROC26sZkrqBI9JX+0Mb4IXf0Wv4zHaM/Kv2Mdlz0B7xM/kXUoXvFIsihAB3+4JwUHmjF
         SmTkMutBNCzRdMDIsGCHE/Og3jxK+gDqFKkq6NpAdqXK/tyAGXxWIGgqL2IqP1N9gRcR
         yGZcGCMZ72Ls7uk9Isn5AfrSW3uwqRd7UmOAeRKLZ+6KrAUua/uR530Ir22nTwtW9oK9
         3kMxj0KjWim9PhhpzqXAY6k29l2qe5FhtJx7lf8FD0T/Hmk3/02mWUj0+JA8mILxUrqd
         Tctg==
X-Forwarded-Encrypted: i=1; AL+hErGC1Bj7h1PZixG8Ky129T2sEmyp9mvZYUNuh3wRq3mbiapa+7Y3sy/wyZFPCS7k5u7Uq6nhZyNZKt0cymXT6cqwTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kZnz+2GFK+ahsHbCtnj3FYQjM+oI35ahqxi2i96s1lCa11XJG
	SaRZqeF+sSsfpSKkuW7PlS0xECff+pZPvUAD57BuD2B/PjIEblftZlrr
X-Gm-Gg: AZFdTZdkvZwhvBlYIDSFydiMCJsX6F2OrHcbCNgFuYkiHQYpgb148dNX2SoRd2IqN2p
	7mytEGmRx+sy/2+pFsVzVdc/AOK6D3TxP/dKAeViQhtYbPlHu3d6RqfBYGGKMuLixS75OL7e/NE
	Gz2ZQePobXZ5DBPqRTZVDW4wipLYY0Ym2fbcK2kDsN/SQygee23MFiEbM5MRa/9fwisin5nLolc
	hiUzSVUie/O22zEcJBl9mwymQemZsWXwA4k5xME2lPrhNbgXFyx9VwYAqG+rN2uAcPKtd2n6VvZ
	/pSOaNFJQL2AfC2Hu6GnqjYp+Odolm3+mkOd9ohYBOik03PInrCEgZk1Wpt8WYOWT1KOIc/X447
	qg0rGa0dPqfC2H6O9LWsI0CMBAptrGCC9fZpz4lGqivLD/RuAcMB07PfF2c5WHLMGXsrJ12X8k7
	CZGMCZAAKSwXAqTChgTDUulmNwGXhrs45s/e3GqJwTfWrGu6DoJVaNRuoTyubl8xrL+WViKQgSY
	EiGKnHJF5JvBKBH+FR3KqT1I/sv4ouYtJeWobkZ+PQFeYJJkHqTi3ZLsCVAfza/5sdeUjpIz+tY
	XmL+PgfRv5mvyt22rD3vm8/7kHZs2IAJyhiZjSv2j1IZQl7P8bHut1KUiY9VK57uGbTG0BE4bE4
	jHqFrCxv3FkNkbsCBO9xYkml32u8Q30iAKxkTbyG08agPyxfYZz/iX2WSM+7i5+fE1Xi/I3BZ
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr1969744f8f.9.1795134363733;
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:03 -0800 (PST)
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
Subject: [PATCH net-next v5 10/24] net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
Date: Fri, 20 Nov 2026 00:25:20 +0000
Message-ID: <20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The MDC frequency is hclk / (2 * CLKDIV + 1) on RZ/N1 as well as
RZ/T2H and RZ/N2H. The existing calculation uses the wrong divisor
formula and can set MDC above the requested clock-frequency.

Calculate the smallest CLKDIV that keeps MDC at or below the requested
frequency.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7fd2652813ac..df3b3f75b489 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -11,6 +11,7 @@
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -1104,7 +1105,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
 	u32 cfgstatus;
 
 	rate = clk_get_rate(a5psw->hclk);
-	div = ((rate / mdio_freq) / 2);
+	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
 	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
 	    div < A5PSW_MDIO_CLK_DIV_MIN) {
 		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);
-- 
2.56.1

