Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3EB531AE2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869424; cv=none; b=Cb2NMsHLgK3YuhfsipaErQmPWSYvmcVT/gIdBHCtD3lhHbp2NZEMPu+nuhV7uJn7tlI3ZPSEWREg1kC+5BDIijO4FsuxmYuMgFVYCOMaE0tvnP+NkPSA6C0pOpnUCEgRpg9spjnpmbqOIjY9KhRlkmfEWz9dw9wDM670MhKCI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869424; c=relaxed/simple;
	bh=YskAwpR/mGuRgSSU6DdBPgodvjjIZ8+/rOUSY446yvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWKxGqkp77UGNumr6/yq7S4sywW12Lmundq7DZJ2dKA60pcP6E/JfNb3ExJoOYermQtPYn/B+P4SItYieKk1QwEpxHftrvmcxI9tWO/oCksug12vRo4EdDPxaM9DbnVMCZ9j7+QEtPmWEH5MgTYdUU9jamLwgVVmeBWQ49jcjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKAXv6cZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKAXv6cZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so36887555e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869420; x=1791474220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/xBG81+Esek94aYUr997cbgEWln/OwkjDM1Q1+8oQ8=;
        b=aKAXv6cZo+5Z8VzOiVgz5QRQcchRNs/lpNbKn1/h0SQZco9jACjDDM1YpZMRccpFp7
         EN+7qT5msz0zx3mMUhntnJ5eRgOqQgmSgAAi3GRcUhxg4qyw5gVuwQODt/WAFvblMiKY
         zuuYU/Q+9Opi8l5B+FtjXJoLmDZncxfjTPBPJKyA7EoR6+n2aU8Wk4zXQl3+aNYAsWWs
         RQTrztcC6q0YNuMA9Q8lA2PTLzHEQg3uZVpLIyfMAJgEvBEQ7Uv5eq/XmWzM5HZfkKsC
         r90v06OR1K3HQQNjEzw4addbbQS7H+9hfS6+B19MIGkYK0LsYRdTMQGtwjNpvK5O5Zga
         aIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869420; x=1791474220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/xBG81+Esek94aYUr997cbgEWln/OwkjDM1Q1+8oQ8=;
        b=W8exzC+qTLGXDbJeb8PfNJZj36PJnA9JxsiB1hd5qJRX+8qc983R1HwuXLwuRdrTcp
         wF4XuoAGvZICN5rQnsCJnLZ9p3Xf2UfCin6odInwS8Aoji06lLrAGR+1jyU+Rg1xJ3Yz
         TCN6ZrX6VQwPtVw9dEJnv57E41UcfVMePmL3o7owuN1emvhjzgbkJQVVkmHZqtGwhIXB
         0vdEet7KAf/BjVjHbemfR5lHudS9/IQX7AYk34O2qK6pIAa5PfWsQreLLmesGG3f6/aW
         QLXxmL+ypsiIHbeKVXokbX0GywL56Zq/BvILML7uwakJxAHnl9quRfyh/NE8lF6+7dZa
         nCYg==
X-Gm-Message-State: AFuF++kDZcqsmi626tjmPUfeGZOhk+AU0Ke3l6uDfgr3nZ9dsbMBFbVH
	zApvnQ+32dX8Fhy6wzE0+sPznhO4Wr0c+tgadyLcy31l2Vf5/exuxbK7
X-Gm-Gg: AYBFou0ZaGEYDSmm7AXCjViJ2opShbj8u0oplcGwUg7v3xQ2zZPjCOKpKjiuK/AXVEp
	5226JexcrEiXK6zeYg3WSHcp/9viSzZUOlJXCJoKaDf3A5PnxVaxbW773B6gkefUxyKcpUbWqGc
	0xhArm8hNrLmSetb1k9sfDeZ/v6uvAADuN9xWdBpWwcIKeMMVZZmQzTeVMjUBgpbdTdcGPZAYUe
	37HAo8ncARYfPM4/fEbNwRZSbk8vtDcOmyzgdNLucykcTGkDJKqEZDWdWHFCNvphMGyu7xLZWlP
	5NFQ7kSPESHfOto8Z+zg1DbP/TjLm1LLTx29idSkmjFdAjBActNPRxfDtwuNkavgrupjQPxPIVa
	f1feOxnC/bH8fsL2a61JfGRd5l1d6j3I1B9y94FrBmCSQw9xbVjF68dsfqgusBPhv6QnsZNl5TX
	OLKbMMQpD7s2rqUAXYh7QDLJvRIgamr4f/nJQDQ5y7QuwtTvPS0WD8ufJr/6bMTfdhnSESXNHud
	gvVZE2jLT1V87yf7lnJIbnsadntIPDwYaBzdxukgjeZp1vVFcIybd9flrvqwLStxBjSAnyygVz5
	fPcyA4sH
X-Received: by 2002:a05:600c:46d0:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a0275a28d5mr165735e9.25.1790869419554;
        Thu, 01 Oct 2026 08:43:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:38 -0700 (PDT)
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
Subject: [PATCH net-next v2 06/12] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Thu,  1 Oct 2026 16:43:19 +0100
Message-ID: <20261001154326.754314-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9daa5d8245df..846216f22bc3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1212,6 +1212,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc(dev, sizeof(*a5psw), GFP_KERNEL);
@@ -1245,6 +1246,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.55.0

