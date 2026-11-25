Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608913;
	b=z7ZJPdwZv3emz2OYzvsjz1v/NYSqwDDOuBCi/WHCS9Ngi4cClBdX0O2apjmyF7Rz+i8m
	 6J6Gqpw54crVIyAJBTXIbpmM8qluwQRFcNP7biseOZ4jtmPlZ7RRyy6fTMiiVk7fh/Iof
	 LxfbevCgnd0XDKjVDHESvAmwXDaofbOMgDyuT4uTW6jESN01SOHqoLbEM+6TC2CfwWwtM
	 BwV0rCAS/QZEOhup0V6lMeaZ3tGxoC/NQUzD9kTXaJLzNeDC/TLH8WHtxCVrV8VW3jvLe
	 2dtyoBDnV59zeTnhmN9V24JpM2A/1OUlCwqZJx662THx07YyPN8Pn9CXRaxWm5SVieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
	b=5R3kSsOnW3MHp0CbPZt60NrwGI66jLyDNxf8Gml5ETrUBSaNfGcVw0FMWQ3wlYXaJY6o
	 hUWNC1H5JStpjTNpSoc+oio1LyAL+vfhYSaEg79+MVZHnn0KPef4MqXbFIiPeFB203jOO
	 9YRzCYEjk9UMj2ZUB4TMCzTjhfbzywaUlDvrS6k/j70+fbz8Ycnfv7jg8q23RzlnasHv9
	 NgVObMyyX2P4Qvz13aIQJJ9SL+j2zxQ9jPbs8NPUJ1zWexO4YnjnlQR6WQt0nh+dvisbN
	 AroJeQnVFWxMtP8yqeVySHVXM3p8jS8HImdVanCv+FwUj+u/VoLtBtW3bOm4Obnxlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCTqckg6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0513606A33A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0513606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCTqckg6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso30781875e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608911; x=1796213711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
        b=xCTqckg60QMthaxAJHaUasTbtBPuPSyIl8cOM0jeiyfliXanyx2V7jhs91mYC5KsvE
         Lje6ibWnt8f9RX68YX/sM2w1S+VIt2HYlPMY+mfIJhfKqf3GIb+WDVztWRDLrxhWsN8j
         nZwbcsuESs98lC8WyiEn40wEtv2M2oEmEAs7NnPBC8FKNNynPGoi1ydxvi7U9xHZGgC5
         jz/H2hUWYSE+YynLyfwl5XSSBojZmoEqt4vcltnWsV9wXx+Iu1X6XgRPbfC/VY8aZrEd
         SPtfBtnwvSA2CoEV9ctOWkvEnrCyULSQcDTOIQhRRkkrA0aD9PMP2Ki77/rkQGlf1L/t
         WGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608911; x=1796213711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaAOUY2wWK1rm0Mwk7ZZfEtqH9qud5mJwl67pEKqLpk=;
        b=2KIwyXZgqvEE98BIwdN6rVbi31jnQXaDhDai3YpysXo3SbruWY8ZzDpDXTSgL4/cE0
         BX3fG308KxIIgV8xa57pk12JkCsSUpF0v4zctI5OODv75t3S/Zo169VPDMPwMUHMpT0J
         u5BqSeAOvdmi9y/C6cbM2rOzbTRUAta7RLeIl7qx5sxsgWmx1JwAhdERM/BDPB9FvhgB
         MYBipM0I2skMUxSIUdBNpIw7Vz2s2wX1zB/zdou77MvsNA/Q2S7dP2BCszaBbWEvp81d
         7aYlmR+LtBshvojz6fJohgBQVuS40mKZpIGRs25j8BezUBDL+QXVtr5CirfH1jU/LjfW
         jP7A==
X-Gm-Message-State: APuU4Z+3DxViLe60Wpfnx2a9al3B7O9HlukTv3oc0Gpxz8mlCX7QV8oy
	marVM7xXbn5zbp/xur7w9Uq5cmc4oUQgJDkURxab3Ejww8SszLfjzDPo
X-Gm-Gg: AZFdTZfYu7p60hg4FJN842t40UpnzUuPgUTTj5d6qBbaboCSqZb3iXjmqps9lcKnDMP
	JzhhcMIJnh6KEwSRBYWezDC5YwdEbZ4BV3C4J+qxbGYCpT8x752uTsatAfzi5ps6NUffFqgrFV5
	fpuYjgFrFO2ycAKKoXBXHxRinM4sIwPlj/ugKEe6ZB2FupuD+Rz5XiNfeXK/Wq14VNipQGYemfY
	QeS7MrBlyaOW3JlPuiLDbuHASaeuU2d9BJAjB2aCzwXoNg0R2kc2ldTGEIHdMP+6MX+6Z+GHxkt
	BZaeAlg2nqj3utXHzb1ZOHELj0wjgkxMALncWbv0RyM37/Ztcot5sJrSuDpoa+cOjx1w2ZGdEuC
	1U0cjXPmTClxXXUogDJSfiK/5r0gc4UH6qa4/Jnq2UB59MS+Fmt7BYr1IwTVld0AG+85q5a01Sv
	wNE8I/PRJnEMYGnwC0t6OAdyHoD+gV+Enm+IzUnbsvO++30LFwRL5SUV2zT+k8q8+7hc2BbLfX2
	uAtjETTtHLpTAluGPGg7QvCZOqYe57TCuJylFi+HlupsbNF/pwbTQR9W4QO4JxHbKAGC+5uM1+7
	mjYk45HLCDan+61rCNc5oXLTZYWtwqXB0ZrojVO7YbG8+6Q+wBDtaLI6VjdIr5oKKtwL3ZoHozJ
	CQP7l44OhY+bt1ph8k0mT+OvpUrONlmUyQtOywurrycxpmvG17S1CwZYUkGmjgHY47iGm5VDNJT
	6btBXedM1LC8nnj4l6DpvkBH52JSVh7hQ=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr367124605e9.25.1795608911119;
        Wed, 25 Nov 2026 04:15:11 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.10
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
Subject: [PATCH 3/6] arm64: dts: renesas: r9a09g056: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:45 +0000
Message-ID: <20261125121448.180847-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The GBETH nodes on RZ/V2N specify 'snps,perfect-filter-entries = <128>',
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
Fixes: c8c8a57c5b40 ("arm64: dts: renesas: r9a09g056: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 175e24c98e11..f4bc722d139e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1534,8 +1534,6 @@ eth0: ethernet@15c30000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1640,8 +1638,6 @@ eth1: ethernet@15c40000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb1>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

