Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608914;
	b=oA4rBjXIb3AlbXXP3IGaYsi5LceKo+gIu0hOLg6e6zfk/PK9HTGFu2O3vXEabQNY8Y2G
	 gBE8DgeSMyltVhPzpsagTvoLk49FTXhG+BJw0ESLsif2CnrtzHgQ3iseD+XfctWfqJPwM
	 yKtOjdk5jeoZWQJwC28mxDgUE3GIiRN+3U8mzmahhEs37Vtw0dCE7CVh0olmMaORd8eaz
	 rgAJy/pqYpcbQsLIdKRJHY7MtDCkAeFQhbpfVN0e/nFHildzLHVfG/rjiy6SQqCD2ga9G
	 hmbFu7PRhvnOYd0/wf6sIgLcGEKRvH/VIvuPw41HqkusmxbOhg2Ur1D4OWaUo2tlWYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
	b=WHS2c3Wbuc54Up6onlsuk6uhh7HQlNdOskNRb9kbH88uVKUyv+YC1S4gYjCxtGwSG5iS
	 UELwIj7tijfJ1W3SPMwyD+sVy8wYOp6On9oLC53CgXGcgR8m1A3RAnSqv52B1b6s3oSys
	 StPjvKISVzJuvxStLu/0RSEofkjVlqdiwZbVcwhphCg7MnbQ5xZdljJWIAbFc2kg0aduH
	 2fMlyzjtiImIxoFXzz1RK/FAojxFlSBI9nC+F8Dl1ObxTi4yU6vwqRT6gd3ZE1Jo5/wp7
	 RIjVmpV+WEQr8xiO/wxsGJSiB0gYzkCmRpSfh2/HOjOWzUbJX4IuqQ3eXffPhy08+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X85TOkdJ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9962606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9962606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X85TOkdJ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58414105e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608912; x=1796213712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
        b=X85TOkdJEVhcb6xeLnK1cYMl4swmLYzFbN9gCBJulecfPqWZcDt5mCLbK8FHCqeD08
         3UAJw3vNELa5KzowjNG+6JbKQ7j9NAvwOP75FLrDf4uVPXs+viVbr5rxo/IP2XQRLLYf
         WD0xp8Y5tgIpnUdbhRocviC12DKnOH5XuIygxEUxrIkdQoeeKZuzDQw0yjs3mdBtPJou
         gE1K7ts9+lxO/9GjsN0Re63xWPeSkZ6lj8p866Jl2M+/PyDgbKGqTheD/zSOyMiXrxQH
         5YMbo7L9xY00Uc/BHr44O/AWU2YU0NQMxPhhLZLkNwyMi32SsJpgW4zzRwSC4ZVe41uM
         g9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608912; x=1796213712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kfn2kJaqj5a8buHgct4ElOlQsQcSrldmQLwAbXiDSN0=;
        b=f0zLNj895kxW2NkaZWZwxl4Gtd5CY9j8Zi1Kqe1KfY7uEOWYwYEOsNoHgMJVUo32Hb
         eor3+DKYgjivg3k6qUN94rSWrI9tkD8G8mpBXXosTgxo6IUirj0063CEp73A1JJjeNtu
         /5YgNeQehhkxNHlTnGRqivHS4ncbp8+vjiic7nW6bpbaBbEvXYrOpafIB0nZJpJz7B66
         A3msmTTeB3vzLojXgvBp6AwMBn/vDPighdt90adlijPiKqNG7jihVKm5kVU0sTZd5dAM
         X60ztETSP+xB1ibSPrsliGoMhcj2Fdcr5vAj8RJ/q0CqIZMTvXd11a7UIuyc6dTSlvv4
         U4OA==
X-Gm-Message-State: APuU4Z9EtudsGKuZ3KfkhK0yelpKTqkPlbacTpeXhxTLUFk4ByUI5WoD
	fGU4yQUQ5KYs/XhTVlfP//KVYH/YBM8ckLQVaP1y7NQPDqb10XAZ1cHz
X-Gm-Gg: AZFdTZdrG7MsjCVfugSb8FDS9lOaUXNsfAYfe7FMlw+iOxZyTtSdcCLxtpkJWbjg7h6
	IOUt0RWMH1dUDxWbWikFbizC1ryVuWmaiEQwf5c3xfLD3DTlcmnZeyFVkFv8zryc8PfgujuWp3K
	4HcBVjTfbI0LKcTJELZnkzEAKdvr5NnFS6JRLx1fTJhHu0Lt+su3AhLwMYRz++crBUT7pzjcjb5
	RuAg9WZUIEFW7t6zjVFNUhyMAIINCRO9yKxICVDNk9Nan4DwoDnhE0G2BLtd8GkYGf/nl1VD2tM
	08ekllEHR3WURjgT4UkOXT2xJqcNvHpBo9qITrPd1TuvsuJ+9mAzkaDD/Jnar9GHpaBZBjBuDlg
	5W156N3drRSC3XMxAoREQ1pPmXvjsY6HfMwZxTm7Mzegl+N1nBUF5cOGspKGM4gqkhnTVfM+Jv1
	OB603PqfE3gzQ3fzAQqdI4cMdqUsNq7Y32VhlqOQEnvCqro/4td4C7T0UQskbVBlYMUsvUXrMYP
	vuF65QLHoeiVAwKcuY+v5fJzLiIutHo7y8l8BtPlkbHK76jjt19amtaO58eaQlnulqhZn82NmQc
	CsSsTxC8SzaOgRyFxpISjA+1Vlg/PxTJS6OnnnxOEosv/5oQ2Ttl5C0YK5rgbstvVyDfko+G1V3
	2lZ+6QjtYMXuAsKJpQjXmG81ifzLtYBksNcYzz6QbDjHN7am1m2yoozLI6BVca6Rot/2FpqgFNs
	eWW9NUWupKtJuAhhe80iXGPPk4TNIGjQ==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr344179695e9.32.1795608912020;
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:11 -0800 (PST)
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
Subject: [PATCH 4/6] arm64: dts: renesas: r9a09g057: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:46 +0000
Message-ID: <20261125121448.180847-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The GBETH nodes on RZ/V2H specify 'snps,perfect-filter-entries = <128>',
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
Fixes: 050ee38d0002 ("arm64: dts: renesas: r9a09g057: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..ee8bcd2bc767 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1664,8 +1664,6 @@ eth0: ethernet@15c30000 {
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -1770,8 +1768,6 @@ eth1: ethernet@15c40000 {
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

