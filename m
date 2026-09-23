Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B749EC44
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160081; cv=none; b=FmOQzX0sd6m9QZfW/yIywIji47IZgoDAG/U2tmkgyb6E6KLCx9i9lzHApy6fxYli/9MhlRkw8sHh4Rnev+KqaKM66ilYnnTnadx7TgGaf36qBeuiGF1yI/kQW6rUY1AHFj5OLPlNoA7vCOXgc8BhGSUwCawIrNHNcS7dba67Muk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160081; c=relaxed/simple;
	bh=3FpZ2LQPJEraDRB+xfM2+yX1c/xN43QUsBqOJ6MBVec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITut9LzFUYoBS47hOZSM7CaD19lxGOaTGaXQwEqdPWu9nsl0GsIZiDkAI7Gp09rnulUBVg1u4Ia4eOzSBasLXD2r5YRyxGPwZg6K1qRZfqZvIubhfeySXqu4jUhqn1btctrGhGGfmL5n6nrL2Hgdv3rdTqkN9jsF8fCCe8kXT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTjAnPwz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTjAnPwz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so3574425e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160062; x=1790764862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=kTjAnPwz1Kc5kesTwhtOES+DFBF1BnpH065abtkiGjK6nCcj+w1P0ppyICpgFexZVY
         Odg8dcA6Ga/BsRmIbalJMhroOYhB8bpa3ux4EGHclq3yG/lyXlhWA20qOpy61ii5fFX6
         106BvpkqmlnfW3wWuDHtjgtjD5t6Np9lRvxCg2hc3VCREdSrI2+JvtY4Q8m6f28ZwQe7
         ZxQLKLmJ3lTXfR4BUu5Xlo7hdXDavFzhtMhtofvHq8WTRFEotG6cB+xSSFO7MNwrcn5N
         ACMiZEnmD6zLh+4DUWQcJVnT6Ie1XCwfcf+DKEDd+2cztOxF0/Yiqj9spdblCrzDV589
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160062; x=1790764862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=ywqVPii8z7JqWdNMJPUDgx9Vc8oDg7ZiBDc55aC8+mn+/BM9mzXEupjH44vP3YHfVe
         QOisSFt9gHYfltg+bWd81BASKL2o2aMKjVtp6xfz5MCcbaH3Tg5aVxO6XnOWY9vDUHTN
         Ay6aiwGp0vnWDOXWHCXes7mWyKFy9XHLv1ylgaJQ3Q/pSa5YFmFkcsHaYruvPWjOHBx4
         E5PxHZCNZjrIkRhCUE38tcwO549cOVYLH3u9DAt0OP0QnGFTSt9HG9lz0JmYZe6ge/HB
         o0HC+dAdjNkKDXaZnNOuWJZkreVKINqj0V/uJRXXU1NmVbA3wzqeMO4OW2VyYxEoLpPa
         bFDg==
X-Gm-Message-State: AFuF++n8q5mVyXQp8H2c2e3+r3mdRhbyZf5gmR28VTFd8gkh1M1q+E4z
	LfZF8WKHDJcDJ/x/v5Sc+3d2NqpDIq66zeAsFJTp4ik/R4mQEbjZy4MW
X-Gm-Gg: AYBFou1GSTD45rsmWR7jiZRYZMgq+vrSCC+gloN9kxh/ebwdZ4cUUjRayO9eJ1IppV8
	NJB2fCqqjVqbUYF2X867y9upYKF25l/AGE/iDpXAIW6nr0jpBVUnkvd4KrNN7b25bmCsxXK4IZy
	HFsGbqRsevFYO9D11YnoXeeNBrp9YRxsCYcPHZ5RzdZt4UDneub5mi60p6FKzaqObe6zpIqA9N6
	otoKB5LBRWAlzQgmXjLykooHsghkfsAW/EH29HwJKcXwg9v3QtWSL9w7bbPuDeq3JbhUcqYaWqk
	lKdhG2EsBynDb5eqEHeHwmiULTVSPViKUCalY/bE3EPCxDkgeP+Sypdbo2ZtRYN+Vts9m4Y/qcs
	eZVd8IL+BHHa2DtzIxkIufUMsdJ/3JFIlPn2tgIZbs/eEbRxcrIzHcKIDNPnP9dYbY6Q7GxIRV7
	BEakC+/9Nj9v5e1k45xgr9axJGrQMatgHaaeqsGSHjrQNcLl3FUMe5H4kcngQAq1yfMcAAOoroo
	D62LSJQbAXovVIk2PUqCyyS7rGoetJycQRmyCTFfvqOgAGgeEZZhYtwl4ODccURKe5331UOPBxj
	9Z35Oib5
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr26577895e9.6.1790160061713;
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 3/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Wed, 23 Sep 2026 11:40:49 +0100
Message-ID: <20260923104054.3324830-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index ee1649e0edae..9774fe8e441e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -39,8 +39,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

