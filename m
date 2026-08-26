Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9D46983C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766563; cv=none; b=ZDyoUyqLhwTiYJGXKV6Jv/thNvjr0mejqRNgllc8ZySnsDAhkWYdUnZA1sNuTPm/29Ydjr66cGxsgihAWd7l+kL4A73SBEvyyeG7pjWkIhcAiRwH1us+xwzJfNHArX1Y2OBjMAxqYQTq4eoEr41dksZc6Z9P/LLEeFZEZUGaiGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766563; c=relaxed/simple;
	bh=lO/H9vG52tHh4g/YvK/DqO7kXiMl0LxMerQhc0b8EGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FE9+ae0R9lG8oWbeB6WulScG+mU8kGEdJh8ex27PGVDePuNUZ9nZVXVYGSpv6a/5LRakUZg/H9cyMr2aE5vEeJANoP8RSUj0Gjz+DjTGE+aQFyL9k78SIGNPWeGWDUAcWOjFanO+x0YcFJDvDuxu4LUGWO51G4LicN1yWVk/k40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAqR/An/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAqR/An/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1675305a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766547; x=1788371347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=BAqR/An/YXb8c/92pr4qotVmL5qCBIOhHGvRiVUIItBOBDghFbbJmtvBHwc5T33XGL
         FOCqVqt0uTTZmdwQ/fl8Mb0O2kq6FhJPXZQ5zvaw9R7CfcmVFlp/l8o11oGe5nyoaJwX
         r9NyYTBO/j/zvSy/B2dt7cESTA88OP5LU0DsHsrZDl8nKEM0GG6UjVZ1GxUMgl0mBUXE
         YYRjtXyKCNIBpvFTw5JJdcvW20ttj30wpB/iDgxIsV4xlecapuuTw+49/yh7lbiz/iof
         LcmP40el8QFjFervwd0e9hTtG/hJpGcLc0Tl9d8NaflZ/qZuRhP984WyGoXsTSQoQm72
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766547; x=1788371347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=gQBGGR0CIKvIrt8BdtCMBcjWLIhrzZreJuQFIMnqhN4LbRcIGFA4bnLElKfZKcyY+E
         6ANEiscCEQvydM/DnIKpw0Q+N0w+hY6SMSm3d0fZi1RMj5TLzM93hx8+WTSzAH2RrbCM
         c/mQwRuGFpNGab5byW21ygPpxLd6s97lY9pVeP/fMWDT+8VE53mCmQu4ZAt2w6p8EWrF
         eI5qquDCaCq7fkHE0RBxBItsRpHtYk1NHN+g65tXPZsq7J6/UKxtPNDOPSEdaqj987qZ
         SsgseDOAmMFjMuPfgZVUuVuwhpCbp6sCzGhqxEf6k6a5dTyHchXzKRf5mQuxpx5qj13y
         ez7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+m+Pw2ATJl1RdoC4ypk5fUbJ796TEwp3wcmsLX9DQxcaQ3wJJg2GSunyIfPHecHq3l8LI0SLvvTo3vBdJAODv6g==@vger.kernel.org
X-Gm-Message-State: AFuF++nd0Ir4PhugcZ4HuM+9lcLRSRIk4lejsI9ZGN9eHbcNZEpnQrae
	AmiHaRJ9gY+FuDL4vFM+gzlFtgXCgINe0kmbOfZQNpd8lhQHZluxliOV
X-Gm-Gg: AR+sD11joAJj3uPZ5kxncKwvg1vB7y58nr04+84TIX3TrF5sb12vaTjZt6T0T36sT+L
	fjrIHCX/eOr4b+tMbutc7O67pep/eUjWqKwXHVFU9PocwHjGKjS74IlDxyCtH5sEOc4nyj1ACut
	9Cj3nCriyKH7zYSPVhrbDkq15SMaW5f3sSO9nRFjmaGmvLKv7SBbErZc75jtUXrSromJBdKimsA
	R2gewhKVFD91CRUVVlyVqYF1qPYcQPTpF0aMG/tzBs3xbSG1IQyR+zZh/OuRY9Xrtd79CiMnr/r
	1RrxpjFBAoqJ9FU/0ptT8BszwN7sSpy6u+0t66gdnOkR1UPK3iQPll+NPUk99Bj9kUAetpfHqms
	MgZqcRY6xd4pkqaJlTHDCi43G08xRd0tRvrN9dmAMqcDsWclYCYrEm9pNC9HoDiaHxNHgUmaCgj
	yCyx6b3j9bgmdI4HpZW5unQCeMxwJSu5Gp1ECiDU9l8Wb0I5agnQspheSQY/LdgP4h2hj05Mqz6
	ZvCWUJc4oA9iDDaHBNQ7NmG
X-Received: by 2002:a17:907:c8c6:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c250bbcdcb2mr1121271166b.7.1787766546793;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Wed, 26 Aug 2026 18:48:43 +0100
Message-ID: <20260826174854.199139-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index ad38aee2efb3..6ff145dc81fa 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0

