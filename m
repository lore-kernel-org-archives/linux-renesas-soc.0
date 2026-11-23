Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439453;
	b=q3KMirfBxylGCQQzKbRRNWH+R3hWsaNT1aZ31/jJa+CXsIookK9EXNc+sXK4KDQ3PBlc
	 jnKEpjY7ladZ1aYeSpUMm2wFYvobHUvnCmgjPu/8AcAzX3dsc1imqqSchlXIQt8B62pe1
	 6bTMNFq+HVnI5ed0z68rADBtRwiO13nndVoXUld5bqxqG0JpUw7ULrYLgSbpBTcllAA9A
	 C0GNV6KEmtKBQzv0OXoWB/usDb32GHZiQBkPmR5kkuIBKLOzxRsdGLARV7HXXZat3fK8v
	 GzJA901jnqWuHJqHPastO3AzjyN6WpCX2WP2Ix2/B1HjSnvlRLmXXT7iPjJ1NwSrUcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
	b=z+69CBSJ7Ca8QXrDuzyjOc4cz6JAK84/U+S/e9UKlg1kiLYWlL9ydhw2SblqRASDf3ok
	 cVdSvUcyi293T8ggfFvXjeUk65kFFLoJqQhxoC3+PSgMsmDfYR45wOzbQhXw7l3EQC4/b
	 qxusi/pQ05E0jdF8AMGfLDI0TGVNW97x9oD639YFydVLSzvRCmTN01zhn9Hs25WPvc0SM
	 szWATOJiEXtrlBY5baTqbAlwoShgF+SUlS9EQyuvYJKiPjHUCs+7v2F2mohen5ve66xey
	 m/w/47IyGPrOkIRlpk5mHJCgJsfzSejzZOummxSuGBN2ImKY4gROpvjIEQgMtW3JIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKQ3jHRE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE33606A699
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE33606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKQ3jHRE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25037845e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439451; x=1796044251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
        b=RKQ3jHREKKn3ZJjIHrgF7TjaMwmiNKzcTWiVLRPjq3pLIGwkGf6KtWB6by698I94jQ
         XCsMnQjUe1LaaTUfbs8ozGg5OaoeG9ugFN6f5/8AvWqixSem3Fa1Q6ocP2FMUO4o2/sI
         Okju4V8yF2HkARROWjNxTgZmDoe4lBm5qU9rSRX1XHxJsbQZPJ/aNPfADmUDJ+ICo5QK
         Zs249JKgCGlN2r3ka1THqd0kZykkJdfOktSblnB2dSskiIH0kBVRVEzIwL8N7CyBFVYz
         BPP76bo9aKT4Y0fmz3dWvxiNaG+a/J8+oplyiCljZIbzurVOlGTTsGbG09b2ZY213O8c
         J69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439451; x=1796044251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwieZqtgauufTvTK5llynH/xO/39KPDUAQ86grulatw=;
        b=yYlSTf4WB0D3Tiv/iJxxPXKhQYFuixyL6W9KayApu19jMWxmlkAZkqPg6lVuhajLly
         F7+yeDc9UpO8N4uANGNuYCM/izK8zem9jveCfvmhvBOywagYtYy9O3Nskv8ZePE9N0sO
         aCY2d7V+4yjsl3DkKAn957XBp5NKUnjJOwt9Sj+5nfgHfsQs+yOAOZ/KRJFoO4KR8zBd
         /arvrKVuyWcYXd212s++4IL8p5FU1kTHv1wUd4LworMIk8W0jJnHqbq52nEsIifU2PHG
         fcIOGX41ZGpuK0THould/DdAXEW3t9ghQ+b3Oi8gkNvEh/ouQes7bseX+5FYwT0JoZCu
         j5zQ==
X-Forwarded-Encrypted: i=1; AL+hErG6mKIfJjahJRK906tsVtfyApuQNz2BwEl/cql1/AQAER62p51jCCxCRdcl48PEssryuMLyZ2BAkEsfeBDAAktQOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dxIB6XoFvNJhS6498YkNQduOSfST5nAB2NAOaBbAUc9nOZp/V
	BE3v+n/735jB34Q4YKk2pIRL+8kqbEjEGK/yG37GoKz4149RiJv7FIBA
X-Gm-Gg: AZFdTZdq3/XikYhgbE52dga4v+eTUY4COX3zZ5FduvhnT6ZdIUZ8WjTrkGW4Wdw8pSi
	kJMH1HkGaHWIB6uBMXiQBsmNKpJVALMxESYU6TXgPHUrX+b2jYFpWWFFPc8LWnc/Kn9sK4y+jRT
	ztXk5HdS5KqwaIlpRjb4xUGiHEOz5NTbrQz0KdKehVqIo5Xa35TDtvFWheUiyzUJZfOJ1a2n5Tv
	HMXpDBRViSNRjkH6ItBdaNlKYYNMqERYStllTiTIeK+9zwbX3JiTcolXcK3VtPClgt+LnW+1Xst
	3fc3NfbPP151QJvwMcCUAQwCD92whtrn5g1054Ex5yaM3ozMDyov34GTeFeISGo7Sz/KW3DHid5
	2A07hqVfZ5YspBbGlo2WbvFLRPXGmLql9fbkz0dbDZqlYBZIS11MC7cO0ENNpIQ2a+ZNw03ga2i
	0Bw27aNywVN9frUlt5vX6UPllOQcRU1wVVij1F3vHzz36gxPjYR21PEsaRBH1RmG9LWesBoci6r
	cK5UifYpJaFeZRKIIe5ohbE9v1giccaklCslnAdZKTGNzOWvQ0WMTbRlhQTbw5rY5IVi5CG7fvL
	08Ppc23Y5YXgT/9Wlj9VnTcW478SOx6+PS9NHfeckl8ahSAE5aO+1y9YR8BiCm9RIksKi7H0V4I
	ZOWhwlAwZ0rOWO8mdcbTmAOYR/1/5JYbV1R4M1AZDnBHZJcAgbeBeRQ0+eMt+5VFqwvlbE3iU5k
	8mLLTXy0fa9doRwtR5LbE=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr139194055e9.10.1795439451189;
        Mon, 23 Nov 2026 05:10:51 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6 3/4] net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
Date: Mon, 23 Nov 2026 13:08:51 +0000
Message-ID: <20261123130852.3420491-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Clément Léger <clement.leger@linux.dev>
---
v6:
  - Added reviewed-by tag
v5: https://lore.kernel.org/all/20261120002549.1908299-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 4c32e06a3cd2..7fc62956c5d0 100644
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
@@ -1102,7 +1103,7 @@ static int a5psw_mdio_config(struct a5psw *a5psw, u32 mdio_freq)
 	u32 cfgstatus;
 
 	rate = clk_get_rate(a5psw->hclk);
-	div = ((rate / mdio_freq) / 2);
+	div = DIV_ROUND_UP(DIV_ROUND_UP(rate, mdio_freq) - 1, 2);
 	if (div > FIELD_MAX(A5PSW_MDIO_CFG_STATUS_CLKDIV) ||
 	    div < A5PSW_MDIO_CLK_DIV_MIN) {
 		dev_err(a5psw->dev, "MDIO clock div %ld out of range\n", div);
-- 
2.56.1

