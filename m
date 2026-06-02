Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE553311C32
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428371; cv=none; b=ZKZP6D5+/by7fq7inzmqFJcH0CcYhRj4zDRtTS8FOL9vdhr20/ZFrQmzwXdXDq1VbAKvdcabqIRA8Fban/jFAP7N4MaPyAwxPXjbKTHkFgxIv7Pfk4pxkIeE4HpeKOz7Kfu/iFk6jx4pcGpaGkX/aBqMNUqScgZJNyVUsJW4jMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428371; c=relaxed/simple;
	bh=DrREXUHSvfJv0dBT61+SCt6bwFO9WDLR+vHCiInyVOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VFSVTl40CDvClZ8CUkX4eZShKYr8Y3FLFA3KAgH2PGlfOHfcRhPQQkPQk30atOF/vPmUYotqDWiGSne3oNbDnuE+oO4A1KNJ8qNfxUChGgFNiCxbJMllj9xQYUlvp/kSOGMpgrq0W34hfEBviiTbTi32Tlh1yYYo071dIBjs/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvni638g; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvni638g"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2634653f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428368; x=1781033168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p9Ho03N9vRR2ohmpvgyy8QgtZ5OEC0NyhfwgSg9sXhg=;
        b=qvni638g9VHJTcmTvMTNY3upW7AbYkUj8qqxB/T2ZVJAYq75qoRaPLL6qBCYQnCaEc
         XUn9EKTdT56heN0PX8N0a5Je6VNmyVy1LrW01LGqSTWU6rSFMoN2yRSpJccYA2A6QgVx
         U/rS1tqmPaQcYzZhJ2vpLxNBh1mrwtvaf+EXgOdECzbxtUQOWJ4qF65cFB+pAxwi8m0J
         qqLqheHlbZXnqTnTpDZ934Lhygll5IlpOhnDRMSz1X4WpskYmujKWfpmZIHnKSbYnDqq
         uQltw7A8n7HXYZNxZ/TpZ9BQoXBZemEjJ6A9pUKEDCbhyh2p803dXKtAKz2nj7kteFAg
         2zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428368; x=1781033168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9Ho03N9vRR2ohmpvgyy8QgtZ5OEC0NyhfwgSg9sXhg=;
        b=ag70gc8/tyHr0LiBIhsj1Uof5SsSYttYqblDoRZ98Lc1Ue/BmXWdg3b5VwvXEdMT4T
         Ws+s8vYGT7NShqGk+wCiXElffEXquU6wg3tFF2Gkf7dAL4S7oLsZI484GJi1itfpnsZM
         poyF3R1BMxGjyEX6uS7Bzs9LQKl7y8IYnRVOdMLMogKlW1Yk4fJ7pCn9BSb7rPUB8TZd
         ecBFKudOA85AWE3Ya2Z3Wq7G0UXJgBnE66B4rHVNYFs/qIdrADseuXaUAn0KFnyyDt9u
         D2CvoYGx5n6NS9Omrnu1PO58uh3L3qcDilPtlWwFzC8dqK2ajtq1nB7eBQK4KKng68lt
         Getw==
X-Gm-Message-State: AOJu0Yxe075wa0zWATS177xPghXDKkJ7mlIWPzoi/BJyn4hykvSK5S50
	NiUQ7+n4lLIJBPYjTaak1uOUu7LJZeXM1tXa1xNYx5xf568cUgoId3ibd1VXxBcyhFI=
X-Gm-Gg: Acq92OHvM3lPiuf5Sj7L5zeaGXiwEbC21+hCtdi3QTB95WSEAdLt+VMWzFRPhAwu2WL
	yt2znU0YcUTpsISHFHu7YlU2jFUd777HgO1cnDEn/uUdqWbUMbC+T/lC9mYQXpla0omTLK2LwIU
	kjeWslvd+7KzmIlhcSDSF/mCDiLem+/FJTw8O4acXB2QFlNbQsF65jjRuiAzb1c5JDBaHQlPhBl
	yV46sFb6tQIxDh0KeYSPLzplsoMI/q+btn3Y4nn7kKtBViJyjdsrTlH+P6O1xWG57BOgbofFxnR
	zO7XYQ7Mmea0TbRDCZt0O6Dvmpp4xA7cR8+SmvEIOS6w18I1fvRAcsBIzZiD7kErCtdAe+K7ui8
	ml7hFrg2I+VqjjDhj7e0NEz/5UaRQHiKYgGDtFmcQZtLFtRuYcFBcyNbTLDFlJsO/dgppiCvAcZ
	Ds4qo74nLheYwPWvfqi4Nz0ReuziMzf4tMMjx6boQLsIFJesjnGucBd+lx0H7q1leJsZPcVR+OA
	8vJkPd6X5XSkkKmVgB4L1NSen4uvFwDgK2RPxjGDkaefHjskdxWXYbm
X-Received: by 2002:adf:e00f:0:20b0:45e:f3b1:52d1 with SMTP id ffacd0b85a97d-4601f504eadmr761615f8f.9.1780428368146;
        Tue, 02 Jun 2026 12:26:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] rtc: renesas-rtca3: Various fixes and improvements
Date: Tue,  2 Jun 2026 20:25:54 +0100
Message-ID: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes various fixes and improvements for the
Renesas RTCA-3 RTC driver, including:
- Fixing the polling condition when clearing the PIE bit during alarm
  setup error handling.
- Checking the result of the RADJ polling during initial setup and
  propagating errors.
- Correcting an error message related to reset control.
- Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
- Refactoring year decoding logic into a helper function for better
  readability.

v1->v2:
- Added Fixes tag for patch #1
- Added RB/TB tags from Claudiu
- Rebased the patches on top of next-20260602

Cheers,
Prabhakar

Lad Prabhakar (5):
  rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup
    error path
  rtc: renesas-rtca3: Check RADJ poll result during initial setup
  rtc: renesas-rtca3: Fix incorrect error message for reset assert
  rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
  rtc: renesas-rtca3: Factor out year decoding helper

 drivers/rtc/rtc-renesas-rtca3.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.54.0

