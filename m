Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134369;
	b=tAkC+J/5d07UBdf+HDQ/vmmPT0UyEI4L7ehziE/x/3bDV9d0zG3+QYqGarHA8Bfw8+dS
	 EDImKojognXwB4VZyWNAEI2t9xItBNulXSdXpfyH/6OjXuSgg2oqEiDZR8JARtP4HZ0Hm
	 OehINLBLn33RXCQRzBofcS++HHZ2n6pUfvcyfk4PdBvVZMsTUiBfIChBCtYs9wNrNoPjb
	 mxQV/BhO1uFRUOss6A22ElluHKirYRxFJ0M35bVqSdPvzPGH4rKF318u2CSGAUfILvHbR
	 RtiKprkq4bbtzvEhLWrqcwPLGahq6uri76tGIT0ryLglVbgYR4acVWLVB7YgtYAn/pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
	b=LVVntaysWsBZyKESg0tBGTwqtNulckxv/BQsnNmIGS8lFIQNVcoqSetNGoy4qBi+BJ2K
	 AVUPL/TL5ZhP1s+GPAgTXLN725oYJbJNVHTLDQLQqt1zA66muPcy/sBFcqZH6+1aSrEeE
	 V+SyeHYWHdDjCTfPYi6V4wUL3AGqTyralR14Bxn115swgiDCjSXC8lh+GFjpCtfGmC0FK
	 WYev0eA6pU47PZyE+AfWgdnLEhDrkmAlJRB7L22/5UoKGcvAcWkRUi9gPTX9qHJCQz53O
	 F8siPTXwhhCSaHeHNojifaqMePe1cDZ3WQsqXWRqwZsTKJygAn0WN1s8Ia0U0QTjbKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1160A5BE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C1160A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so157358f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134367; x=1795739167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=vd40TbB0uflLt4DjFBLgec/FN7GfDut6M9wIu3JPk00vzIUT7wcRxsTKWDKxdLGc0y
         HCINz0GLSWh9Qgr4NRDOm44RoGPqiKrcuSznKHLmOerYFu98tZg8xIrI+ZEXv7T70R7n
         jZWPJrK3tY8nC8ckV722EkkxFanqNijXd7b1G42npeNo45yVrt0YOG05hNLGs0wjSkIT
         KauT9/+Zn4KeWuSrg3ViG3dydVYhN7M6Z/pZvi78TT/IQY3zNcCHilJ0CguDiG/0PWnW
         vruV6ij7ueVP494XtV8jXdXdBH5ivVsLIi3qtGpm9Vu3vwpZIBSP/L+7TELCjiTeroDl
         8WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134367; x=1795739167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=D1I82Qd3ITqXMuHGoI4ILWksZYq38xEIEKUKQCbP3oaKbavO8HWis04DIV/Ek6D4Hf
         VVdpECaIJ6HFVL/5dIrtkoIJwuD7MJna54sOxNDjHMZnfUF/keiiqUT3M6Q9CevmloCI
         vSZv26UyA/apnh9fFUK1OnWOC6Kv73bp2Nbk1C7/6y1CuXzLnoKY0SIWpPBDv6btVobb
         AyHinROI/AR1Giq0tcTw9nzL0GOcHpW+xPAri5jWvcLSf2oA4kqrAeI45RLIdxAzhSE8
         l1DCmDqSY+7/DSWko2g6XKhtqOzSlZo1ByuKaTAoZEeAyXDAIzZdMWCLhlwEcg06qxnK
         WV4w==
X-Forwarded-Encrypted: i=1; AL+hErGOngJqTr2tpWMkq99fks7UAnhxG1YgGsiqUsnIBqzWusva6ndvTrGyTgBxDLeqIYPTIPwZGPLGo9FY2r8/5VVGug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ML4fk2TDqzHu6TZccUSzewTTCJtXCOp1CHchdUMOgFBckx4Pz
	Ao1tY05+ifm+diE1KemhjHDfdlyzHAll2puyTRSK4qLV5bpFVyjpG15L
X-Gm-Gg: AZFdTZdGZt5n40afc+Smlh3inZ/0UKDYhAAV+1MsgHU08BT6DTPn8L4awf5EWTQlLrY
	qih6SpAHmzmTYjYOEJ7Lan9H2wb+r2VawFQMNUHMle3ABpW/gaM1H3KyBzt3lUB8Lq7q6dP5c+p
	eSZ4f6TljIqgGEG4Vff+6pJfz7NVvmNOKsIAtJL/gQFyLHgHXOoBAbE1oz1HlW1qtBQk7PKOIo3
	k0rW1WdrLTDWUmQg0ZOiToF2MZkJbcyF3D3JAftedh5kLWfVUBL0sLbmeZCoc6Vbcvo5bnnugqO
	pMWyS2X5s2lBOuxA5xpVd8E5xzfES2HnxrYOfbYFgNRTy7UzThF5/I+gZUYmiWI8tcsgFkteO4p
	/fgOuZhjyjM74L6i93vFyeYEZTLkrwHebXHhYV/vBfGV9JlJDYBBq98prPZxFmJ6lHpA+bueu8P
	buc+xmlA90kAM5jmQVmSZELs3qi/xlVlBbD94K5PWxMeGqorC0NrDj+Jha7DdWRiHRCJlzaWPb9
	ZNGmhtYJfLt+/wDXteFsxlGX1NwY4z94KM72EeeDVUr9LkVxWOzPvqHbqAaE3GjUUNH3pJrDYbn
	d8kzPIJe0p7Zdf7Cj2LKh5hHhfPi9aM2YR3HZfYeQbGul6EgqFVba6H0A+X/v6iWMl5pJaRKwkG
	aoMXfEhad66kFCmcqx4YvKI/G91Be0zZ7LOVwcGF6Pmba23Iq5shDiMNQVPWfLnK25LhtNc5/5X
	JbPH03N1CPi+ymvwkrvg==
X-Received: by 2002:a05:6000:4704:b0:4a9:760f:183a with SMTP id ffacd0b85a97d-4abb400aef0mr2164738f8f.32.1795134366927;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
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
Subject: [PATCH net-next v5 14/24] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Fri, 20 Nov 2026 00:25:24 +0000
Message-ID: <20261120002549.1908299-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 4b31a1d331e1..bccfadc1d5e6 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1240,15 +1240,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.56.1

