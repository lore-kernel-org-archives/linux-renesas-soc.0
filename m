Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6732E8B6B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149459; cv=none; b=YVhHtnT5k55tKwF345kyiFn28piIqUvnh/V/EweTQgWF5cKmmZGzPN8+LlvXx5uJbskeEq8Lxo+HCEtDxk/cloXVNZxcQSwXpwp+HLzkLXY4qfp6CqIJUIzK1jISqE9X2WJxBMWNvW+ErLGQ2+Diy/LNjPg3BWo0wHNeOrTrvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149459; c=relaxed/simple;
	bh=aMITSABwUIMSuW9pysytVGYRY24rEOzHFrUYEXRrNOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtVEP/lyh0HqCJylGb/iX5y+XC/RCDU2KDMB4Qse3D5jIGJna9F4+EnYoaOM49V7KFzu8rdRTK7S6Kna1aXEAohg5gogJMfZ5CDjtAE3pD7Ctb747GOTl8mc4Zl1CPPnLWDn1MC96WvDK73z3H66T6qfrW/GlaYoaNLHYrNdDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q8zGCxDD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q8zGCxDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rq1rA1Ea6KvvvlR+ODkyEwRn37goOGIYhIfXvkYhRM4=; b=Q8zGCx
	DDj3oHl0N/SgnvVL1WUYXvOG0glfhJuRH6sT0ULzSvESzgYL9ZRmwiM354dTfsPq
	fXnhZ5pUmXYxeYg+QmJ73zlXOacAgXjzCuthqJUhsdXeSKCOd9A4IlW3uEPKYhn6
	63lLWEBfhikEvBu131yLLplzSpWpxv7hR4K/N6lfaLO7PyPogZ5sLw/+RP+lB58Q
	FQENP9/GjgoXMRA+0jd1IKFGGNTiAyuO+XOdb0Kea6hdKcDehgpN4DKNoQiomWry
	rsUlmsxHgi+TUtwm+1dE8SjYqh2oP/TyA35u43wko9lh21ECd7LefOSte4RzfVe+
	78PTMf/dZuWxCWJQ==
Received: (qmail 1070406 invoked from network); 7 May 2026 12:24:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2026 12:24:13 +0200
X-UD-Smtp-Session: l3s3148p1@jLiJrjdRsOcujnu4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 1/4] watchdog: rzn1: Fix reverse xmas tree declaration
Date: Thu,  7 May 2026 12:24:06 +0200
Message-ID: <20260507102410.43384-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>

Variables declared in probe() don't follow the reverse xmas
tree convention.

Fix the declaration in order to follow the convention.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/rzn1_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 96fd04fbc2a2..b7034eac91d0 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -101,10 +101,10 @@ static const struct watchdog_ops rzn1_wdt_ops = {
 static int rzn1_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct rzn1_watchdog *wdt;
 	struct device_node *np = dev->of_node;
-	struct clk *clk;
+	struct rzn1_watchdog *wdt;
 	unsigned long clk_rate;
+	struct clk *clk;
 	int ret;
 	int irq;
 
-- 
2.47.3

