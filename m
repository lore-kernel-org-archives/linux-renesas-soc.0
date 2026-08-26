Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057A41DE02
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747275; cv=none; b=hoZr+ZQt+vxKBHBucLwGC+DRzq/HBxV9SUcOxK6L8ACGc+vf73NLldm8riCykgdUDvQKOhvYHEiD7Tx7ZYR6ZOmxLqwIefJE/rvPnw20zNptvgbk3W+QScrR5ycjbV/wmBHPddFWdaggwnoZ6LTY9r+MOm/lz3/1PVstRBbeV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747275; c=relaxed/simple;
	bh=HHpMaLVjnGjFOwMozhkdZ7etIGpCQqPextMgPphQpJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoG5IDioh3Xn53bR8hs5CgJ3U9fSltyRw9wg8a9/EvdAeY0pUqW5+k+bPcniUgNEscTBziQI6VOUVYuEt81dHy/QB20wMPbOHCA7KGmMEJ/rxWnTmMc0HngmlM25ubzlig7MlWFRaRulQNuzMRRBFfcoWg/Chk/0txjBsAO/RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXPrGKjD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXPrGKjD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so127953366b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747270; x=1788352070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KfLaf/pGQgfW338gcZcWd4Hv0dWo004/Besidd35wA=;
        b=WXPrGKjDGMj0xbqFhb7S7sR8A1k9PEJf2HAiUGke29yE3fOzDTdqcpILYI/CQRxWdo
         nHF/5xtOJRTF+AzciQdLz9sZVBj6UKvibvSqTJ6nZFUXt+RqQt1BXv70wHVmNhlWrQfI
         VRovtfs02FkyWxpjYcYLi+ZMIdoLDoxzkWEKDs6ltGcWDwSrSe6AmH0fffVB2NKhOlCg
         4IIo2GDJVjNR4IaDCDKJDuZbxTtudR2rZW0IYZbRCItYKEhG68arw3o8QpCxqzjF43zQ
         ihcxrlaH53GzVHMKXvbu4OOCdlnIvpAKyQ87F6naEJktqOWcNrmXWPBfo6EtNCV4QVx6
         HY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747270; x=1788352070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KfLaf/pGQgfW338gcZcWd4Hv0dWo004/Besidd35wA=;
        b=mmuUedRXwdykyuMG1cIlukzgEg93tPu1x9DoRx+Nrv2JpmWSwxUW5gs4/zIgNoHEsP
         XC/DuXBPWjRtzOW/488XUK6p/7x5YEL3KxSVlFetnXzAoASqev+2wdfyApy905QiuFoK
         31NfkYSOA1/vz/ZLCFKv9h17/5OFy3ejkqKJ7Sb2nXH/79GXHEwrrHUgGKpClpCU1bmZ
         WB68r3w5bRmseq6QniwJpgmVbNmJAJ58i221BbTzfbarwQO/i9BU9iMUMJ463FTwYjM2
         ikf8nn86ks0z9BROhp1wqzsU8cnMf2QFMZCPIS2MKdaa6Sc75FTivcDNS+9QbEylvc+6
         +2kA==
X-Forwarded-Encrypted: i=1; AHgh+RrNxzS0mgYaxHT8G7n4Pq+bKHcUthrITWhPOtE+R7qt/3s6BqrynX3EXakaVHsn4QjpCkv1n0d4IZCu4OadRkh3HQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k2MV70dNzTc5+cJWTuK/dRNWBpM4JlK5KKm/vVBAkEkVp0b2B2
	VZCp7nZ7kK4kRwfi462p1r4/NSPItzkQUJqbyxYULz1Y2xNX1yGLTphc
X-Gm-Gg: AR+sD12Bvvj7Ff6cw5ykjmOWXlUmnIlJRO/TPNbrzJeCs/sTl45Upz4zSaoD4mWKWJZ
	xoiqQNzLcULYDv/v8qdnD/JAsHx6RIhg1ow7Os7FMwxXSSXYNIoFyWE/BnPg7R3RhT2xfaCO7+0
	eCwGVcYo5epLgybIazH2qDPuREu2lKNfXZKtwkemIsP97Zhw6dHPaqBxcGwTRd7SLMcZNTMB88Y
	Jv48vEr+3PYMt5+xUDguxIueBKROYPB5lXVy/5JYhePaDzWNPp4T9N30O0ZpmMTB1M/e9nZXkgv
	7Hy+qZbkbn2RT3QaW/42vbX4ADTBjC3Y5rv/kXAZTVha/70+x6TzLBUn1qH52rxR9N1fVoxeWhB
	wgPm0SsnmZadZn2dfAxp9WVtmrXXNq99wU3fCmbwPAMb+IdfykP6KmWc0/MXHljA3vmN/GCWUbT
	u4OZZPoM0AaqhnbeRNc954mUpj/A83e9UKKXcKcPd+63aHt6TxQHHJ/Z02Zlra+XAPJsmJMMQSr
	3Qcc02NxQNSIw==
X-Received: by 2002:a17:906:7947:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c250bb7e838mr911315366b.4.1787747270128;
        Wed, 26 Aug 2026 05:27:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b4e9csm504890266b.54.2026.08.26.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:27:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 4/4] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Wed, 26 Aug 2026 13:27:26 +0100
Message-ID: <20260826122742.153643-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
handle the PWRRDY power sequencing, which requires the
pwrseq-renesas-pwrrdy driver to bind to it. Select
POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
whenever RZ/G3L SYSC support is enabled.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected the tag.
v2->v3:
 * Kconfig selects POWER_SEQUENCING as POWER_SEQUENCING_RENESAS_PWRRDY is
   defined inside an if POWER_SEQUENCING block in
   drivers/power/sequencing/Kconfig
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4929ea350cec..987958d494a5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -495,6 +495,8 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0

