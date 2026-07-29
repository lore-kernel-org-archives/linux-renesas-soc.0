Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0259F486E4F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329759; cv=none; b=Z7J9hL33k1ILaQpqb3UexeqLCdwbL4LyTOihruiL4LIjI1fRQEogPzlQUr0DbVky0vujQMj89gu//0d9OrWlmLFZe4Eu9pp6+ufrzQrUMfKMnHQMhph7f7NLvKwZHiFt3S30IthBTG/aZd+HnGlmGzElVColN0JDg2yfPISK5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329759; c=relaxed/simple;
	bh=IiLPp4PIRjg5C9F2ratuBcgARkjOhNMRvwXUs2S6kiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftvqWI9sOeaP2eMWJOkWYPwImDCA1xX+qgH78uLsqXTQOaVi+onn2ee4A2Mp4hZoKqqbwyRvXsoBA64SeA4y9NrmtIEMePaiKrBMzz3EYbunljisbRpfbNtVYDgNNcoPvhvKyc54uHSUh2RkdI9g4axEMNyvS5LmmxqqavdF8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REa8dKTV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REa8dKTV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso812313f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329741; x=1785934541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/99S/3ENJvfT7IYW+hXwiTuszeriwZH+fXQ8iDS3M6I=;
        b=REa8dKTVHkXqKTfu+cF9UqgXGFeTUD3woHADoHMP49JLrlEABxzJH12gBpIQiBpxH7
         sDJ/IY7lyft8eWxFEBsBUioxRoxTpP9W9vgzA3WkaArr65lQG44xLIHp7KmItlzQLiHa
         SUFsRLOPTdMNLpwB0vR9IQyK5gbZnrXexfml/UXKmstz3aks/c+D7KvLre56Lux8Qj60
         Li19KlUUWJ/NYJdVzymXnTXAZ0UQmrCkHy8itposcOzr5wyb1TIBW5wH1KawmvOM3dmS
         O+9Da/etluO1wE80gxMCuuiBV2KgL8eQy0QFzvIqpZkVrQVn2YEbZLi1CF4qrHH3OWzI
         nQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329741; x=1785934541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/99S/3ENJvfT7IYW+hXwiTuszeriwZH+fXQ8iDS3M6I=;
        b=fZwXaLWS5xVimVNaqW4IeYdU02yt/NCD8NyxGYN1mOhf34H+pzGI4LxscudlNmfLfb
         fvHZm8pWjfHC8rG4BKVxmeaVZbGnW8FkQxnqHVABY/e2Z2t50PZXmHKrpnLy+V20xe6Q
         4Z8kPp5MeFjho32oX/+yK1cK6PF0miFdBFMeBE9jbchTrYTTwlKia21qesRt4FhOwZ+s
         AB/WwWbipEA26EV8UBGvI/RiH1Iu/eOykPzKb1Wguek/mKCRRGsGvh98wZkxeNRa186z
         KZUSVslF43T61Y28TBmZBoMMhF0GinlCMdF99j4dTHwFFk/T2g5p+OhbpXFKaLBRgqC6
         5TuA==
X-Forwarded-Encrypted: i=1; AHgh+RpsU0R3U+4PJrJbYE3h6O84iHF8sgr5kDcJl9tM6p0JWPFsWKYVsVPLGccvdGUiQsZeZk1OZfsCy5NgAig7DIxClQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJHiXfbPk6qXmPWU2H3E3XO1PyrOT7VA3ugVo5Rt2MIxNFesI
	6mWadV88FuS8AmEXIAakYld7+wAxGUX5pL+jWzgINcYtp4SRYUMaZbC5
X-Gm-Gg: AR+sD11UumEIAfsF8co0pHXT2MFfWUGzWpxeJuo76bUAIY3wRsyJT6wMqqve7BVIfA4
	6yIOu7AXUMOMkarZYou+NUqebltn5xqcqIR5Cpz9++o08I+FnBGImdMSHZuSW4OMN2lwJ5uncXa
	lCouDXxaNdf/yi8XArhrZjbx4m/NsDKQ1ymV2F5ZJbPX35QRrEVnvzLzOvjWg9Xb7bhErGOOlV/
	UC/DzWsaB4QMkQN4TdfXThAQe9xeIO3jzU5rRHFiUiLr+L91MxXZeIK5VQDxxrCSfJl8qA1a569
	DOtUQ2Bwv4GBGaUqZDe0/pVEkfQHlFcAZp6bbv+6r9IvLIQex3w8z2O9emJ7DhkPlyvZbBBAY7A
	rYaEK7pxtTqQNGqaDLsTcaAOyMnv4Nx3Ri16bFZ1Fm5/+ZN3y9SCledM6Jmlgl11H03Q4IaL2bt
	MYqx6xdeVUjP+nexHO93PdzQ1+afEba/RO5QpPjYbfTFPKipZ2uvbpCaYMSOs/MC/SJWFCw1uAV
	P0ttnPKbOe9eQ==
X-Received: by 2002:a05:6000:2302:b0:47f:8c78:6b3e with SMTP id ffacd0b85a97d-47fbabca25bmr3080620f8f.5.1785329740956;
        Wed, 29 Jul 2026 05:55:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:39 -0700 (PDT)
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
Subject: [PATCH v2 11/16] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Wed, 29 Jul 2026 13:55:03 +0100
Message-ID: <20260729125516.230757-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bf0dbac66d14..03693f01228a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0

