Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608915;
	b=lBX05oLRZq/tE3vijb3ocnsb3aEG+RMCq6yown/9YTXm7HUn+S6ZoLkIAoUvYYpXDalI
	 h2y8bnu7aXA4bkH+GqKVVbv193vB/9EjoDpC+eRp0bVAHSvVhwEaSQ57qGvbTo71iwPYa
	 H+TQJcVdBFk2d+EJSuLqI8pn7r3ATSQlx1TajKXYdeSyYSdFEgr9Br3Eosd6a0uCnegSv
	 y1NFaRE2vUupbaScXjWwUlHLn3XspDhoX5r0O211qBspO2/9ypfjqnxB9cVFyD9OKUIIs
	 GpyQqVdlJ3aBKNfADBmlEmwN9ecnZ9m5b/s1vAGXO1/h3gi3PHyRi8CS70EnNOWnsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
	b=Fbx/KVV+9MBnEPJpRqtIXmFMuLdGUZD4fECQa0OpSrBd4ySjKvEKoVfeXUsoEGYk1gV/
	 2fClPCiDrdYKsQvT1txCD2OFWWe/9mMPINDkmjKvYJWvWmmouzyNTgsc0P+EspISPK5n0
	 pug1hNVhOqJhPfvPY2vwcBoPU8kXA5Wm5ywjh47NYvnQ3/+732NPzM49LwMdXXE3ROcBm
	 srkELADwXxGfQpa8uHzuEMOtta8oOtOdgtftFa2hmt5nQbLMveW3KPF+3Uftfj1kJOVxp
	 j0oGvCvH9g5Lc1gc86VNf+vPut3ZytlQhWWhltTP+8e9iXHeio15ZT4PELuigFZMm4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDcukgQP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E86606A323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDcukgQP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so49843415e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608914; x=1796213714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
        b=EDcukgQPPjyacoKhZp1PXt2no10yFLFOY8j/KIZ1FWPVWzsbTzd2WJkiQdARnF/esJ
         gQ2qAq2etSRWIN6DVAaJ9OXtmhNASlqcOjEcq7tp7TYKvkMKKFdeTAmU0HbuEAK+TPx/
         HULZfOGIllVPTt08qD9nfiPv3EmJAhnsNfRC67px2vuzVbpm7opZ/4qw4W9L3ZD7wKlQ
         YViyWhv5WLw/yNUJg8bjDbRS59b1fXy+JMIY8BA5t19j3zFVljZhXl25ZNjgiyw0L06i
         /JtNF3M4iW6hi1sJwX8bOih+jBnRa3fb9z4wwpUzuNmS25c1DfdN/R+LV5tesQPftKXQ
         NAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608914; x=1796213714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mob0X1OYukGGK2WuupxgDLKnjU2HYcGtn9Q8YPfS6mo=;
        b=YWCc6mpKxS2FHm1FO+tMd9IpM7QF25bWICi2oe8TfRa/zIq2GOhx3V34ZHrUv8TZeZ
         ECMGTTjnNKG2iGssexGlvNptPe1gG1No+cjG2+3VTJa7IrcGILJ8hE2zFSVjdFRsDEMn
         q7xe0W0K8MXBA1PxEAJSotsOZ5OEVQiHVJePpdgo/m7Ay/KqUK05bYxC2ieScl2XYY78
         075j5OjS9tdnAuMXAzSeNB74SYqjtdsvV3J4g2lWyf0SOomQLPVqA1z+WByC7wmK9QrX
         GMDmRl4yptD0e9qAK1RRjpCEzCLX1+2uUKA4Y/hI5XMEFCgfnzM9t/rM8KRzDfnNYjGr
         131Q==
X-Gm-Message-State: APuU4Z9hLpUY3YY66e7TIUqoAcfcqhbPxrYpgVt5AUYttftTJgccCcZK
	rtvJSWzuf3x8h1HAUQlwnlZbyaAl2eaeCmBWqbtMWqYCXnoa4xsfQF8F
X-Gm-Gg: AZFdTZdfzKEKmLMzEdI4aSrusmknJl+UM+ChP90eWGb1zxhxPKZMdLshLzIeOgi0n7t
	6THogoMFAP789bqHb3diJFiq3z+lia4IlGjngAz1incIDpb2EoiLvFXl5fj22RsIp2I6fyixqk2
	bk4sCe3/aX6+YlPcQ+6wRJ6vZZZPdQrRw/hsKmYOAzBxpsxl9e3ILaqvFC7L7rkNyDGtFGcvpIr
	Db/wg6PWD8ymCBlgKKTlJKhyhymPiKD7ivhSzHH9+mAjIrDL7T9SJIeLw1wqHRIWIKa8ux5WfrL
	y8XDCsclaLTIpy+UIc+4NvhyRuSUfjPdh5cDfNLPM+a6AkcxnLgbWs9FLNuVLTnrwXUMxoGOMoU
	5pjb3bVKjqBNQwPJ1A9/zOpVGGH80c93zEmlpieCbaNF6lMOFWBq30c4k/NqkBtPYPWzfinhLnV
	GF5oVP1+TCXhO9orwlHwtJgBy/fx103e06goA7BT/FQOcJxohBqd4vN9QqJWHaw7dXFt2mEemxQ
	WCwRgRZsAvyUVIcSXmlZOTZpB7ybIivDVpB6UBMpiNPDg0syM/OuVKwoe9CFzWKbEhOcl8RoIQ9
	/ckreVyshGPC3S2EgfevmhVeLWjX4Ey+Zy8p2tjavVgTQCJMa3LBD9f19puqmAHOgTeHWV2mbkD
	GuuhWUme9qv/Ugy5VgPDTEeleHgBIbMbriaI4nBcNL+zgm1o+FyTPD+OKzEF8DZv6ty0rqBcFra
	4QWwKzoSTO
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr430512255e9.23.1795608913596;
        Wed, 25 Nov 2026 04:15:13 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:13 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g087: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:48 +0000
Message-ID: <20261125121448.180847-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers of the GMAC IPs on
RZ/N2H. The stmmac driver does not parse these properties for
"snps,dwmac-5.20", and derives the number of perfect filter entries and
hash table bins from the hardware feature registers instead.

Drop the redundant properties. No functional change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..0e8ad031e14d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -568,8 +568,6 @@ gmac0: ethernet@80100000 {
 			resets = <&cpg 400>, <&cpg 401>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -724,8 +722,6 @@ gmac1: ethernet@92000000 {
 			resets = <&cpg 416>, <&cpg 417>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -880,8 +876,6 @@ gmac2: ethernet@92010000 {
 			resets = <&cpg 418>, <&cpg 419>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

