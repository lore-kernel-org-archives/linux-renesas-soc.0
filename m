Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B8A3D47A6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154267; cv=none; b=Yak1+wSsv99W9wcarVVGTbeLPSDECP6gkmXGlRYjcNh7v7X5rpDHISnH95Au9HWsPPWOcAC5k+mP3ryrr5unVm4JRxMTHB5K0bYGiacyNvyoucdYzwco4NFh3nPQiMvC9yloPBsfYTl9QCNMP3HS21xPUK7R6YrTMODqLHGmPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154267; c=relaxed/simple;
	bh=nu/mr1w3NatjahLjEdAIObZx3UpsrcSmvOjxdVnI/Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mvfl2WM5tsYffDowprTPD6UN96NLfCUIEQJfCi4ZAlKNYRWrc2c+CyFJ0I6nWCEa+1oFbUUgUiRBdHckf4SknZGwy7Lff6iYKtTaJR+ITTYR2ptJDEpWqOfjgyONmHLHfmR/avCReat9bQ1wdmDSV9xnpUqAvBfqJOjBxPoDEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY0QXd53; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY0QXd53"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1843920f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784154264; x=1784759064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7wn2+V5yX90KO7wkjapPWJb+BCChpkYDpDV4HrAyTc=;
        b=iY0QXd53VTRhLW9GNlduk25UMkZUEl+uNE/gP4hheTnmwzIfyPjaGuwO4BX1M2zxoc
         5hYiVm+zzlo+uccpXP9wFMGS1Aw3A/58G4XEyDbvJ3piPRa2wJdbX94q01adFnbtk1mW
         1icWbY2GkO+ybnEY8vY472nbTkgEZX2KeNAwu+qIbItv9+VyiU3yRsKjnCT7fKKB09t4
         pboZCOCJ3JCA4jAOjW8BB8V3jhsiIwMTJR/MGErEIiOS2ieCmo1xu4qGxnPmNy/Rmlzx
         +aCLwrIzxjDfe6Ejh/i0onoX1Ezt2Q/XDY6CZ7MlOLn5CStPQQOfbuUM8+MPHvJZeF5i
         fq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154264; x=1784759064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7wn2+V5yX90KO7wkjapPWJb+BCChpkYDpDV4HrAyTc=;
        b=K2pWhNTaB3wmIleoEqWnqLBy4V0xmk0VD8V7Pzbco/EoxL+MxPIDHIbO4JtbOoEYr1
         qRKRsUjDwp0Cnc/zzfOePlybili7dYIg4B32WvGidFwu/jzGSXLHLOYlz1+Be1cXRlWk
         KiiMyLsvmZC9Kt8Y6C0GHDRjM7IjPmGR7lJNmhPZu/HTFPoIc3dWuq2cTGJIcLECalS/
         vZTglpPY+umKBrllDGQsUQDK/0jQ8+Poj0x+J2kdjuf5ZZFhkF4/Ejd84ytYudHFd2LS
         1IVCsdSAEyjcEM9AF6Cs7ebTQdEb0WwTGhXDKkpRw/TAI2tWyly4WH/Icr418e/UgOj0
         /9lA==
X-Gm-Message-State: AOJu0YzD5+ZXGiNIATXtr0ASFyrtjvT8gfeBwOwkmCPnnt2NV1GdWRPm
	fj7njvVWsQ1Tg5nuEw3mUTACKfK00+2bOdqPFbHL64Lbk+oLEEcUhCfM
X-Gm-Gg: AfdE7cmNNGoKViVs0JZJiwER379cC+niPO2AayoENLTvmsMIb3LHnW5E8NRuRO75Zod
	gZ/wwTkl4kyob+aWfJ4Lq4zY7CoQjjAJEW1EUvGE+suvM/qGJphpnJ7MUq392KC/z4p21Ztc5p8
	VAWSzGQ9rnNMKXj0L0KrKG5K6/Yo5M8Rc3MFlWKs/1vcws8hUMGe/kvJuu675dk+MPRUfNhkERp
	vH268fCUq5sminjonobhNvd+thLzg9aC6w6bUfC3X8e7aUj0rWuo0KVFz/UhWjWVxb5afBeXIrp
	ZgrgqYcQOtsKJ/OaSBPbaq9A2TzlH6DqSYZxKTz0oFYIiktFiNfoDZBpwBZ+Vdm3TA9giptvez5
	ruPB86vMfAAsWPW+/hIiLxtScRJbG+KlJecdFsqDTp1SgvzoxbKukdZjs1xiy0RQV4ZgIqBs5KP
	gbNzXmOUsNmSGFq1ADerFPmTwN+uyf4mqOJghYg3ZKO+3SDc4Mo0Fv2JjS7VvtvM5x5CDnLus3s
	UWos7RTzNceHeBYDyiKUrE0ChA=
X-Received: by 2002:a5d:588d:0:b0:47d:f508:42a4 with SMTP id ffacd0b85a97d-47f2dcb5c6fmr22018675f8f.1.1784154264234;
        Wed, 15 Jul 2026 15:24:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e036sm22337783f8f.5.2026.07.15.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:24:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/7] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read path
Date: Wed, 15 Jul 2026 23:24:14 +0100
Message-ID: <20260715222417.2997712-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

