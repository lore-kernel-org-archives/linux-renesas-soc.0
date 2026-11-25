Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608913;
	b=squ6c/d9O0G4TXf0ywuS4VqBVDkawGZDB+968lO09bAD8cmnk8+imwrqWaB/xF08X/4a
	 X2HTKTBkEbPvR5/SHIP0YjNgFQAEaV1Hvfoa3UlJnJWDiOtAwVP3fb3DpMAGTktCwqmT3
	 RLZsxVU74rq8p0nVAUFTGvYRhgOKtcrdbrZ42y3Nw/arEKaUAQ7Q1Lwr+riOYMBNQWpvh
	 bYyGCEGqfMo9NwyiQLCyCR/9rccylEB93kj+s63xQ7PZBl2RIdmINOamuvocLwout0fug
	 R99q+myukzD3l/uTfZI9kHdX9QRaeijr02BX/MmZ9LmPgf4Hb8hSiPu1yg7fTwLWz0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
	b=veeiTWidViAL+IebNCfJgY4YJJ9+1UUbG2D63SczFl+fW1mO33u6x51/fSW6Tb2dlDgK
	 ozAG/DdM55boaFoyHkoUqeY7HqhhsLw77vQAgTrmDABRHVZYvY9MdmXEwePStxlMhcYix
	 spN/voIuZJkkoXMWvOPdos6efeIqjlcs4HQHHzoJVk1hnqRnQI73ovqGflurCUeXSFExb
	 dw21ON0z9JeyBXKeYlJTvO+jJiJTEb6hgqjwCSrFjkzRL6Qy9CYYhMCp5vpMjm9oqu9tB
	 WpXVULpbHmQDI3TotR0e58NxciKpRsL4VDka5tplfW4rAYkakcibZ29QjyxavVmzssg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEyeG03z;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AFB606A32D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AFB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEyeG03z
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so52815505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608910; x=1796213710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
        b=jEyeG03zmTWUxxqyKg6nGzX9qOISHJHIPn0O9EpFIEwJFxSCykLjIbR7KMh2T3kJvy
         /iZOclEBen+G11cSygOreDDisclVWt1lslBSJr3KalBLSR8CXu0JkkzwdFJl4MVqX2M+
         GDWj+gERsuvWIlX1Pr3qvyzBJBBtMbVO0WV6Fw1gXZAF3qj/1HT0i/bGD4dlXsbl5fth
         sjipc5txgikyxIKSie4YM3AoHSTclcRki7urqmdfnO3+J4mH+Mio10/f1dcBqoW1O/Rj
         MR+eJVzdAb5jVLTT5baAnPo3Cf8jDxWdqYm4+9t0wPwVZ/thv8tMTaS+5ft7sytD9QPZ
         QnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608910; x=1796213710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTcRLuWGYYRPUE+QyNyXCHMSGsk+bFHW03tmtAC6svw=;
        b=KBi2DNX1bB4+EtbSRa7kuP4+0/XLx5H/izRbHi83upWueZQ7WuQwkCuhMgwtNGuVuD
         G/8sI47rBKbriP25RGPf/lApoo6URnIrHuXH6Ya2JIUrHIHoSGD3LiaWv7wR/MQ8RUAE
         Ts26m2dY2VOWP8zvkEsYtuMNt0E+F+gun9QNWV3ODOscgMO4oYj+C6a8VVxxqV+9Jnfh
         oK8iNDhWBx+B1SNkXjGtfB0sfqRk9at1ieI9Em4vBYWk0SBoOBgnTtcTC/JIVjWV3Ltj
         3KU+eYissq2XCEwMlN+LY6p5eodRQe53SK6rWfSU1Ka2CeSH2gI2ap/dFr8L+4kALTll
         Pquw==
X-Gm-Message-State: APuU4Z+lP3wMFy/8C6/+rYroPBvWgLLBYPTAcEnPhihuxmUkyttilWgt
	HsRq8I6PD1az/sNntnwJmk7b/Hu0u8dJAL8RI0BnE+vB4Q1b4pdQgu2R
X-Gm-Gg: AZFdTZcmB8INxdA4kFYBjVWW9l79ZHbdescfQG2Vfgk0hXHsMuA9w6wVS22sIBuq+Ti
	lEeaqRyQD1u0fnUz9lAgwTrH0pQ779YtONredti7BQ1k0UXYug+1IUvkoTXJgqEfRBKRHRBcyhF
	t63w+HYFancfXxlgOgDCpv3v0xigiyFZWAWjJHQcpvBCINksxij/aCkj3c6WM914wmrFJ41gN2C
	zEIK8UZFx0T6CbwhEBtxcH1wRAAsoPPiu9jvr9lW8w27Z7z1rkIWZKzo8s2i/2y7JVvlt2gDhBH
	2SDaQpDL/IxnlD1m/y7fD7ZzxgcMK2oHXx9fUnbJxcR4gPQQebARzFbTNc0iKzHXiWjsUZchBdy
	lWvEbbluCSqaZuLl6BeX1uCV8syTgxtk8ICFceCbjS9Z6452SabSacSc3QB31BvUMZvIA2NL6S+
	WMN1s7kzF0ruXjvp0JGAQRL+v2/E3x0Hn8yZBHv4H4QJiCw0jneRG0mmrh2jmo9sCJYO7Sf8RAD
	a3NzA2tqGt9zBAN9XRCsV6Seprh2GcNHqO2YDYrUURdmYAqEwGv07j+dbAzOTleA43JshnrYSGN
	ZlIwILD86VcQ4Ui+FM1S4zWjIopcq3g5zgYQ2Vttsk+2DHT/muo1YvoEd/cviYcnFnDB4CKxcPd
	RTDn8VKxSdoCIJ2usA8G4P7FCnVmew+9yx5+2ALPdLfd/qOYtBkcvWtSiZkD6IivZHDuPd6aMdQ
	gJXmeeeazE
X-Received: by 2002:a05:600c:3d05:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb88930872mr360894185e9.27.1795608910405;
        Wed, 25 Nov 2026 04:15:10 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:44 +0000
Message-ID: <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The GBETH nodes on RZ/G3L specify 'snps,perfect-filter-entries = <128>',
but the IP provides only 32 perfect filter entries.

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers. The stmmac driver
does not parse these properties for "snps,dwmac-5.20", and derives the
number of perfect filter entries and hash table bins from the hardware
feature registers instead.

Drop both properties instead of correcting the value. There is no
functional change for Linux.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Since the driver derives them I havent added a fixes tag, in case we need
one below is the tag which needs to be added:
Fixes: a357a31c3436 ("arm64: dts: renesas: r9a08g046: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bb69e5e3528d..c67a9955d03e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1111,8 +1111,6 @@ eth0: ethernet@11c30000 {
 				      "rmii", "rmii_tx", "rmii_rx";
 			resets = <&cpg R9A08G046_ETH0_ARESET_N>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1228,8 +1226,6 @@ eth1: ethernet@11c40000 {
 				      "rmii", "rmii_tx", "rmii_rx";
 			resets = <&cpg R9A08G046_ETH1_ARESET_N>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

