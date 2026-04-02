Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B2296BB6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135428; cv=none; b=IVZDByBm0bvLlPB6WGui4NUlZysuLlq9n1IUoTYDEF9mRCsqKb1TYBw4INP9yqop7BtJagtFtgiPcOxmoTZRfFQCCbCb7qImxW/eipELokXI/jQj0uEgunJJU+gffi216oekoCEQWdJKJLJUJ+ZEp0QlXVjrvYajYItigxv+NYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135428; c=relaxed/simple;
	bh=1vEf0BRhl/MMI0N0/twBdeKMK2gmS8AmhOfkU9TNxzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GJlaC6ExBLi6l9nUNG2NZBkknlLaWzeZyiOwWxmediLyIKlJZKrCEzU+UMZVh3/bayg9UHQ8Q1c9bq33OOvk9rdrN++9+Q+/K92xl5qadTCgwEY9n9c85Svg2DGYTj1TRTPuv73lwOgbqJKoWMYzmKPfzrpJcAkTd0LvrBSZg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8DoEkLO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8DoEkLO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so8253125e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2026 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135424; x=1775740224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPbDVvADwWlesPGPPMz9fai2gIb9UfzDS6sF/3W+70k=;
        b=d8DoEkLO8QymT0reYKVmFr0OFWeb2fOlcz7YSZldzi8D5mv7sRZXZGvFqhRJgpGMc8
         VQDkdULkT4/sx4VxAN2YNBMJ/MFvIGbjRS3o0R4YwpJstOHI+TAYuskf+x+o7BFdOCFi
         79Xm7DlqO4GBGA5begA5aQEXJuYpxzqiCUJ6lCCTIpWtjYOIpekDQWGvAuAC9uXlN/90
         gZ5ehopOgEhsVlX2ZoKtjQOugcH4pDhqIqc6sozujllgnplJGpmebIcyJwEjJRxKuy0R
         Te0BfcnZXuK9PhuM9XZyx1mbabVqVRVRL3A/LrIhwk56RNxiXJLXj2cgaprjIUuseP/g
         yz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135424; x=1775740224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPbDVvADwWlesPGPPMz9fai2gIb9UfzDS6sF/3W+70k=;
        b=qyKMFFxs9TdKFg6FNrJ0H76g4D1CoE/lzZrmMvzGh00gzyCUCm9jLZj3dolvszcTos
         TIcTB+mrFC4LDxQRJE9T1wZ0RvvMDMwd08FpBVxqF63E0aQ4VHbuVyYJ+IH/BTDlNlHF
         vDQzY+ElRZ/LxOOHizlbcfmtj+euK4vw88yA86um/N2NIj+WUTzlqPPRjnbGDd9p4ENY
         BNMQY2PGZeeSyYQ13yM0TvRzow9LU6H2ySbwWsQUt7IM6wbibNK6gYjz03CsPHzzPK64
         Sq0MK6ZfJ5LT4mltiG3zg9HLoYWw44PQeCd5C7i/dBU3SsEUz9diKk22CcE0aVhawz2K
         MIbg==
X-Forwarded-Encrypted: i=1; AJvYcCUE4LycTlANWgsB05mc8csctYcobX+GyhYT9oI/WpTZ5BXgid4zrVGM/HY6TxJles+lsGKNOMDZNCgTbp5mGNed2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPKy3cw00p6K295EafDJ8FwWvHN+f0mt3pVUhly1NfLMb3+wq
	PUkHLyox7CFFYEX+zKoLmh5IJtFiaoIZwJhF3LFl+f9TC0oWAptuykCPk77p9w==
X-Gm-Gg: ATEYQzx8ZCrugbKlROPfcei01QZacHB7SURX/okktf0IdHjEsaItIMgZMyLrnM/Fh6R
	AJsPX53SbjkhPN8X+1SAS3abha4HaIFzH3UHLCTqjK9jjDKTTzOvKDDEfi4tLEWbVsaWOzgrhnh
	CnLdH/JsfiyvxfQJuoIub7zzIKOUfYYOFaw/x0P1KB4rvsdmzj8i5S3bUvqDyzVKVVIOuunJvPc
	RVRqPCsk8myMQbYn/QSbktgbVXyQo7twd3Z/6SvzScTFQUjdcO/c8bmJy3XkSeLSKrBxon79/cp
	Zkm4HjBTGdaAQDf5QuGv4OZL2LsRidRQSeHOFI84b5W78+qOPMDPClEA93YnVNgSxKTsU0LVSGw
	X/JZHi6BnSMTc4UT9vct73kC1S+RRm2fNPQGFeNrYsyD3YcdEUxAO0R/BPOiLbhq4g3gcHsAJb6
	Zyd4v2irp2Uf7dAmPfrZyOSJ0s1WjzhTy68FP4k98Bk0dInlOH
X-Received: by 2002:a05:600c:890c:b0:488:7a24:9ddf with SMTP id 5b1f17b1804b1-488835b792amr98024345e9.28.1775135423525;
        Thu, 02 Apr 2026 06:10:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1526:47aa:5ab6:5a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm8040753f8f.4.2026.04.02.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:10:23 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Add Renesas RZ/G3L RSPI support
Date: Thu,  2 Apr 2026 14:10:15 +0100
Message-ID: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series adds binding and driver support for RSPI IP found on the
RZ/G3L SoC. The RSPI is compatible with RZ/V2H RSPI, but has 2 clocks
compared to 3 on RZ/V2H.

v1->v2:
 * Rebased to next
 * Collected tags

Biju Das (2):
  dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
  spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)

 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
 drivers/spi/spi-rzv2h-rspi.c                  |  8 ++++++
 2 files changed, 34 insertions(+)

-- 
2.43.0

