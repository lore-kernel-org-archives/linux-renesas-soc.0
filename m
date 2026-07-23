Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E38472795
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821324; cv=none; b=TSRe0HHhrviAerjtnGdtM+92MRoF0T5GHYGZ0O3i5WBeIUVFFjkyN0pSAier01WG073I0rWl9kV9MZ/EQVdXx19jASZj5FYFAQaSfhUMGK1MYD00bxzieXDeUIyaUfiJ0Nu1V6AUt/1KO4qN7p1AV3db3B5p71vE9iqbt0qs8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821324; c=relaxed/simple;
	bh=Uxpyi86QWWWez51vf9h7G/S/w9n6MkT4D426+4rpJH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgZPexuWu1jMbK0hzwxwECwTjb54VxHjtHZ9YOTvfqSW3TwGs5LTffvOX5N9q4XNPoF2rP+1kIukRKVcRnPFaLCQ4O0SAOhGGj3uJ1Y9Ua140Q6Ys6Vm8FaP2zWhp285sLW2c3l6ZQkGoaP4pVhsMu6GPpS1kxMwBMiGpRqcstU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzIOaUsv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzIOaUsv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955484387cso6532665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821317; x=1785426117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=rzIOaUsvEWaERn/tDq7djqpVnpwI/l3GT24GyroBX64CCwkSkZ9vkZMF96LXyCHBrw
         nWysjIoYmWnQMhDwZHfOj/Vw9aPAcre32bj59AKZDHgojllXZdd76LXNH95YwSFoqgLt
         fYpCL0cYA5foX9JalgY/oHHb/yQo/MmYmCqLFXcMXJCFRNaCZd04TZShVjfCDIS6uMl+
         Lc/EpS/M2s4WaAjDbhk5QEN80fugbU00B7Wg8rbPzH14ob5JdOWLliXqU+ObbjkNMHwn
         vifr3/+C5sIPuZYP9ZRrKOuIxhd5Sq8MhVzKITUYN5pfpTe7P89ThUsJ0NNr8eoEYcTr
         aaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821317; x=1785426117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=GkZViaOxPWC252NgUlka00Pr+Oh4rNJLfjpgzhF3fvHalp+A8s3n0v+M8x6hcDOYtC
         6CwFLA7k+N7WeTIJ6MjU5ad4NHS9iO1nGpW0Ny6bqAGIbfNK3TM1FzAn/O/PF4CEtovQ
         iHpxNqQmTupOSnPkbzJluegftBrUgWNQ8HbqYbmliQDX0Kp+60pC2EKoX918WPFTv9JJ
         KsR2dHFwexi049IeV83W4hNwyzePb8W6H8DATOA8070h/RPGqvxPRyknywNBxXx9FFb3
         HJjxJ4aAZZ3TlNnnv21LUtPiCrnf+CNLKY7QCWTrqjJb7eiT6ytSMZmG6eck2hjLvp9R
         0xYw==
X-Forwarded-Encrypted: i=1; AHgh+Rqcys2BKrY4wutJfrDgGlEYBSem6r64F4iJpzMps86x4vLcyUeS0JNUJWG7jMP/Uditd+3WSWUzP1dMao7J6cMdZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9f2vchTFCQBWztCRZ99jz+Iz1zy6YCU5MvyWqhxip6i/T9sHE
	XTEpeREHMa9XwNqsYHEjW79I0xPlFGqMj0gH2GLLPfvIqafQSSDnpdK9
X-Gm-Gg: AR+sD10uGeAst7fnRlDlUbBkMjHP3eWB4LtlCNPJCVr0Jeul85/4nXTFCWCvqULXsox
	IBYsg9XHp40p9y8TncIQbc5Re5ea+2RXLrwFMh/QJiDhCFKn9UBxfjKfqA24dIlcVykxJtJ5Tvn
	3kxkofbe+KRgN1W+0vLUDpDU7p6hzxWmQGlc/kdS6fHj/hpjE+ZV08yP6d2oELbRBIV21Ydx1OC
	5ANIYMXEGpHO30xNo5aOOy8uQ20HxGF0nZ2DDGO1gcOFiNVy2uVPmJKqKeEs351SvQPUnQRScld
	LakPRsV6lzfNwRFiEQpGP//ov7Ocuh5dAyOmxD30yrCWo6N9dyFWRvi0bR4lye8kf35oh26gyZd
	TMYIqQCsUVYYA+hckGbZe1iSNjL/fBlwQrALHy5IIXMdD1LV9HY5DGAYBFDum1HrEdi73oKTdsT
	awE1PnX+usFKjQblkYbs9VK2+tiPw4sqRGIEhkwA==
X-Received: by 2002:a05:600c:474a:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-49573c8d444mr42787565e9.5.1784821317042;
        Thu, 23 Jul 2026 08:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 0/4] Add SDHI support for RZ/G3L SoC
Date: Thu, 23 Jul 2026 16:41:46 +0100
Message-ID: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series adds pin control and device tree support for the three
SDHI (SD/MMC host interface) controllers on the Renesas RZ/G3L SoC
(r9a08g046), and enables them on the RZ/G3L SMARC EVK platform.

This patch series depend on [1]
[1] https://lore.kernel.org/all/20260723151024.318918-1-biju.das.jz@bp.renesas.com/

v18->v19:
 * Renamed aclk->aclks as it is AXI bus slave clock.
 * Rearranged AXI bus master and slave clocks as per binding.
 * Split SD0_CLK and SD0_CMD separate as input enable not available for
   SD0_CLK.
 * Added bias_pull_down, input enable, default drive strength for SD0_DS.
 * Added input enable for SD0_CMD and SD0_DAT*
 * Added default drive-strength for all SD0 pins except cd.
v18:
 * Split from patch series [2]
 * Moved sd_ch2 variable near to sd_ch[].
 
[2] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 233 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 4 files changed, 444 insertions(+), 25 deletions(-)

-- 
2.43.0

