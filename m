Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736EC495518
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320649; cv=none; b=aDrw4oEh0klEWB4BZolwpgeQOyUmeHrB05mGZyYr9cbhCG8LGC15z8E0Tb+27XI9gtqcKH989skOvPB3hFFiC+eeB23R7vrQ89dN7dHDjbOOwCRVPfQP3CKy1fVoHtuZVy515TyVmll5z+NBpmroEN52gkI3DMfyyYp6w1yE4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320649; c=relaxed/simple;
	bh=gBBs6/Ia6sSV95Cqo1e4c2MfPAgzo8DPkk69LA9oeJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVF992LDFMiYxJXKW0F/WyuTfEI7iTnDzNW3MA1WZVvFFUU0tlKT5D5Vbn/hXlSQSz6A36qfcLVXmMiSlY3Dq1J6vLo3CX5fWqG1H40nvuT8eIwYs1YQn8FdszxYYdTij3yllNHPc2sz4jnvg+9B7DBcgLm5hreFHklayNTVsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0DBEXGs; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0DBEXGs"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so1334149a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320648; x=1787925448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YJ6zhi/Ow6W3tSjF84cEQa+6scy6/f5V+3PwsGj9A4=;
        b=k0DBEXGsNvnzXh4ighT4wkhQELGDx5KC/Z4omO7zYMxWP4ssSt4ZatUjqpS08Lol57
         O/kd5mUm9iAmpBQvhL863tqvahR2xEVsJMvKOtguGe70pFLob7vuhbpgIZrPEqR0dbwr
         5CsDBljk9VnAiorMrK98DA4anaDD5kRHskHiqj3W6NJ1hOYOtSs6e3lUZrGdLoI23KJw
         VLu3bQmBMulNLLmdIF471xa4t+MBeImCY9UlE2+kp3EK8uLamDZ0vOhsCpXbxWnNtycu
         2dMPcA0imK64YIReNHi0fhm98757ogczBq6QQqpdrqaMtqLp+UqZAsWbvsefQIUIZGYn
         A/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320648; x=1787925448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YJ6zhi/Ow6W3tSjF84cEQa+6scy6/f5V+3PwsGj9A4=;
        b=KmT3q8tvLMzhqffQzRlSj9avNzAurshMuDUeZcOza8CVmaTnDdV3fyfR18guw4mBFY
         /MMOHML89gKjr9PDSJc4WbhBpTkgPIQwRvLOFfgqoqSoSP9Rr+DFlbu/rOC+2SXw/myZ
         4JN4jpUpLa76UyYnxuKACriQ/JuUrmuYZpVgV3WorclcysqERQvcL/k2gb8Mvs209J1X
         u2q4HVf61LaizYpZ7CikmxDw+tmWUWYAX1LhG3b9RcLu4U11b7wRzgIUeBimiLxFrq17
         XWwaNjg2mwO3z/UMRb2Y2GYnhht+NkdywNjrJ+9rtW/yY1OSBM3HryW4NKfS0wT677XC
         EerQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJH3PT9AY3LDJqU3FTR/MKSG5WYlrppvOwRE9aImG6b6of4wgs2Gj/uPtu8JEEhcqR2vBn2OK5STKIaI4XQKBzlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kJmThJN2BvZ8qLCtyyREORLrZoV+GccF26/mvvfQ3vNzRgtwhA
	eAuw6O4LAPt+4AIUcn5KXZgnD6RvLVhu6pLwdjfKiIRWPyuzj7V7Vm1h
X-Gm-Gg: AR+sD10xaRyha80IslwHaNh/Bccq69VvbQNXRvIINhoIiJX7Cfgf7A7IcDt4yvJhjR0
	EKKe7HXljBW2m+srau8trGcltueriWyxXXyRJOElPW5oJaNBy8/4rw/bOHfU3FPm/4nkAr6GGIL
	XwJYJFu1RFQr8lUGLLb9qPnaDYk/CMg9SFyV/Qmri/i9NVFOdaSWeTQ90p/74GtjbdrNX39Tq1E
	rDGJfYopjnAdEMm4l6rWl0DWlncxHaJIk6Rz19dbxv3xBCLygyq6Hv4AKEZt4AcbZnhJ2OBW9+X
	1Nu9MfADsqZqEhBkmyjctgBvmaL7WvjRlShx8QYwKG7ckLKOa4MR5wArQJULw6oFqog3uRpZgv1
	gWgFb+2ozKUfVGhEu0T/+osaZzaGii9DFAjdcKrPE6Zv6t/w73LZateUxVGzDaHiHeClhDmwtmy
	tT7aqOmvkJfk7RDN43SmF4AU13BMZ9qOM3oLVuadh6Q04o14iRXNwf9fSODuh55mxf4CF4jdBZ7
	3O9iPs7gT9ADzySDYYU/2KS4d0gQtdWnaO42U3bF7ytrWwtj/BkJyR825Vh7vjP85kEJJAwMuoK
	1SmwSnhATA==
X-Received: by 2002:a17:90b:2687:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-395c383cae0mr13124474a91.9.1787320647529;
        Fri, 21 Aug 2026 06:57:27 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 09/17] rtc: rzn1: Use pm_runtime_put_sync()
Date: Fri, 21 Aug 2026 14:56:00 +0100
Message-ID: <20260821135608.275233-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- Updated commit message
- Moved the patch prior to the patch that replaces the .remove() callback
  with devm_add_action_or_reset() 

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index a7f22a491d61..6a434cb418cd 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -492,7 +492,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
@@ -504,7 +504,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
-- 
2.43.0

