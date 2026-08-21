Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F54414A2C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346704; cv=none; b=WKeQAvaE2ZLKq4KHJJ7kh1C4CkmeGUlzsWtaQa/eyBf1opnwWj9iPk5TfNL7rxS0k+Tj51rcBp/l1YtFX9aUJTj25GkxDCTLmXP3+XTtKJoVR3u3ZgWq+QB3JExoTSTXc8kngoclIaANTt2n2c0bgUfNPQBaKWpIh4zUVpPxWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346704; c=relaxed/simple;
	bh=TCfg9FySj1A3MosqchjQdCzn5q0GtaBDifvwCt7XMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXq4TZRcJ6WJ6CXW6Xpo+HZ5dXUvvgQjF1sZaE1ylAihSRG/7wFdlvKNMIT1yuifoaOkodgTOaTkYn9mcWn4TASY37qk9ur8iytFonzzAxBzeU0qYeBuCEG0HNzbavB4kk2O4CKy2x+W4oXH4ixxm8cpOiaSuu23qMvUnQzCzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IudF2TRL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IudF2TRL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacf197759so20356305ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346702; x=1787951502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHPkqe47KzasEbjrOs9jLV7PJvfAFaVGFaYKGVwJi+M=;
        b=IudF2TRL/BKH+lgj+4bnrsoh+91G3vbCIwgmI365CpQ3XuI8SpCSxueJNt//GTbrXr
         WhTmU2UPvDiZiKFuBLygVqbHxZpjSoCi0GjA1nqlhhHLS2taCbj1avBcnOfM/zE4tk4e
         lvtrzOORFm6KPwb1Z0g8iKW3gOC+YVkCVHtnKGuXJyMArtFMP/Sp8/j//wZIZmAKq+aT
         3PctvpbzSpLB9/SpSL+gK8hRA0OZ+D6GGuriaFIHPmSugQrMCivEW03vr/cTNzpxNzit
         53YIxrQPumYNfUrPzPlFDHhMURNaDcAPKjI4HOeUfcH8rbKR4yQeYh07KeNTMCdSoFHd
         SxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346702; x=1787951502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHPkqe47KzasEbjrOs9jLV7PJvfAFaVGFaYKGVwJi+M=;
        b=bvdsZ0+WEPxhvDaNanyvawVsv9DrSZg3Gm6ScAf0nfpOxfBgzMYhFW/A4kLTeOy2Qh
         4TI3OAE/twsGXlH9ywvehhKSaED+Eo4/1qHJEPA/zR+2kBJeCaqPradZ08SVFM3GYVNh
         iGI2qwhkLgqmDJwrqa6Q8r4hpW8xGJfQtS97kwCxulcLVeyWRBA5mJmrmrGyHy73n8r6
         bUEhdzJp98jc4rtZZh3khBTKGuMEveJ/ERO9mO9kp9w08shfJT62hvb/mnsj4ycQs1IU
         L01oS93ezqu92u5a52Hm07h8kPFmCveQ1u/QVJtx5x9KQNrHRdacTXXPqg+8BaL5w+6g
         FokQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIXt3GSEWa2/evPv8n2Mcjp1zVQAnKmwFfHb8l/VHQR8eUz9MAmD/+HqlSiBMJaVe0HYSDvHZBHoannQtZlZu+sA==@vger.kernel.org
X-Gm-Message-State: AFuF++lzzZmTp5JZ1lTrjDTpJgbPYwAltkPWbnziGPxcDZVTEYjrbeFy
	20QSUV6PbB6tXmR8rxYAoJJwbTt3RbNgJSWw2VA9hQHgfQB9bI5MvaD6
X-Gm-Gg: AR+sD12kkmg4gXmEQpjutFT4aL2QvuKZlCDPfCtsl3ievAEByfEGfGK00a/i1875U4k
	JSuTt7avWkdAgBMnJVG9+QDWUVOP/RO1quU8YXlhNGSqXTwrj7w7u8I1G7SQR7qguIT5YZKtgPQ
	ckMPymt4eUDzxc7vPJ4rx+rPgNoM+e/rbyVaufl9K5sZEvgT9K1/fxAO39ukOdVd/luSb4nyk0B
	fQLNxS3R3zv0d6gO8WrFQ/XjFTW2uu4wkCAXf65m8tuDnJgnQom/eTfTQueN5vXGHfrhWkmNYNA
	ukHSbSPOb0Eie89xMVpkFJVCwe3gJEQUVew304GdwCuIBgUk9uIM/A9a6yQ9hMoUE7l9mG523pg
	zs1MsoSbMgAvrdTufEpoma9MIyWXHhbWvpQUqIb5LzMsyvevxKKVt+VQMHrZrkgiainUcn0U+8o
	QyPhvwnzuOF7ne1L0gZUsrlQCGYSGXaG1Wza3+WhCV0/IVe3sogp/jpIwJpBKvZftDUr0W2oGIU
	keZt5QNY9a3WyRJgkbk/vBOOm1+GRt3pHPFLb+wuALp4umJ2jYHg0M/ouZVSpDrGx6cJx84z9Tl
	bA==
X-Received: by 2002:a17:902:ec8a:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d64b185640mr162835195ad.14.1787346701853;
        Fri, 21 Aug 2026 14:11:41 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:11:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 08/17] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Fri, 21 Aug 2026 22:10:23 +0100
Message-ID: <20260821211032.13554-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No changes.

v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.43.0

