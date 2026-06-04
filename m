Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAC38E8DF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567014; cv=none; b=Ou1ns0XTxogZaBLt6RyFfqujqsiJvAWRGNXPcM1x6ayfYpLNYyR75L1bwg9TbqMnH01avLh2PjJ09y+oHb8S+5FR4ZkyUGornQaqSatzFz/KpsnUpqhYfKVcneAMnUBb1r3Ke6wnysPQX3EQzfpEvFtME/LEqCldnn6pdi6MvJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567014; c=relaxed/simple;
	bh=EB7Ettr8Ri2NzRDhCKydd64Ve4kaYLDjIWunWqzwUuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpOOdfx3VocI9yMgj1UaRA+f1MoVE0IKx4xdRgUuX2Bn1pASlcqcVOd0v7OBkn1oj/BQhalEeZB+n1vwZg8SXBvUvZqUqAOgFto4yIp8zProNvMWx4qQi0+/DXC0PLI5dgJN4FisozfMBnpyoIkDxNsqQyVfpuNGP8hK77lkzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I32NKOWI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I32NKOWI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so6444245e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567012; x=1781171812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie8fAa3TVGPNRGFIullgvrpG6cDSByumclgvyRIodhE=;
        b=I32NKOWIj11L0AOOAE9PTPByFiRc79MhMQvqtAD1jko9drrGiTCRoszYqmAT09JNWI
         4gmj+pAaALp9An7ZWcCANlxtpWu37yCLb/PGnzgUBWdIPX56+XEKVe+Z45WT66OnDuNC
         VADZyProxCHs7DzP0e7KL4rCkeRuecst/SUQMCqhPB3aQcIxgkBHO+O9v9qYd0xbZBu1
         XrPOvHdSTzxiRtrq9yiFOPllU6yORfbAW5Si1+PzSJR6dOxaY8pqVy6HlNx3YvR9YMpf
         jx8eyk1dSXSSy5UU91mGLRGs0wmtngE/LfrDN8k/A19elVI7MDVHdyCJXXwa7Cpoqh1S
         twfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567012; x=1781171812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ie8fAa3TVGPNRGFIullgvrpG6cDSByumclgvyRIodhE=;
        b=p9TXdG1JqvzywtZ1kv+NTl2nn6taAHiQ9i0THFr1cimA+JFHTNafXmniJuEt+xYdsz
         F6PrKG1532FSF8RNGFVLNuz8dELSsst6O63FGi4Gjh21lc4nGOpu6ZkHJCxQuj5r1mCi
         9COt4Kve70Fv204uB6dRFBwUkdh7ZCOUGDBPAad3hszopG8YaOeojzWBaMXH+Zk9EPjV
         4+ML4G9Ni1aUrYwvhedRY9+95GHD5RA4RiTxaKdocGJMYg6MhtgXagKY3jd1tsvSwSWA
         1ZfcihBMeoSTwlAeYscFgs0rOjMYfvaoeo1FSc3fbHdVTvlGMnoScm4iEjp1etFfMtBr
         PKow==
X-Forwarded-Encrypted: i=1; AFNElJ8K6c6BDY5Q/2RcnkyqcXLCKGC8/uU9dHRMF6HJ+eRNQUPRhVFVRIFbhklfKYnhMgHc2wSX3CMg44gkVhOdJho0yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGf+1LfRbptWufheTqWa9jBqBms5iiiNElU0QgaCORCj8+vmRE
	F0omWCedFGGcJZ7ikmw5Xfilq8fJ57VjhEL0AKV5YbLUcHqfSzQdnNB2
X-Gm-Gg: Acq92OE7zSaIIaykgF35LkwqHtZ81YMUvTrtwAD0Y+6QCG9pgFljhhxIYYxkSj4HE3Z
	sWTCjBL/vU5HelbeYU+zDg+c2NhoIg3ALlK5BxAyW2uL+YQzieSv1FmORgfCLA1IeNAXuu1slYz
	l2PLF2TOXIP/sPpE5zwY0lPIeoxPSWTfogORZlWk3XZiqZO34+SneuUn4AmBtIvyPn5gTQ/yFDf
	3U6RFl+y41Qn1Tfft4tUXJS0Me9bpPNI4XcL4IEIFtEFr3cJqLwMPKq2kiCba9rvU5WF5wafkVG
	ZjKkGab0y0T119H7eAz6DbXJB+eHj+lRAs+qEeH16eZBytNsRdeTAIgV8aMiOCvILEje249icLx
	2UVmDuH3X2It0htvQJ5as6LoEduXA7oYu6WVgm928c0s8Ru2OSMDPIYuYCU5uUHuOVNCof5Ka0r
	6kBkG+9xyV+/ZoizInPrc/aPpNVsATA0Xq1Aaf5dctQyXRmhLe8/n2B13VBFzStIJRT7qN2g==
X-Received: by 2002:a05:600c:1988:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490bc4d7071mr45062895e9.7.1780567011787;
        Thu, 04 Jun 2026 02:56:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@kernel.org
Subject: [PATCH v6 01/11] pwm: rzg2l-gpt: Fix period_ticks type from u32 to u64
Date: Thu,  4 Jun 2026 10:56:31 +0100
Message-ID: <20260604095647.108654-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

period_ticks is used to store PWM period values that can exceed the 32-bit
range, so change its type from u32 to u64 to prevent overflow.

Cc: stable@kernel.org
Fixes: 061f087f5d0b ("pwm: Add support for RZ/G2L GPT")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 4856af080e8e..c9dfa59bc1ea 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -81,7 +81,7 @@ struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
 	unsigned long rate_khz;
-	u32 period_ticks[RZG2L_MAX_HW_CHANNELS];
+	u64 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_enable_count[RZG2L_MAX_HW_CHANNELS];
 };
-- 
2.43.0

