Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CBF5326D3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869427; cv=none; b=BJWjKxMkawkYGTd9mY/LeA2YQpa6NxIWZQZpUCEDYlKzu57QKCdEFcHQGvfUcLd5f/q/OEQwLC94kSujgsOrvOeEGcUkbxaEFo4tNU9RzYoCmWYyfuvCnGWR4z7kd97wwKrKjKw9RuB0RfBGwRL/owcYriNWWKm3k06ncxh0NR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869427; c=relaxed/simple;
	bh=VvKTppGNRfCJQy/hfPQRfmRYdr38rRvDH4X3/CkpjSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orhqzoHkYJc0OmH1w+BpAz30/DU1i8W3ymnV5Pdjn9tYYmLhnyuaQzTYqzt07uHAEm8J/TgKT905HsfOUsr5WlsP0XxCahqAlpQZ/mU1Lr0yjmMrkk//tX60WHJaFmhztZgx9xh9ePSg/8tabypQfenB/FRVXBU3yPSP+RWQgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muBVL9Zn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muBVL9Zn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so49292215e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869421; x=1791474221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJYgC0qYDLIu82QOmmbXhf4D3HyIB0ff4AiNtPS2CKs=;
        b=muBVL9ZnYXXMLsA47KqwJBdXEgK1FtaF5bkh8eE/7vyR4gDjG5I1jg+vZf4wE1xkmZ
         GH/qPr7mql2XAE6jaGTlBw9677dsmB9GguldNM3iOkWx3dkRMRJv6eXKmt5rPKdog6wg
         N7iUkmJ8EnZvx10TdX5mbVbEdCrtHy6qIveQSV1rgXCkZwjswbrZCKGfdUfUV2lAXIF1
         N6umUXXiNCHWy9tRTIrcCWpCXg7PU1po2El1e8plMyBpNx23nuaRg+n4Cx8lktaIQUkc
         ABm0h9On3277Y61UXJ1RbfXs69RxKPGYt3n/XQgiNlOeMQI5UIkksnCKYmqnSG/+10P+
         Y38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869421; x=1791474221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJYgC0qYDLIu82QOmmbXhf4D3HyIB0ff4AiNtPS2CKs=;
        b=J5r7tMHA9NGeHq5nVYKv644zXEo5qajTB0wOBlqzrK6uANJ43saJxkD4cSWvT/irnU
         pAIB3RNhr9NSqhp+/8QEZhawdXFRs7K5BVsnpbS2awoYwMD3/6rlpyMuKmKWY+vou9Xh
         exPJTHHlRGPYgV006Yf4eOWLWABfvezno6Rbcp2E7KSNhxNhpoSpdi2svpL5DDbekMSJ
         Dqwn3YBa4nmxZcD9JoDtwSZfcBvQPHwxCiRbJUTCnb8SbY0z2WGMQgrbgJuU1JQZTZjm
         OQsx0I7SK3BnjUCktmuoZ0024GLBxL/ud8cfDpFlN0mDziPVYu/xXIvs7ix0dC4wUrbG
         0VBA==
X-Gm-Message-State: AFuF++m/o59QOIKNjqNmexeB7SgvpLcJ9QJ6ipyiGGD16z+bk0Y7zUHX
	cFDODOidY5lpKYD4RUz+/+HenJvwWFkMuBIUp4Q0eMm5aD/fI4PjqRLL
X-Gm-Gg: AYBFou2+GE2fkioxO3LoBimqHvYtAAHs++NGJHljkWq2mfvzHxdF+rYTYJdzZvzPImN
	YtO/WlwGU0o4kTMSXrk1pwRi6fHGZ/9qxJ6tbpyAz1HE2JBSlzgiKw9V3bMe/1FXABLF0mYFiHI
	rPR6NBH7gzRkoMllXSE407/9SbhpxXm3ZDn/f/BDR2ZMuAjmSeR+j2LFJNJCxAq6/Fh63aEpjr4
	AVFCnIiARPMLsUGhiHw28RPzp0s3TtZ8ncmolY3pSK/BUGnaUQ3iRcc6D7b2diaoyeGeni9ILYy
	nKAhBpf3RhBLxDOeBzjwg/Fde0/F0/VB4D14oFmnwVj4uakueuT1k7+OoqO8YdKPpTJio8ML3tH
	W1yTunWRxCCORNOyeguU+YIesShtX6sPkmaVqNp+8RjIkJRRF4fG8v7nsZXgtFZg68C1Cjf4PFJ
	sJm1Z7lGWfHIB+lMPLFv9xfB77iwM/xq0rfvL4/HbOOS18wGJknq9LjFv9zDBpFgnGTz4Qyw1WD
	sKpvwomsKSjtxzS8FTRqu8VG/bpZ8U5E6uYfFfV0Kr77H9FwV9ynD0ZbembzFu//EdvozBoA95h
	ulM7Wq7BWFPQM1sIfpo=
X-Received: by 2002:a05:600c:c089:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-4a0275a0a9bmr134335e9.25.1790869420845;
        Thu, 01 Oct 2026 08:43:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH net-next v2 07/12] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Thu,  1 Oct 2026 16:43:20 +0100
Message-ID: <20261001154326.754314-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
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
v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 846216f22bc3..bdfa84745eda 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1234,15 +1234,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
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
2.55.0

