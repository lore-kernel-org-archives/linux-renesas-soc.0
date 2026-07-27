Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF03E5573
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148503; cv=none; b=IWHpn2sogTYrQO8qyUD1poLMLPMM90xiVy2ZlyzPq6O6bHwqoE3qBjbddCGoHxWGZ5nWYJ5AHya1YuWdCmFj/l7Z9mcs3WfQ2lot23aySCCxv+ckcY5opXY2VyezTuqmf9qtRFYy23OiHyQXngCudfH1Xs3EMxc99rhSHng48Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148503; c=relaxed/simple;
	bh=boNJ69izu4Po85DlR23ZFlw+FQnVPLgobCBMIw4FxB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3sK3mp4o8QwUYVTbE2a4JtFT8aCgh2wKviyrVUMGZOnVl1ZFfcgYUwsyOefkE2KAEqsG9YX1Ym1gIIoyXUweP9xdO3hS1397v/JIsOkGMQW4rBW2sT9Grot4KK2X2TJ5se06F76EQGBiYyhTDXsijSkVGMpYy9FBnJOXAxcA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvGN0eLE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvGN0eLE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47362928f65so2400148f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148497; x=1785753297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayVRODy6318qyfpX2UfGYb1K/edgs5jcIKghZ58HX3c=;
        b=DvGN0eLEILEdMvABrh3FCIwkQ95YDnAZGo0s9xEgqCtcSqbDzA4BZLJVRfXU+R/8Jy
         SdUWFYBj3/ECccPTOaxi11AeRHQQqXcJ867c6IDe/EGJz7PKDc6b3dXFOYsA+NcpQFrF
         RJPFuVJgCmqz4uYMF5Eousz4j73hs8pGHyAJafFpYqSuFdMfVqMrzB303ytSTs5NKQFu
         An9AuNYqKi6k6/c0mfRe45DEhB+G3Bf15mVgs14Hw5RQ0nAJRBUFJwXxmIbgWFTspsAw
         QUwpF1mU+H1WfUoSSaYTA2J+thnUG5/pM8XAhQdancDNhMxFVoEWbAF63GAdrnz1K2uf
         Vi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148497; x=1785753297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayVRODy6318qyfpX2UfGYb1K/edgs5jcIKghZ58HX3c=;
        b=mFKKaOCNJlPjrv+vFBAV2cgxhxiLAmKADO/7wu4Wiwt3+AuIG5t5j+SPNoPtww9KVV
         nEWeKH8hUXiztKdqS1bRHnukca0JHGTRNMJNPnOHB5p5QPv9hf6U+VUbjppDn2ED0bpq
         arPIY1YEe4hqj/UtJ+BCJjunLq4s81gZTjNm6YO9vi9SGRZTkOgdbIsIoUFPrw3y3Em9
         nQbcCNuRVINZwPVMKtkfuWfxQUjSR2O2nQbeuEDCIRGTpK+Urh6W02/LXKRbPZGqi0xa
         7Lx8GIt4mAwj0evlYY0meQkBM1bK5UcJGyA6BhBkSX3THpau2szRKgpriFboMrDHneMh
         juDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpO/Wf5GnTBmfBOrFdeaC6jaJki+E/mSglTm5TAI+HNLsdlxHERH8K+6w0zPI3isvlw7EAEPRg450+W28xGDAD+QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxACBWaSiucju5SfXCsswR0Es/DhGep7+qXuM0SDDcpacgydnR+
	K84jMVZIG8k5lphcOSaycblqfL5ldAPa5DgqUNmz904MgFR0uUDX8Rg4
X-Gm-Gg: AR+sD11OgDg3Z+nWPobrqn9IlM0i3zR+jZ4hVO2QIYM7Girdx6uFzzKBfL3Az0ypUtf
	S+TKqwTx9IJQHh1bfm1vbWH0Cqfnw+UdsKiVogJGHQnG3XUMCSwcOx8lXvVCCboqaedAg53OPqj
	mp+FYz31kSPNK5cZFhcfK22d9myF8Vka+Rs1xi5vNHebk00vicULlomOdMpXge02EgM4Ua9iAhS
	2pgjWO9J0rSA2nHUbalFUERh/HooFEf7ME/gRC8TviP8prQGHsj0wUzSppdziRNVWdGgPt2N2cd
	z9usxR/dbk9TtMAaX3r4CpiozGRXYJAwn5OZEOR3wHrV7WVg4Qco+aVVGsjYn/DJ5hwORzwvBOu
	qg41TEduYTuN2vcCM4FDnXETSnV9ELA3vQL7ngi5GSjwmICqdo2/mw1XDwIzQH1ACGOdZNNx4Zt
	2V6J2+21a4ZtAMpxjHijWmhkPCUslUT1QClzZZbvQNbmdmzPRZ9Y09TbvkNbhXRW2qJnPqdaG/A
	RC8kCVciOkRdA/OpeEgczmNfeA=
X-Received: by 2002:a05:6000:4022:b0:47f:9567:e63b with SMTP id ffacd0b85a97d-47f9feba07cmr9753183f8f.55.1785148497404;
        Mon, 27 Jul 2026 03:34:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/6] memory: renesas-rpc-if: Consolidate command setup register programming
Date: Mon, 27 Jul 2026 11:34:48 +0100
Message-ID: <20260727103449.3188105-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the command setup sequence in xspi_manual_xfer_impl() by
combining updates to XSPI_CDCTL0 and XSPI_CDTBUF0.

Clear the TRNUM and TRREQ fields in XSPI_CDCTL0 with a single
regmap_update_bits() call. Likewise, program the command, command size
and address size fields in XSPI_CDTBUF0 with a single regmap_write(),
eliminating the subsequent ADDSIZE update. The intermediate write of
zero to XSPI_CDABUF0 is also redundant, as the register is immediately
programmed with the transfer address.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index c768e9c18556..d98991266887 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -636,18 +636,14 @@ static int xspi_manual_xfer_impl(struct rpcif_priv *xspi)
 	u32 pos = 0, max = 8;
 	int ret = 0;
 
-	regmap_update_bits(xspi->regmap, XSPI_CDCTL0, XSPI_CDCTL0_TRNUM(0x3),
+	/* Clear transaction number and request */
+	regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+			   XSPI_CDCTL0_TRNUM(0x3) | XSPI_CDCTL0_TRREQ,
 			   XSPI_CDCTL0_TRNUM(0));
 
-	regmap_update_bits(xspi->regmap, XSPI_CDCTL0, XSPI_CDCTL0_TRREQ, 0);
-
 	regmap_write(xspi->regmap, XSPI_CDTBUF0,
-		     XSPI_CDTBUF_CMDSIZE(0x1) | XSPI_CDTBUF_CMD_FIELD(xspi->command));
-
-	regmap_write(xspi->regmap, XSPI_CDABUF0, 0);
-
-	regmap_update_bits(xspi->regmap, XSPI_CDTBUF0, XSPI_CDTBUF_ADDSIZE(0x7),
-			   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
+		     XSPI_CDTBUF_CMDSIZE(0x1) | XSPI_CDTBUF_CMD_FIELD(xspi->command) |
+		     XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
 
 	regmap_write(xspi->regmap, XSPI_CDABUF0, xspi->smadr);
 
-- 
2.54.0

