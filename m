Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE4407592
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484494; cv=none; b=RljpdUc+rAO/riWxxJvzVI2LlnhgUxfB06zcHj/MGBgkjUhJmrV7c7f/KBm80MyvHuGzn8w1grghvWSBPMtbxMWMWNGV0RpSqlvQPJ1fgCbCphUzuCHjdZj62Ow/gnZds2ulN39KrVmBtVRTctiX07mZDhmU82GyOh3J92s5AYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484494; c=relaxed/simple;
	bh=LOrULc1iZDTGIdl+ETs35u9hgIKubwyvl2ebHAU2vSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuttVPxhg+YY9AAhzE/CUHI6yvEq7Lup13wjatiz+1hgU3V96GF4Vf4hc/FSOwYyWNVe8D9btTVQiDTuG9bGI4ul7Qnl5BlFhW4OaK4B6dZoj5Wxp2ERp6MoI+h0K/oRuh+GHfarFdF5SLJeRWxSvXfO336Jxt/s+2x7xIqcUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KKHStzNz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KKHStzNz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so94676685e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780484492; x=1781089292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvwOj7IozsLi3dm+wQtK/2q0qsSj46KnFnlknrmF+Y8=;
        b=KKHStzNz8CDpKxlJmB79NNHO6J4rSUmdnz50AqbyZv/T//rrhUGjSTL+YbYj1owc/7
         rPhtrelU48GP4z2BKbzR7v+olEXDnEldfSQDHuoACWTa+tB02ShTHJW29Jrpmhe7v2/9
         3oZvKztk4mwbbKI2bb4c8OK9TakD6dt9u9usu9DgOQC1p/7dkDK7dXw6s5qUMDlBrZQ9
         7iAMmzU6BHwkSl//Lvb4oN4eqHHFo9s833loBC7eIyi/lkpr12aH7d7uY0cS4FDpnrn1
         lG7Jug9B/2gi1WZsB2IGZlC40q1e1XeD8Zh8cZYvVi1XTlQPA9zbeCCMxQbfm7JFnuzz
         P7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484492; x=1781089292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvwOj7IozsLi3dm+wQtK/2q0qsSj46KnFnlknrmF+Y8=;
        b=R99qkzMzE+pGwOVaIl+jRlH6wXNaABB6NyikSZAKSB24BG6Wo1bhC7WRiuRIvMJB4k
         nJ4+u7wnTEmhEdvNJbbE1YPl77DbuEmsMF2rUqTlmcdXgBs++l9n/6HwyCmERklbjmIi
         a6fF00HgBmKVwmeOc0LIFlm2wcmLYpOshn65WvTB/YdDqVPBWTujQPybqqnogop1e3Sp
         BQ0MM07iiIyI27zRQcJMFd5rrwI6qhzSU3MO+LxMN/dcUye/Jmc384/kl25AUrt9Y7Vj
         g1ZWbr8O4Ga7YA2imqKcFpTCTOH/OKGkp54tUbCXrxr6ZIEJfG2V2ohatAJHIPqF3XWZ
         28eQ==
X-Forwarded-Encrypted: i=1; AFNElJ93mPbU7WkxrmhQp2K55oY+0cid+TI2k9PV65Ft4IWkF1UfHGlNMcC6/8yaa836q5EUEBy3z/p6SquBCIyjof4yJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiBEiV7oMN0ArZmYlH9RUwtSJ+uFPQdlwy6tzFh2mjF6kgDb9
	gvdrGBiIi8pd1W8fZLV9+GU/bwr4yqei+uH6I0mZ8uYxpx9j7kw39EzyT5jFZBQKZR0=
X-Gm-Gg: Acq92OH4qqjV8OR/9XNFq9ISQEW7RWF0w55dxJoJImIJ/eoqS4wvdTZWzXgVoWuOWfZ
	6aYbyAz9SHLRbiRJRhOzaLK8S3eFkoWbujpPJNKFgtqycOHqI5cP9E8LuEL0+PXpbK+elFW0reP
	0n1tKpXC6BUSb2Q3ggqMuJjOXSFNVUMpJU41kijGFweS2latbtynxoiL0+sIZBFCFPZhTPGkPbb
	gl/nVZeOTgBEzpNIftnkrkSRaKiJa2aQwm4WZWBIH2GNDOz0xtppksaEky6m4zvzZN42a42qdvc
	iE2EhlRLLBeQPiQKZmv2rVgbWGwP61NfthxPD/sdQmjJyhvJtiCrFwjml9T6TxDKEbDDPcrMHOn
	SI7uCQ0fMwYlkdJVVkRYltPdr4O77b1sMDdcnzF2bjZE17sLklTkS/smNza0ysxzJaIpwDSu8gv
	8p28DONZWg22N9Iw3PHwfeBYufJYad48DGtfVZ69oXGFy2qQmoD6sWLU4OrlDutN7k6TLBBJPtQ
	NP0JppDuL6/1BaHDZYNcb3G9E8Yv2++BeQu7u9U8D6Bc9BVwiWhjA==
X-Received: by 2002:a05:600c:1c1e:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490b5ed1283mr47522445e9.22.1780484491776;
        Wed, 03 Jun 2026 04:01:31 -0700 (PDT)
Received: from nareshubuntu2404-gh-runner.lab.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm138908575e9.11.2026.06.03.04.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:01:31 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH 2/2] hwmon: pmbus: isl68137: Add support for RAA228234
Date: Wed,  3 Jun 2026 11:01:27 +0000
Message-ID: <20260603110127.23930-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603110127.23930-1-naresh.solanki@9elements.com>
References: <20260603110127.23930-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The RAA228234 is an 8-phase PWM controller from Renesas. It uses the
same DMPVR2 PMBus interface as the RAA228228 (a dual-output 20-phase
controller), so it can share the raa_dmpvr2_2rail_nontc configuration.

Add the device to the I2C and OF device ID tables.

Tested on RAA228234 hardware; confirmed all sensor readings are correct.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/pmbus/isl68137.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 21d047b577a4..bef1459cec48 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -448,6 +448,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228004", raa_dmpvr2_hv},
 	{"raa228006", raa_dmpvr2_hv},
 	{"raa228228", raa_dmpvr2_2rail_nontc},
+	{"raa228234", raa_dmpvr2_2rail_nontc},
 	{"raa228244", raa_dmpvr2_2rail_nontc},
 	{"raa228246", raa_dmpvr2_2rail_nontc},
 	{"raa228942", raa_dmpvr2_2rail_nontc},
@@ -501,6 +502,7 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228004", .data = (void *)raa_dmpvr2_hv },
 	{ .compatible = "renesas,raa228006", .data = (void *)raa_dmpvr2_hv },
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228234", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
-- 
2.43.0

