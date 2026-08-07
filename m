Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44577331200
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786095089; cv=none; b=LOzm/Qj+NnwOJE5CAoYXPVtmriahV/hUkP6eTvXpDqrqoZXP0rr044ytiH/4yahSNfYbD7fsSZ3i4/Q5wKRA06mI/56Br6jY37CdtoebQLeDYAG3iluE3zj9BcJrmWlqBdBppxy+fP6oTHiBXbMzVG0Of3hZkazz3EGwnAkPiN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786095089; c=relaxed/simple;
	bh=odedB3UOGkPbBy0exjOKQa4siMdOu3wb6gH2pU9nf5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ou7bc0qTc+gjMKKbCNS+ha8ywCeQcULZDmPkkYJseUv4ErQiyk68Q5Px2wU4kx7ZfGPxQzcneD2Jdi5T48mdx+zhU3TCMpcnNEr/IAezRYMHMsVAkGmW2QmDPF+omnNd7LH9AgvZpeEngwvojswnG2v7CWDxhrJ3ggEpSsMRD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5YXUPVz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5YXUPVz"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d02b4c3601so35563145ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786095087; x=1786699887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=Q5YXUPVzfN56mA2utw9ERRaheOL12jdxgKbhgDtqv2RJ0Quti1FOuoBDhQ+A0beBoO
         1DTp2emEfrhq78jIOwrv0Ay03je2BkWMYaIUk8bY9hUV2MMgwBQK2LrarLjzz8ac0FFa
         DW29/mSzPEhCAqzRHRriG+1V6LZOjFWmxg3NfPnD2vxMt1zFda39/aFyz8KphXABxGHw
         Dmk/w/XxEIlHnpxsg833dlnIVJyYCInmdRJ5obec/KslpTF91+TjxoznQmOSiWQl4yjg
         V/n9tRNthUiJyeUkCa91bxc/M6/9xekLDC4IqowEJXdG4pElAKXkevp/TmHkSr3ooyCx
         oAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095087; x=1786699887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=Durs5fvYaNdtS/sjIG484Gu/ONqu2YG5nl7zqDgh0HzEdWtZKdCq2h5k7dKW2Fj3AP
         2Rn737EAhfaf42bZA7s0qmJPPzcEbwJElStHTdRb3EU9WpID6sC3jHsSJAIAvJ7FvysZ
         fV30soKfgr98u1eUFfL+U6/NEUMogUZ4t1+QUkRiwE2DGFXQia/k5xw30sLyJcMmBcOU
         lOblZy+tVs1pLASxqxWN2aUhMvTTcPucyBpBfEtSdBb/p04eBp535eZWH98RyAW1g9o0
         nXwgKpSTZ34LEbvnUUFQxT38Gf2TUUWnHw6nt515Cztiw9hIPzcKgZ2T9mF1+wE1gli0
         EpKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC13xmMeGnyc7PqhsEMExryp0ecnO6UaB8uW+qp2XgShxpdxWbEz3G+a7WH8WWfdXrG3FwKv1vMlaydxqaSsx0xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOV8gS4L/nHGLedu5XWzFm9JJ8k7CGGO6iNzbcg9QoasCYRPqh
	Qfv/UkfliEzmTAN6Fu946nlx53D3pbXgDMCY4I7A55+5R9CnTjBeo7hQ
X-Gm-Gg: AR+sD12Ne8zINEHgWaRX+VEy8/IiL6v1jSqGJRds4KJHE1EoCm9gIebOodphu7abMhT
	9QZ2/JmP6QLj3KwSUkkdxbgWkOp2bV7dya1oELNUHm1K77f+dEugwIzlsP9lv9ehKOv886s/HKC
	ijqtFfTemKYYziI8oSDaNyao7mOSyIUa7abhKwH62SI6Ty024uPaXKgE8dwQLNqlOV2e24PqnET
	4m580kPkQW11XDrpF2/MaLuEYyG+dfRlLWIkkhNzWpUQiLS9vau3LXt05+JbSZlTk5jSC2PgtG8
	79ZnQ4/Y0WI410fmMz//OOiyROATcSD0bWGxLX+1KNHYwSJu5UIydbrk27oKkUdmlPYCNTsjABZ
	S81LD/wdeEV/Bc6D6LgFq3bqJ/5Nx+FKgH4UxHNjtRD/6OBesD8mUVjHK1pjOW3mkF4pSOlIlxJ
	iZqMBRq46LfufHyKT1sEA6K59V10zPykh5EEvuac4WyCnsSGYb1M0ecieModgaFVLFZG81gZeM5
	YB+2wUxPWZyaD89SWdDx0utNt3hECq/NcY/RUXho5VHRISbJbjxiWZPBkK7oqrKGyefOUaKbvYF
	+tCP
X-Received: by 2002:a17:902:f60c:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d0ca7835a7mr253268835ad.16.1786095087520;
        Fri, 07 Aug 2026 02:31:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd8f1bsm6347525ad.25.2026.08.07.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:31:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] thermal/drivers/brcmstb_thermal: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:30:58 +0700
Message-ID: <20260807093058.42840-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807093058.42840-1-phucduc.bui@gmail.com>
References: <20260807093058.42840-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index a9ffa596f7c0..477d078ce326 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -350,7 +350,9 @@ static int brcmstb_thermal_probe(struct platform_device *pdev)
 	priv->thermal = thermal;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						brcmstb_tmon_irq_thread,
 						IRQF_ONESHOT,
-- 
2.43.0

