Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439455;
	b=yhvqbR2fAdS0CegR7NqdIPuYMe2yEJ2CuG9pGwZnCC3N+ed9rvfY4rCtKia0xa6PVQhA
	 79USX1mjvZCLlbfkgo82peLo2zh70v6ahUSRe6d66pNhjhgQ+f5rqVgQ286+ZUnQgwkuA
	 apVeogXEeZCk0/tFluggVnfjM8WFEZE3opqMsLtvD7BbBZ1HLXxNTPzyeltel6dUlnpVG
	 IAQSXllYG2bAStskBaoJON9rM3z+CNOBKRzyblDmW6RHySyzlIAU1qT5/viWPSFCTiBAU
	 2MiLtBiH9xKdFRHbQwrHmwwWPw34r+hTz0TVAnNLQON0s3W0yNdQS1tbQh1KhPnT9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
	b=oD5itoAW4dB9MI7uUzBiBUjmADmVKIfe1rxj1aA7CvTrBHO7Bf+DnImOgihCDm1cjVik
	 O6G6IrKsOvDW81XfK/mFzdfByLcViWu+e54bmebkgU73WzDRI/KQGKt/WBN4DPFYfGZvb
	 lwEtERX395ua56DyfH0p1zbLDnVZFRYld2sbsGRJXp06/BZEXbvwI41lDPVed+ehPYxrb
	 nNGdWYEpZrNIC9jDKAwgIdMDlZjjrtnQj3otl8E6fehtbEJ03s8lGGqGSHSY24/v46vWM
	 AYHpAVr9gb9KYyOqVqoSmNHYPZ303AeTVfa4h4V0kH7Tqx66IAZ2FMIYSxgqx9NcJIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpg7mrlE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420BE606A6A7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420BE606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpg7mrlE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so31794435e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439452; x=1796044252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
        b=qpg7mrlE4nx9XMuqFOY5eJZKNJ/e2FFVQF44i1PR0LIdAWJot+5EKNuzCEMHKDDoZM
         3x/PA+x9v70n7md58LQRfkW3JxPqmYL5RerRnSEe90ukVisxYXuN7b3im7TrMRxR+tKK
         y04w3vOyY2kHGHPMObdgCo6aZtAijmoZGoKAg0tIarIVw9kpRFaTMJtNgxxBI5unpcTz
         QlSxo0EqHTAeWXnLvLcVpGZm1N3npH3kU8LZUg2xS1uqB3xU6OuJROrZafzsizwq5xMg
         UfZNlQqPULlRWv866+OkKKAZNlDNWPXfwV8B7qLh7fOWj5FfHazQqoeX8sS+lihCriAb
         C87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439452; x=1796044252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
        b=wv47bgCPJUM7aHSZrjv3TV1iJPbKaO8Yhi3i8nz4xNQqGp4B5liO6XGWd7TOLkGCvn
         XKtRV8nk6TEh5aFfIO+ig29iDCXZMajqoUvYM6jWmMMur1cwq8jUDGqQa6KUPIN9pcFb
         G+vEohta9ETmndQpEiOPcUxkuYtLV9z9s9+h3+wWXwxVg/GVhSjLt3HTjkCSzpoFQfIg
         b3J76kAP3VQWzz2+xuEM5H1kYw+0QSgi+ZRrF4CkMIH7O2zUpqfndFx1+B/k80X5JY1q
         rNatOsJxA+lQs8ucU1oyBAL2GeRzwfVRh68I7cklJw/U7p8tu2V6hHVE4bXuxNqELs5c
         B/iA==
X-Forwarded-Encrypted: i=1; AL+hErEtc3i5AEKsUBbHz27tQgeJsggGHLEg+qs179OKwI8c4mGXuMWi/GWz9E7z2RdPDGvQT6FpFRqS26Fn/SqeoUXktA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7URFrH8Q6Eopq/C2pc/Z3j7/7TSco0MCjsZeRybtf8yq9yIme
	E11jMo99sI1xUkf8ybrPTke/y04Hlvd1M4BV5eILDBrLBQ6ummOM9Ex1
X-Gm-Gg: AZFdTZc25JTkoJ5tISMnZsndX4shvhRfKIx4ipzph7AOyH6wjemvpKrxOIqazsIvRsF
	fz25pQG3Qy+iDse+OnUK2FgIqKGk4jDt3HA8kmhBIhyfoNZK4KRic7VQnetywoqA5FMhzpA+Qlw
	p/RLegb17p8JYdfs0y8bvmUh+ZR15hzx7Ji0vG7Bd5EkzA0UJcFlUa562Xs+jCQXOdeHnsJZtp3
	zO2mLdTqzwBcGupe7hwoeLElilb3Dir1txem1T8j0pUzyv+A98hS5u4hHpzDxy4Ze77f+/KYKdp
	PuO9yi1nUJ1y0caWoAJi5vXTnqaHzxFEl/sxRsZVK9O44QFmN6w4MybjVC4cEM/U2lCFdOejjIP
	pIZ0rkdt+tGOIusDRX1V6wdHyYuykHEOjH68gzo6po443A6PryWR9o2+3Aj1CSefJGPgW/bya9m
	6ROe5x3NPZrRc/pNhW+wglnu7k+uvtPY8HIHNoyjRR4YAS6tgiFDJUYk+WEBQR7O5tumHwAcC4b
	vP81P+hglvEg/0dJ9S1f12b4TPxuKk8zojQ1ku6QGlhYUURODk5cRlP4V5JnSJRbv/pA3Ayk9ns
	MsSz3znZyecNl1BG3Af+iSOeHPgLEobx1I8JCeMqO/YeTepgT93SzDMUa3/51JAt45KcyYrR5SF
	nUsglK/ybkIAEAYYi37tl8jD7F4vFWvXkue+vl/meOVY1mZXxxa7tdnkJq+r4afO+S6Qz1e4QhX
	o=
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr233753995e9.8.1795439452477;
        Mon, 23 Nov 2026 05:10:52 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:52 -0800 (PST)
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
Subject: [PATCH net v6 4/4] net: dsa: rzn1-a5psw: Set driver data in probe
Date: Mon, 23 Nov 2026 13:08:52 +0000
Message-ID: <20261123130852.3420491-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

a5psw_remove() and a5psw_shutdown() retrieve the driver private data
using platform_get_drvdata(), but a5psw_probe() never sets it.
Consequently, both callbacks return early without unregistering or
shutting down the DSA switch.

Set the driver data in probe to ensure the remove and shutdown
callbacks can access the private data and perform the required DSA
cleanup.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Clément Léger <clement.leger@linux.dev>
---
v6:
  - Added reviewed-by tag
v5: https://lore.kernel.org/all/20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7fc62956c5d0..4925d24ec2a3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1219,6 +1219,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (!a5psw)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, a5psw);
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
-- 
2.56.1

