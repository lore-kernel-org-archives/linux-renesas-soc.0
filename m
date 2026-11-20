Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134366;
	b=jn5Kk4tr0Pi34g32iCjbFOImlhKjhEL7x6XauD7PMFBhVqYtdNxHE4OdHx8AvONqpjXd
	 +XCqIecDPYLbDzU0cziJQKgJezdDHoQ49uS85oYLFXP2cofFYf5rdNdHSD3iw8MYH4Bk1
	 MjjGl+tfNPWfkSQT1wtxAlJ5BKj+I3hqSjZ4bvs8i6aLRqxoDCMIe3FN+nXXa5DYOMmpC
	 5xTihLv3MKKq1Tyk9vM0oC2yqXLEpL+h9gXmaRh1nnRGXqAbG6YEZL8yKmKNUT0Cb2Rnv
	 Lh8JBuUFnrNn4jUg17HsGPReBnLKW7hM3LANzpowFWBJU8g+e2syWAfVde+atS19jyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
	b=3pKpAW6QgJqOpNmS1OXeQLhmpNSmO78xIyl+YJs+fmzqO6qBh9dg6KVmQ9BwR2KKhfQ0
	 PHNCj425eG2CRrhAOoAsakvYvp0erTGRGnxGjGp7VjkGDW6Otc/WZnSYrI93YPC6SGgFY
	 8fdNgcvFxgiMTIqa2svfo+dGgv/qfSLq4SAfLSFzEEVrtMqaYcMndYo5yHKNh6uAsYJtW
	 S4aO4ajd0d0RcKd3QsIXpV/uub8m2dQSO7wtsX3NmPqUqHPioQK9BZUakKpORUzMbB6Ic
	 SfV+rO9qdxJHktP0dneFBnPHEYmyPexR9D790YnC2OS6WC1tBvh+wCBWcWjKvlGCFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WEJr/Xcc";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75E60A5BC0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E75E60A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEJr/Xcc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so214467f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134365; x=1795739165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=WEJr/XccmnAH4kdeHeZMrPWCd8ssbOQXMdvRUebc2cy558660ef1r2TSVgqeZ9HFVG
         zmfah62UoIvIb0aoGHg3YuxpGi3toodjBdwRazY2yCQfPJFcP0dpGMVurL4RXHBxzdBT
         FPWTO7Db6N2Q9fjFIRuumapN6TYi+OTlcR12gTbRKQ4KvgpvjtEtsNrnFqLF79jeaXrc
         XnHtwfu+eQe3PzUvgArXx78AM9KNkOucnwFyh5I58YMZnmNvmol7HOxQ9jgR+1XIY621
         460IFhRDH/SkdmoEQ0y015RGcWjLyfXukK5GieW4U0VDNGH/s9snuaBJz5CLqDo381PY
         TqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134365; x=1795739165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=lKPh2P02HwGIRpxgVt/tx+UEwsnqkLe9UBdMWZ3F88mEgTktrWe1Yyp3Asu3TkvmM5
         crZQ9EGESAXGXgGJf4C8iKyIvypw5it4Y6ScyF+o4mAo9q+ntXXtDl61TF1Zj8Cs5owG
         N6rzB5yE8Lzu5BfXvuHcuQjXFiRTtBTSYGbCRfEw8Yp5wdGOh6k1jyBKhSkH7txyoIfE
         51TCBZc1QFnmU+BuFjMDw3y1vRvQtF4bXMEDIxWley982cfojZ6vAn/c+ui+5LgDl5z9
         vLDGb+AcmJrD81Acas3Xk3IzRZDfBOYZYG7aI5OAhdCqI7JUAEAf0eFvPzuC+g7eZKbN
         np8Q==
X-Forwarded-Encrypted: i=1; AL+hErE9ESI7/HRIzTDkfA5jwsaBoRrBNWV2EWR48ketnwKSKYICOfo4okt0kaMzhPqE7Rdd/Dgvq5iAMrg+PqxAWneQwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z93XqB24X/+9d6eOJnjjU+YD0m9ZQUe9YeyoKyQZql+3H4A15tU
	1flH3Rx2GeHq6N2iEwS5G7ZdtJDtYogCWqXbEiKYNggZDJmCJGkK2qAa
X-Gm-Gg: AZFdTZdY4yr/rxIzBomYd8rFxt9n6yEuYqrBbJyHrYcNe1RZIOXEJUTPn1GEt9rftTd
	xlss79DYmcAa9r1l//ObM3/YNFRKJcvyDq34woAYNJ5s9U3Szc+z+WN9OeDb6cR6IkBPgBPQVsq
	/8K9Qq8Q54eIcopPEGN+D17g8fuQ0JzRReOkkJGt0VU6mM5dRgb34tn2srdsASgq1viNfX16fWH
	mSxENrtiaB8yZOpSTr0Wkb+Q2u/ed0SnRqY+ae3+WAfdSRQAmcamrnRXFuHz/n5Hx8eYBF8Qf/L
	PyvzN7luBk5vbNbB72TuKEd+4dno/xJUYjdsRp70L2dTyyHut0WMsuQR3ectjzttiLWNeievMRP
	ElC+V3zIbMqr+L5EWs22xYkN1+b5Pnmm4/idqQBJLPK0QZzelUyrRbSgQnQ6tRKNNOB/hHbGJ4u
	IdptgyQcrgeg1o7cctfVM0SLZEQ1RTCXqFexolLK7Ata0Br07vx0lf5oiyB8KvSE+3joOCPjqoK
	LcxyMghGFqKfKrNyD60PSF1y7+pQmfFMLRhstHE1G2nn3/u/M0l9HjFztADiSumdAc1o/I5gYH4
	tkagJM5ZU9uRb6QCwuUyH4q778w1d2GZq0UsGo+TMJwVdO89s3QzLkNANfSHE0K4w1UjVWSRBmn
	3gJWP18dW2RmzzDdikUJjyv9PChVTzY9CcDGNBCyrw3Q12v6XThuXnV9Y8YC402BaIDGPRuPLaA
	==
X-Received: by 2002:a05:6000:29ce:b0:4a7:1fca:e52d with SMTP id ffacd0b85a97d-4abb0e46a88mr1474050f8f.9.1795134364578;
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
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
Subject: [PATCH net-next v5 11/24] net: dsa: rzn1-a5psw: Set driver data in probe
Date: Fri, 20 Nov 2026 00:25:21 +0000
Message-ID: <20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index df3b3f75b489..0e4bbf34ec27 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1221,6 +1221,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (!a5psw)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, a5psw);
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
-- 
2.56.1

