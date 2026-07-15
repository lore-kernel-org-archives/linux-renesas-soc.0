Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554E3D4116
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154267; cv=none; b=InpfY8asNwv1leHFCDx4o6KZmEEZ/RIWPzRRIAO7UHDLsO2+zSTq9Er+P+TuldPdXPsg2vDUbnI78njlcSZ2VxtpfsFToOo3CYL530TIqtUJOoI7y4xQlshHCERCPoeT0eNwmfp06qZZuZjHTKNM8ehXYz989gVu3rGIEnNImsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154267; c=relaxed/simple;
	bh=uwqN8ydh2yWuiSaCkv//cC0Jf+pSP4PQ94Q3elX3Tjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4BWxbR3aeEIFS6zD2ZnbF+JUVv9C8sKpYmXQVgcBscILJtDETRbhv8flkR8Ntpht2C6NSMw6v+cblqpYvQrwA3TF11YnAcY4gEWeI+VST49O75z8syvUXxtQr6NF5fowjNdKncxePPRDaWqLafKcsrTR7pM3Y0ovxJl/eLNNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzLAb8nC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzLAb8nC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so24514875e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784154264; x=1784759064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rx6OgR/abZgnW2Cg5Szzka1rX315tDSAtj7sx/+ljSs=;
        b=CzLAb8nC9/pJJZLt9pRVHDhYDCqfff+rAB66/hoKfd3MlyDLuTuX4CbWHNTOnQD000
         hfRswV278jk+SHRnfpZWBdGdiouhILr1/TSqza0Lye6vy546rS6j7TQbq+FADfg6Kjmj
         JTrx65mVVfVFd1SYky1AinOUxHgtXYoLKVirfkM0NM/5sUN+l+aIV07kpP5pd8irOqvM
         +AqTtc5sfD8HYTw0ZC1yTugf/VDlps39+M4pmMYDgP8hhhMiBqHDXlcGfiBacJuW6zVN
         IJX+wXDNt1EnMH2S68kEH7Xuq67Srp8H2gvIF6qeAJMRgTbxBOebj4sOgQ7Cfmwb46QQ
         +shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154264; x=1784759064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rx6OgR/abZgnW2Cg5Szzka1rX315tDSAtj7sx/+ljSs=;
        b=cBJS9geNFLTIquzuOgvwXHVIaEdwamL0zmJDAu9wKNuu3KEaXDi2VW0mTMELBSP5rL
         LpkFVQtcnj9Ijny6ktaFeZnr8OaVWsZAb0MquLUaYZtZxDqJyjXFMonsbRmNMvgZRBn9
         330R2KnwUMC8Ek8cyscbrLdZFDFLZLadHvCPO4r1oJTtBT/HvTfHTWt5TsuGWfpHUFJx
         1NHmyHmP66DpxNcBTeD7E1eZsrEeSSfK44rPIBd6ILXwW5T4HGkpnbL5eKCkn6EURyyx
         dHD/DcM3TRmarmPJ06VYGlLanVLPXYifsU0KL2M1K6FihVeHM2+xvl5zLX7dXDdsGRNq
         qb0A==
X-Gm-Message-State: AOJu0YwFM85BPfn4qticBlw7TzOeQC042CvBvKPdXoaN4PTssNWPUQwY
	8rRu4s8yMiBjA/FX6a120IaQxEP7CIH79TpDC9FIYURikxkn4LLHNUf5
X-Gm-Gg: AfdE7cmtD/RPyWg30h2yQ15eWMSNUmCoq+U8SP4G1Q7ij3khwhzkmCO9TZRvZJYlDnQ
	vHHzqfskT0A7wXahHgijKiQE/o2zWj3nIW0NbIg7mRISn7XoXTfzgoseqYqIQkhQ38BlQnuFiz1
	kGDtMEvMFD7hFLlumBmx3qN+ltIRHajNQzhmYO8I6XISFY8UKQQiOWar1iXh73OoenS2jLvnkzM
	x8k8YYxk1tW0Dl24Lfkta9joFJVo7xqnnY2tPtdcRiJoCNC8ezPuzhO/kxYPsic5RkOH5QZWPFa
	FErdC0BmquYbXi3Wa3xWOpVUEIKYs5ZBYMuG2kO3sySZB1QsNOzuMMwH7Bu/KrLIPxk/pYKdzqH
	qpn/KOWupZ6uLBF8ryYITHevUQyCRqhNAmjBBmo4ktBzNP42kud7h7Za/io8KDS12kWVaZHiWQQ
	w8NVVuztvEHApxrLoSe4V/VefzcQyAdiOiCvYH0DQ/i4PJPdc3APbziWVYIy4exxpzS9QS1OHKr
	nqqwT1f5MnW7Q4Z
X-Received: by 2002:a05:600c:8b6b:b0:493:f6f7:299e with SMTP id 5b1f17b1804b1-4953c273d48mr49140665e9.20.1784154263651;
        Wed, 15 Jul 2026 15:24:23 -0700 (PDT)
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
Subject: [PATCH 3/7] memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write path
Date: Wed, 15 Jul 2026 23:24:13 +0100
Message-ID: <20260715222417.2997712-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Program the XSPI_CDTBUF0 TRTYPE, DATASIZE and ADDSIZE fields with a
single regmap_update_bits() call in the RPCIF_DATA_OUT transfer path.

The existing code updates these fields through three separate
read-modify-write operations even though all values are known before the
transfer request is issued. Combine the updates into a single register
access to reduce overhead and simplify the configuration sequence.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 50294e5d2bf5..e406afc42616 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -660,17 +660,12 @@ static int xspi_manual_xfer_impl(struct rpcif_priv *xspi)
 			u32 bytes_left = xspi->xferlen - pos;
 			u32 nbytes, data[2], *p = data;
 
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_TRTYPE, XSPI_CDTBUF_TRTYPE);
-
 			nbytes = bytes_left >= max ? max : bytes_left;
 
 			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
-					   XSPI_CDTBUF_DATASIZE(0xf),
-					   XSPI_CDTBUF_DATASIZE(nbytes));
-
-			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_TRTYPE | XSPI_CDTBUF_DATASIZE(0xf) |
 					   XSPI_CDTBUF_ADDSIZE(0x7),
+					   XSPI_CDTBUF_TRTYPE | XSPI_CDTBUF_DATASIZE(nbytes) |
 					   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
 
 			memcpy(data, xspi->buffer + pos, nbytes);
-- 
2.54.0

