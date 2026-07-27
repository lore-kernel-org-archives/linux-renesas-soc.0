Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B573F7884
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148502; cv=none; b=gzHcmvoR6W9Hdy/HrRle/EDyFF8O5pOTUmcmvz2gqm6/4Xc0zDcJ1q+Q8zbaoCn842rMB96VSLbhV4T0hPvT0soQXcVhNy8x4d0nIrl3i4sf3VeS7F26U+NQUjL48QsKB3hVMfDrXGhSoqFDi0/7/fBL6BMioqJ09gkixIClOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148502; c=relaxed/simple;
	bh=nu/mr1w3NatjahLjEdAIObZx3UpsrcSmvOjxdVnI/Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7uJxtIat7FbzOYrIWjeFLCZQseRLTmhW1QU5lJHbc4OVE799E4nj98gAd0tMoySY3uPisdKQOxYLFvkmfV9rABHig/byYtG55nURyvkPendn3Fo/yLd4OBLlw7iAyRncU8ZXkopDw4FmRz192LUT7paPfbe4vyh/VBOM+VZZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH5ALkCM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH5ALkCM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so25629475e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148497; x=1785753297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7wn2+V5yX90KO7wkjapPWJb+BCChpkYDpDV4HrAyTc=;
        b=RH5ALkCMt7z7mkMzFJuvYtupbm+CQmgGjHjlALQW3CvhcbCxa5dxvGKw3STR2MkF0M
         3MNv+kKwSe5tvlM3BoH4n01aaIxFqtzeIzM37713omAoke83vfAjRU0+CO24jH2SFwZF
         dbiW7NurgqDc1RnKp6EYy8VwIOfcLQf3/HMqwo/RZsgkuqsR8F9QDHzcNXwJvFvHboDl
         TjL1yym52lpueRU/kahWpwNNAGKdZQFJz7nFxwSP6sXPw2cV3avatuDRgakGSPoKYoY5
         wv0PL4kzDU5CORaNjKQvlWGtTdUDiQ7hQYXaFuPEO5b645dUSFd/3Xoe4XHCwlEmDcc4
         1rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148497; x=1785753297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7wn2+V5yX90KO7wkjapPWJb+BCChpkYDpDV4HrAyTc=;
        b=LagWSWTE0pOGLYs9oZcyK1oe2v0Am36+yCKPIlff23LzcKu/X7zKp6sbuumbCBzNeS
         ekx3L0KPoGkLRjmswNtFnfZkhNnkiPDdHazzy+MRMe18GZhxTVrHgVUU3YXe9P54mxZC
         M0I1cxjLIS7KkqNX+v24Jif2ADQrzJnZMxxpi3XydT3h3Ae6NxYpGEGZr1dmSnO0X7tN
         FBHfkEvMXRGuPRjDa+YovIWgY8lP6MmXol73IqFGckF1/4P6KbefOklIrQXOa21aJmyT
         refghm9tzxByN9ZlVbKoVk3Sltqw9e+DjV/N3vV+EIFdDRJjywewgvrKsOBa6Aa111oQ
         flog==
X-Forwarded-Encrypted: i=1; AHgh+RpCdVmXJANMPZ7RRB/cuca1sipoOfITo2LXufUJ4Vrjbr4k0uHmHsb+0nPH77c4f7gIC9F8JIBeoDAbAQ89SzUQ3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUveB/YF1mz6/p0xPXFIqgnfSxf7YKTiGy5Pr/Rr3gIkdDYI5
	6SVEBuiRCERtnLdsyhvhXIRH9CZwBzmjEMNzWOwwVJVsRNozIfP3/IGv
X-Gm-Gg: AR+sD13+FOUDf9qbfRuQ4SylVVcXVec/bYJIWBGeIVZyTTCgFHihxMD6H93A/rQjy8t
	RIeTH/eLfrO1ImpQ5GltfDVc6q3yAujoZhne0QuQnd5DelpwFZPrt4hswSlYFOqO6RH8xaImsOi
	Sbj6HOaIB/nfDWnQyzZCFsUEpyrjYBJPRx1O2Xh65mEmMgEGXGq0vL1vkOwxwgkBxa/pTQ61MJS
	B9XuXBg36xgsdDsOVmCV3AeWaRcV6TLS0eNYV/hiiwyNSlq3P9lnDofXxDfXSRuZ3GRaAgjmBb6
	0IO92XdQuBJDrglt7o0gkCQtqSIoaOHgyi0Ai/nWvDzAsYtNXQyCn8iyVFxdWUORO4Lnc//FU/7
	+nHVSr7xjd82PqVO9oh1c7BYU3QjqdQht5EG5vJacVvFXOjf4NU2mc+ec0eImfO6bFR3vslHXTM
	ZUwGkzgAovVyJL8NVQhoNJ/YKybI2lrVHRgqK0WI4vftQCkHZSKi9A3wvCVyP+OoKztxcfYkZdH
	H94P6hu5u2bwlg3
X-Received: by 2002:a05:600c:4595:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496b56f461dmr98133465e9.0.1785148496744;
        Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/6] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read path
Date: Mon, 27 Jul 2026 11:34:47 +0100
Message-ID: <20260727103449.3188105-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Program the XSPI_CDTBUF0 fields used by the RPCIF_DATA_IN transfer path
through a single regmap_update_bits() call.

The existing code updates TRTYPE, DATASIZE, ADDSIZE and LATE using
multiple read-modify-write operations on the same register, even though
all field values are known before the transfer starts.

Build the register mask and value first, then perform a single register
update. This reduces register accesses and simplifies the transfer setup
without changing functionality.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index e406afc42616..c768e9c18556 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -697,30 +697,33 @@ static int xspi_manual_xfer_impl(struct rpcif_priv *xspi)
 		while (pos < xspi->xferlen) {
 			u32 bytes_left = xspi->xferlen - pos;
 			u32 nbytes, data[2], *p = data;
-
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_TRTYPE,
-					   ~(u32)XSPI_CDTBUF_TRTYPE);
+			u32 cdtbuf0_mask, cdtbuf0_val;
 
 			/* nbytes can be up to 8 bytes */
 			nbytes = bytes_left >= max ? max : bytes_left;
 
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_DATASIZE(0xf),
-					   XSPI_CDTBUF_DATASIZE(nbytes));
+			/* clear TRTYPE */
+			cdtbuf0_mask = XSPI_CDTBUF_TRTYPE;
+			cdtbuf0_val = 0;
 
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_ADDSIZE(0x7),
-					   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
+			/* program DATASIZE */
+			cdtbuf0_mask |= XSPI_CDTBUF_DATASIZE(0xf);
+			cdtbuf0_val |= XSPI_CDTBUF_DATASIZE(nbytes);
+
+			/* program ADDSIZE */
+			cdtbuf0_mask |= XSPI_CDTBUF_ADDSIZE(0x7);
+			cdtbuf0_val |= XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes);
+
+			/* program LATE */
+			cdtbuf0_mask |= XSPI_CDTBUF_LATE(0x1f);
+			cdtbuf0_val |= XSPI_CDTBUF_LATE(xspi->dummy);
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0, cdtbuf0_mask, cdtbuf0_val);
 
 			if (xspi->addr_nbytes)
 				regmap_write(xspi->regmap, XSPI_CDABUF0,
 					     xspi->smadr + pos);
 
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_LATE(0x1f),
-					   XSPI_CDTBUF_LATE(xspi->dummy));
-
 			regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
 					   XSPI_CDCTL0_TRREQ, XSPI_CDCTL0_TRREQ);
 
-- 
2.54.0

