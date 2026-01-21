Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075A44D6BA;
	Wed, 21 Jan 2026 23:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039006; cv=none; b=IeZ/EshaPqnGiOYQPW9lNblcg9uqrfj1r/WQWGAoLGo9Did7bAj8Dp8pOQpGWA/0BdNqpH9GFXGkB5v+dKVBSgENhS8VdzoA0LPWTa3N4cn1GkZfB16WntWNOcqZ67BezoopaT68n5F7VyKYSz8o+uqYhUKRPvpgHNemdPIjMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039006; c=relaxed/simple;
	bh=Gs1q8finF8JEDbb5qkmWZIx2ohm1ulw5VqIghavny14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eI6Uw4HaSmk0PUt0j73swi4byu7XmITp5m4rURuu7bMLIjZkFS+STkUypiuhXKYLMWKCSJmktuZRM6jRsS8we9SsvOKLajk5JiJTvPgcSsAKkhWio8fJPQBqh0eneQiOCkiz/MgmFKuxUdN8U2NnFBD+O/RuI5l80nJtIaBtxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yq1lpTGz; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bO87ijWd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yq1lpTGz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bO87ijWd"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dxLNn2vVRz9v7V;
	Thu, 22 Jan 2026 00:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769039001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WO33KPmXI5HY+UK0FMehUn9bMp1swHSrGby6QDFu7ho=;
	b=yq1lpTGzufwbAtWGeG/vPDwvaQjAibLLx//gPuwKLYaDXjmygv5VBgxud4EGYEXzMbkL+b
	YIdBWq4xe8zsOpFiOUcDkjPH6EjCOdi2QKexvLHZeHNzBBjIcbV8UmrOiZcLpFGy3W+TD4
	zFY2cRtvr8BFihQkApObsZrtaUHrA4926r9zfEzfwdUX/jgqtlGyIdkCHwS+AzO4d4gh+p
	hNPeg0K/aIZm9MRFOCRD5QpN/3IFdac6HsmzlPDL+VJcYT7cvAMEa6r6yrCCrrDidY+eIp
	DSDsrHqYIzc7Df2YKI2lqNiMmY0oeOrZmrrnEds8AtYvq8Gl4r81e3SirOoPNw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769038999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WO33KPmXI5HY+UK0FMehUn9bMp1swHSrGby6QDFu7ho=;
	b=bO87ijWdczw3WhMinG2FOGKNM0o0JsbiDy4yRmLabqmAwi3xlX7hy+1LqqFjdgQyrT51FL
	2xr7jz/UaYbT7pILbwAHLRkhQMeIPMXKj3pasWpx4Z3rXUDYGHnhvdVCCoHJqq7udcgj4L
	TW7p57D3HwahqRulJmaudxNpFjC6OJkTTB+j9zPX1Zt86d6aoPKrnCzBKBZVYdJViK9t6s
	DkwcLPExygaN+JIAE7u0cZI8/f6ECIre329VQr3pIQv1gMABWMXLvtL8eJKt3kuxh2F+J+
	6n6sT96dxusg5u1wfU6hLldtPdhTvriaZ5QXFujqm1xQ+iM5rV+T1YXp6RZRPg==
To: linux-kernel@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regcache: Demote defaults readback from HW to debug print
Date: Thu, 22 Jan 2026 00:42:58 +0100
Message-ID: <20260121234309.178391-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1ng7ye6d7xt4sqjotaehkjtkp18bfqsn
X-MBO-RS-ID: fe1ede5063e363a4c6d

Since commit 632e04739c8f ("clk: rs9: Fix suspend/resume"), the
clk-renesas-pcie-9series driver produces the following print in
kernel log on boot:
"
clk-renesas-pcie-9series 8-0068: No cache defaults, reading back from HW
"
This is caused by the presence of .num_reg_defaults_raw in its struct
regmap_config, without a matching .reg_defaults_raw table of built-in
register default values.

This configuration is valid, and causes the regcache code to read the
default register settings from the hardware, which is a valid behavior
for this particular chip. In fact, this configuration is more common
than configuration with .reg_defaults_raw built-in register defaults.

Do not warn about the read of default values being read from hardware,
as that is too strong and seems unnecessary, turn the warning into a
debug print.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/base/regmap/regcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 319c342bf5a06..a4e8983a5c6f7 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -73,7 +73,7 @@ static int regcache_hw_init(struct regmap *map)
 
 	if (!map->reg_defaults_raw) {
 		bool cache_bypass = map->cache_bypass;
-		dev_warn(map->dev, "No cache defaults, reading back from HW\n");
+		dev_dbg(map->dev, "No cache defaults, reading back from HW\n");
 
 		/* Bypass the cache access till data read from HW */
 		map->cache_bypass = true;
-- 
2.51.0

