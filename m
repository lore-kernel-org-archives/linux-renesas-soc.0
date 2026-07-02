Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED9317146
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008313; cv=none; b=hP6MruHpcHU3GmDz2S76YCGilZgJw3OSRsXbOIFiDc68nsUGubtSrOMjb6H/KnpKa3VO4Bff6vdq8tscBSh7lBdExjs0FPfIfpDAEmTj0BEASYs07y/ubNHyY/wX68uKM+QSWF/C605SLDgIeNM6AXgJeW83HAx4Bban4zgFg3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008313; c=relaxed/simple;
	bh=mWao/R6lk2gMSPFtmSwOHAVgJCYAsXgCPY/nPQqmmlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ONxCF2nPgqeJl9C0+h8y5Z73oyYvcqGDSGbOYZ3czPsmlCYIaXD6KdmCm31FP+yd/hp2q+JpAmhEc9DQAbDJZrJe5a/36rvLSFylQc0O835dzZxc7jkJ5/fETxB6yHt6tSYJMaB/aAIsb9S3Ce9x9WWFWzNjHd3woSX1Z1YNfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRxEd/97; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRxEd/97"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so7868965e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783008311; x=1783613111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEfiyThLlnYz0JhjUcRCH7/GCcsjcrpS4Fx4utupl0k=;
        b=VRxEd/97GLWUTWwxcr8FNQkNXWjTGQGvTbPtVDHXxRv8D5XV7UTJjNlH7ZToTyWgLc
         Q1+gYlzegPCq25awTWSZQn9PMweANFQiU9gG9Ai4nSpC5EhORVgl+vd67iJW67is/So8
         IsalrDV1SUrj090SRniekr7ZJJSnl8e71zaugXHvYRjTeHrroEfsx8f3sOiURiEPFy1f
         DXbkH3uHvcgo6tiHjupXqX0Rf7uNqtc0O7N6I9pf9fs9X971/zQqHNZCp/1cN9ShZ1Qp
         Am8eXebdD3BNGqtplr1fCjAC4xl6nqGlBg5SN7hJBqzvk6kqkG3DUhm0GAeyBIt0cVUy
         EdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008311; x=1783613111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEfiyThLlnYz0JhjUcRCH7/GCcsjcrpS4Fx4utupl0k=;
        b=RAyulj7JJkEAml45tLpwr2rxZEi/b6hHrWTQLuipDIV6uGzUaogg+EuCkQOanJE4O7
         uTV63B44E6ODqeIn5CdtmK6qSZF6cdv8iEie9ZR35ks8jGqOkc7r5XyPhiSKZusBIDy3
         o+w1mju8EeYcOOdg6bOXjqiXTuUa/x7fUsOMZcIsDw8CYEfDR6u5TPflRJf0lPFVtcd7
         ZdcI+0hSTtnhfxzdNN8jHPXIJTFBdBH5iTYUu+35M8Q6MAgL7h1Tp/i2ZbxB1I+XjDAt
         AEgPTGDAyqETBceiR/SoXJUhuR40J0CBbNa8JclGWOEv2wronInib0hb0TLuZusxRGoy
         Oplg==
X-Forwarded-Encrypted: i=1; AFNElJ9ier74fYQSeiS/lpUzIFdbq50ATDbY2Br2zzGJpSa0jsskgWwrlwS7CTHqRYa09WNRFqt6hMjtQ0o+UyCW0DWWqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNT5UlsDtUkDWu16Rs1mpoUz9Mw7N8Ac9VMtZZ95tZ1087PnWm
	NIl3ahOu9rsDywkpFqyxGOzmc9pToUoQx0EeMvQqSfSmhLiNPyvNQ0YV3jZ0ixDD/YQ=
X-Gm-Gg: AfdE7cnRboqhWa69of6OGWaljUsqh3tUdqKJOvme4VipB+WOCjnIruN5ckjCH2GiTEX
	uOtxiD4HkwI7o7A0T+7oUegjT7Gzr2lbM5DR30XMjqgN1PFTuGwfp0zRY9xSzX/KdMxJjQXTYM9
	WAuJM9tqyBj15A2avPAP2Z/dRSJdIbibDFH4BEMPwC0PGbILWDWtfe0TKb2GLJxe1ByeA6TAHAw
	7rcHT1+n4+vmFyRQpDYHWV5EbaPifhbEKyZwIivv4808vyeMp7p/LAg1BVKGQSdLoZrz4i4Q2Ej
	y/UFh6GBlRS++sF94R2UfF7+NPJ87oYT3gdzwoFWaukLsvWCucoiz89dY7/IwjT7Fwz0uMAMcf6
	1+g0BXaL9B3rVNNIViV7HCkhRIy7QicS2Xheis4W2WnQUHW7lkM/uoo/3dlZ+ENppWwAR5EyXQf
	P8X6dvf8J0mF0R6saQos3/1Q9WMmLyNWYp07xvGx/5Jg/SX1FeeYYavZxE0vXISY0cD9F3Eo95W
	T9Cf4m4KmZh17G7HyA7i0RPSbU=
X-Received: by 2002:a05:600c:c4a6:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493c9b580dbmr7652015e9.11.1783008310583;
        Thu, 02 Jul 2026 09:05:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm85444715e9.7.2026.07.02.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:05:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Thu,  2 Jul 2026 17:04:54 +0100
Message-ID: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series converts the WDTDCR register access from raw
readl/writel variants over to the regmap framework using
devm_regmap_init_mmio(). This conversion serves as a preparatory
refactoring step. It allows the driver to subsequently support
syscon-based system controllers natively by passing along alternative
regmap handles without forcing messy architectural branching at runtime.

Note,
 - This change was suggested [0]
   [0] https://lore.kernel.org/all/c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net/ 
- Patches are rebased on top of next-20260701

Cheers,
Prabhakar

Lad Prabhakar (3):
  watchdog: rzv2h: Refactor WDTDCR start/stop handling
  watchdog: rzv2h: Convert WDTDCR handling to regmap
  watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro

 drivers/watchdog/rzv2h_wdt.c | 81 ++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 22 deletions(-)

-- 
2.54.0

