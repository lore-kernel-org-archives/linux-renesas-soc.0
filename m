Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A094A5C22
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873538; cv=none; b=a2+91D92CcXZrxuy02NBivvnNS9f8Z6+2lj1kJbEKqTf7dH6RFJ93Y/NlDgu6NRRTmKjc1thGTPL42Dfeh+TW/SKsaGc7YA+HmSa3RFOzQneQud7thRepinrIWzkekbT/YIFWDmz2NIfk8avgnCBZLHGIua+jUlam4lyixmanZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873538; c=relaxed/simple;
	bh=bnqOd4Vosj6qTGxWqIJJjxL09W4L0ejCJMqbiEbYD8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Los9Hk31zqoyx3uiQaMk/hbNZ6qF7xGcNQyoKyHmMvrrE9FXYk3DgScVAA5fT1w1bUlnm4ameZZMElK6fSc/gVBEUkyjmg+ulqXu8eaWd4rizNB2rKsF+f+IKTDm160mn0T5qWSNH8L3TCMwzdR9SAxyIcUCGYfBlsD1X8nZi6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlcBYEa/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlcBYEa/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so51393385e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873530; x=1791478330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=rlcBYEa/cBgSjdO0YSD9vKAzs4q5RlzCCCXTn9MKrehGtndo71ubOOhjSVnCOCUc3h
         Sakojlyy5Eesd7TEGIaZP3IKMfqwexopp0u5qQV3Qv+9H2aSznaQcY9A2IVcHRLAZqL+
         U0qcltlGma5LSwWq/NiOhhBK24GqEyspGAhWPg8t9hKsjrVjgXEyhHtzxyasg/ACSHXV
         pcsyI/CRVYRJbZHKZ+Pvp4Rw4/jMRr3LlEaw/kgUAFk0Jaw84CJhqImFwDBy1us8NU4N
         O6xc+1qtBCoq/qMR2kyoZURSeFsFafZQRWTFur1Dzd3nYrZzHww7NAZA5V4SzX30GeDq
         FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873530; x=1791478330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=UQg8wMP98VnLZAY+V+tUJW6h7IFe8Tz5Y86joAoWs5DQmLQQs9hTZS3LGbDC5sTHkb
         x2ihPQmickb8JTB2Zu/WT6MWl+sRxhxoNKPHThsfpSpwR4g9hHwqOpmO4SKVcJjvF1A3
         zOV8IiO0fiFlqoPak3XNHNyMyAM39cLsE9m/iHCyqUU3DMjTrD/hBw9chQeNacirhQQS
         ouTwLxpIjmu3FFoPDVDcpIY5N7eJxcaU1PRxSHjcSIGgWy+O34TUOwcZXpKIxff4h3ER
         RnJZp9IUNDu2GmDZlQwvKraq4G3O/bLZhsbjow2ZplB/3sxnXZ2daT1UVDh7wbwIuB5i
         KmMQ==
X-Gm-Message-State: AFuF++mrzOT0SnqzR3pfH3fhQhQOWqv7bQtglFutXUZJac1+BibE3HSP
	SUmcPyOhqMXM4x8exrgqBZ89HgX22Tjxju2BDHxobX1wb5Ldr7eOOxX4
X-Gm-Gg: AYBFou26oDN2LSlG3lzB339IoZOeeRDjLbG9dy1N0QqvAmn/yALLitUp5Aj7mpjdD9j
	sI/7PIsvn3YSPmKg5LTml00PJ/Q43ObhdEeOiSpKqIEW82jiCEvZOFtauHBnbsGCykk1caX7P58
	kEeNORCm4oKr23U5/hIT8pH9tsJJvrM1cQXrg6Tr+Ba6WC78aCiOzI87RXxHezHQmY5YfHRfwcM
	PUm0xHbujyMz5cCoforKw9jkcWFuHWBwRKXchwy1vHMtIw5SiGgsdMzswb7qnmxi+LsrqJKjYQH
	WmB2GiT8TeC9mwr/9dJ2kOgRTH8JEjVzIfnam82TPWI69uLq4L3bCyJb16FoPCgjLt+/v2f1u3G
	MukozX9NNl31WZPrRw7V9EB2eaPJhVr0rnSb+Z1V4Z/LTITkBLNvlAtQr2UvyEoqCta4d+9l6U+
	yfugdgBg0/zh208L3j1Q9qax9iUVPZLBQ/BV8/XbUAkysYmLPLxeiONdbE1Yyl9norofJt/kFVp
	R+24jeZEW08qpQrArY9pcWBKSIVQobzk+hED+6AeMSN40wBeOaf3eqbAQKGl2Cuvb2txaZrdeSu
	IS39174H
X-Received: by 2002:a05:600c:4e48:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a02769cf5amr4592405e9.18.1790873529990;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
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
Subject: [PATCH v8 4/7] watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
Date: Thu,  1 Oct 2026 17:51:58 +0100
Message-ID: <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

WDTDCR is located in the CPG region, outside the watchdog module, and is
accessible regardless of the watchdog's clocks and reset state.

Drop the unnecessary runtime PM handling from WDTDCR initialization and
access the register directly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 4beaac44d027..e8a40482d580 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -255,20 +255,12 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	int ret;
-
 	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->wdtdcr))
 		return PTR_ERR(priv->wdtdcr);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.55.0

