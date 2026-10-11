Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F43624D3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759454; cv=none; b=VCzxSIkW0mvNCdqZMXt49TjWJ5tjpsvkUEHQZ5KRdVB1gAsgT0OjlRXGj7ySj8lHz/VMCpYRsRw6UY/geJouf4OODvPCrVE4OdJHyJhtmUME2N6ZY6PYTl0qzei2LQqTfiA1XgD6RByvjfZNUZ2UAsTtr+m/W4wN4rRWcdjx4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759454; c=relaxed/simple;
	bh=A3frJRbgFu5+5O2R8VBv3Aa+UByoDPMczSVLagotiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7GVA0YVgDHSJNcF03Qsef5bUqP/IfJmuPS/S4uB1WvPrFHaGDtutemMutrw8fstrfrVv10Ja1x9a2urq2wBSO0wLDc6PABRedO6qji9gs8mEv8MtalSkj7mT44T8Gt6A8XKENaDbITkO2QbrqwCjL23qlZBcWTZtYb4y5HvQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIkgS7s8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIkgS7s8"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93a40a9a01aso817742785a.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791759451; x=1792364251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8uKt/ohPfRzbFT8UsrIleN1or4CaNtgzFDPt385SpQ=;
        b=iIkgS7s8L8qVDoYxsEHy55/6uIUUhrptjsuVLqn9VmB9b/KPhJmvcf82s5+K0/hb6d
         x+/N6JRObnVgExwdqmz1p9c8GZzVaWJHZ5UVA2+pLYdG41OXzPVwchkuvdac+4t3o3DE
         ODVwdwhBiemi7UU0udwe2rnmUJN2Q5yxO7Z5vQJ/iZPv3cV+WZVcS8yJD/oeTOjpm88r
         /PC4t73E/kLI3poq2pVhVaTdn3kPzxKqdM+HVy3lXlnDvm7wJuYwsiOIumJjV4U5ZR7A
         r7Y+odcFsrdaCH70TMsd2czw/hJ2BjQmjZSei+6ZFzeeZ96MKDjrhh6C48v1o0ZpdsXj
         f4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759451; x=1792364251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8uKt/ohPfRzbFT8UsrIleN1or4CaNtgzFDPt385SpQ=;
        b=sIYP2efRAQ8Jv4EtvCxGTAUrNJNvHSs5Kuc2rgdK50j16VqTbnaij71EOv7tZOFJXX
         gDWSpwLWz8bOzTNJQsk498+BeJzqbV1LFhqgFzKzCVni85B7vLIzJlp9RUzmTBq5ZuIC
         lecVZ8eCCL4fHkU7ZwsdF7SUBwBiwnqNM/MbPqx6tNN7w/Mcy40EHGJM1zbh1c0NUXwO
         hAWplRG5cmA2EViFTaQyAUMj1KgBoHnk/FTIPcIdjPsY4OOzwysK2ePJeEeXDeIOK1rR
         IlOSbTu+y4iTaE+b21NdARAVV3NhLMbA4ZdkPYDSP+vUsHR6d3v0oEBQTziQWx4WKKuf
         82fA==
X-Forwarded-Encrypted: i=1; AKwUvBzCIjM3FHc6Jjs9V4t7Dms6yS2I5DbKYOJ7ORz98ncYDwMaF2sbDDIWqGYhDjqmnCPFkKhPIe9yl0JIm6AArtfmNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTZe4b7aL8IuhVCaMzTYhG4V8KxxhLoBu7/wGsv0BbNCmW9qRm
	Zmws8jnCizbhiUINiGD5qzMzE1Lj+Gb0TnSUrrHu3XKTXUjLCigD3UwMT3hH4cZxiNhH
X-Gm-Gg: AYBFou3U/QG6t4FNh8WPcdFdoGz02H37yoHTJzjQAwy+jVgpOGDFK5bBY9tvlxhUnK0
	oZnZAdmkCVsLMqc0XzWzBfjjA7L3oThzJMwcZNHVwBD+biEa+NR2hJB2ph1drckLYQDmdPCR91l
	YN/zB6JEPYGQ5PFudlaoEks0pgcwTdpvZ4LFNFQeeThr3IWxKTIttG3XEV5A2GrAs2t0iXwueHO
	r78NUO9tL81QCTgsh0/o4JifY94rWlEDNFJ7DPqHoSBi090E8FEWV6VCp9y7MH1pNUoTEvUfUGz
	6OTppzfRh2W6YaCCV3FGyOjaSfptfi9ZpIkVWOCWWoJOUUoS6FGsuRHN80cDMx8ZsSy9hD9SmYS
	yq1AZR2B3cow5hQRtklNRwbny69pm+c6jHzBmB0erbbpChJgTvmWQZHpYXuP0pR8chFewI4oweO
	M8bGmroiu79DuMLbG/wFBRZaS1AndZBjvkwdG0vQR+n+t516HPlx5dNFUIamueUMz8GiSSUdcE0
	geK2ZuLPLCnSzdYsUWb6v5bljQrQUYjnKadCd3y2KUNFm8Wved5iQZ3RwtT24NN5Ydb1gmzVg1q
	uEboUrAbMzk9E8QONPYYYTSkEdIN
X-Received: by 2002:a05:620a:4102:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93ec1351090mr1103172185a.10.1791759450718;
        Sun, 11 Oct 2026 15:57:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm723647985a.39.2026.10.11.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:57:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 1/2] rtc: renesas-rtca3: Initialize the RTC before requesting interrupts
Date: Sun, 11 Oct 2026 18:57:24 -0400
Message-ID: <20261011225657.rtca3-irq-ordering.1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011225657.rtca3-irq-ordering.0@gmail.com>
References: <20261011225657.rtca3-irq-ordering.0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alarm handler passes priv->rtc_dev to rtc_update_irq(), but the RTC
allocation is managed after the interrupt requests. Devres can therefore
drop the RTC's allocation reference before freeing and synchronizing the
alarm IRQ. Masking alarm interrupts in remove does not wait for a handler
that has already entered, and a pending alarm flag can still be handled.

Allocate the RTC before requesting the IRQs so that the allocation
reference remains valid until the IRQs have been freed and synchronized
on both removal and probe failure. Initialize its operations and time
range before requesting the IRQs as well, so an early alarm interrupt
cannot queue RTC work before the operations are available.

This issue was found by static analysis.

Fixes: d4488377609e ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

One existing FIELD_GET comparison warning also occurs when compiling
the unmodified driver with the same flags. No new compiler warnings.

 drivers/rtc/rtc-renesas-rtca3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index b3875d041de5..c304ed60edc6 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -765,12 +765,6 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to setup the RTC!\n");
 
-	ret = rtca3_request_irqs(pdev, priv);
-	if (ret)
-		return ret;
-
-	device_init_wakeup(&pdev->dev, true);
-
 	priv->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(priv->rtc_dev))
 		return PTR_ERR(priv->rtc_dev);
@@ -779,6 +773,12 @@ static int rtca3_probe(struct platform_device *pdev)
 	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
+	ret = rtca3_request_irqs(pdev, priv);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+
 	return devm_rtc_register_device(priv->rtc_dev);
 }
 
