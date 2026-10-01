Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F8497385
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873536; cv=none; b=a2pgt4mj0VV7X6NuwxOIMskpP6Z3OfDcBXMZAuBGBcXX4oDcEB6F/jNdgt61VNvft5U6XBmJhCVoT4np7J61hNRNrXp2oOB2abxOCLaYff88NKrbJHfwUutna0c/NtNGdEDXNFP6pnr9lV6356VH89CM04enWVqX0xDDOIqjIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873536; c=relaxed/simple;
	bh=O/wuoUzMSnMopjSfTSzLKDlvyv5a9oAm2qijichgp5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNXCoe3DWYiFbQnLixk4hZDVgCEBUDCUqcqkRhdWvE4GkTOzaxQQ5d8HLEdctgiLrgID2vuv1XlQxYASne28daFA7EUfwMLdIiWmEY1sJTuPwDUPd4+GwaUoqpdKSsyKfUOklX8LkumUKK28FbPP4mKbdR00GfcfvcURaK89Ic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqBVuktt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqBVuktt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so42476605e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873528; x=1791478328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfLRkpVFoQIvpElfIkHhqjQGzZrYpwgGYR9kUaAJ264=;
        b=oqBVukttvVE8CMGhlluvrMAz3olOGaTRo3taxg1/AR/odxSQ9bFyBb894zUGWaO+TJ
         12mpgxmqbI1vaK3ThprXEtGdbHpgo7gJpsam6wzVVnQcPTRJJsqEHGIRvFpA24D4r5ev
         LM59fn8xhgjDQogQnOwHPHLYvNPxvH7xFwIxAeTQapxQIACH7PFVgH3qgqWGWExXDnqI
         37x5hfGxVMCCTQvS/6wFh+6dOZn57oFleELe/sjulDNY/ALCbL1o2lVFf3kw40ejb5hM
         cSqNnw3yqVxa31rVLANYFJ24LhzPx6Pv3ychS+8OhmXnN7x39e4ZSpRscf+Z3i2HpJm5
         eGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873528; x=1791478328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfLRkpVFoQIvpElfIkHhqjQGzZrYpwgGYR9kUaAJ264=;
        b=W5q3UulQnAJ/+k/fdBsKK1r/ayaVo3APlWLdE3iJnWvC1ob6mab3qEND9ugsPkIJEF
         XY5KVayQkltbRH3Bzp7VQmOsphosqYus1ANLxMssIAOX/N4Uq3G2ib5ThBQb98KAAkJ6
         uyoVNyhemRB+4wHQX242zSOvOc83qCsScm1zL5UMBFMENiy4mXaQ4y8CkzOrdNbFdu6j
         1cIWXUcX2hIvBfq3n5gvPHG/7Utg3IxlW2y0pbZBFWZPxTgwJjLQirK3nJoNL0MlMXef
         RxHEWP9jfKU3plOOkY52Bh6AoO4sytQEYeNs7BkTFADjxtzvabfrwymgxVo1l3XZk3PL
         xMuA==
X-Gm-Message-State: AFuF++kqbQ50ieNBs272aBYGChDbHC5Jjyr0ITsvDA4VnlpDbbg3d6av
	62gYOkTLqDgi0PG3WtP5tp92l/Wal3b01X50Dgdp55CwGSL0d48ZYYFt
X-Gm-Gg: AYBFou1r8lkdty/wPTzlIF9yFTVx7Jh8xvVL7UfIC34+2fPua2mu7T83fIGxIL63qLY
	kb8KhJLwQmKs+q5MxdqStHeZRD2jDuWCl1ucK635kEbFOsD8owX9T4oaGuN3vfCyoK2ZWr5MLeY
	cVv4sWjPUKiCzoAk4/BEbHrpWnjCtjL93HJPIPQfAvAfDJcUqVR3UVff3N3pJzvy+rjnuu+XY5x
	/z6R6pP8xfgxwNzopsmR5E8AWv8WAvijgBRqzw3j4oz6v9q84BVpbp3JJqOm18zBx2oTywZ21Ep
	P7zCOyOP3JwAvYObwD4KOHzwNeDAwvCaMVqQXKS+cmc5oD3XLhNDWLn8WvKhkjhidO25TddGjcb
	Fmzg3cEMtI4dZlgc8MmOjagNZlzj6xFQlXRwJRhhdQZusQzWEhUDNkDPRFl3y17+AYG2zooqIgy
	yiKcp4F//BtIWCsaZ8Bp8sR/IcWYGmPRSI63j/R5ld95UnjzMHYj+ZAIX4YpXS27bARmUIZv35o
	3dDCWZxh0OBagkKdpLlL0JtzAC613UvR6n6gOLbX7RTdQY1Q28GymnYtOaEt84vIZHB1IPmDVnV
	cSS1uYuMlO5W+ajZWUA=
X-Received: by 2002:a05:600c:1e0f:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a027697ef2mr4146295e9.32.1790873528426;
        Thu, 01 Oct 2026 09:52:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 2/7] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Thu,  1 Oct 2026 17:51:56 +0100
Message-ID: <20261001165201.763882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a8db85e85c73..f247e42d54f5 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -175,7 +175,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

