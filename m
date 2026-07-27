Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0C3C09FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148501; cv=none; b=mgfXyuYQw1Q7x1PTP45F2tAWs51/uWIlwehRa1rRps+27ibOk5tHKnjuOJKOSF1Jt3QRwgfoLAraUJl+fPXz9CHsANXqTwN74aIyry4GJk+ZdOU17FcqiR0zx2tO/8LtBz7vv1DPU5+/MQoKzizubbvwbcZcn4aFGtJxcncbf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148501; c=relaxed/simple;
	bh=xf98bmANgzyLY7d0vN8PC/XFmQgSnyrCVMnzTAoeOLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hm079BThM0fqvchySKJEsxesFK4peZUfBr+/E33luHDhvQoFVoFNAziVfeRgM88T1kwBiX7hhUqgTN0LpwZT5X3oCJdZ/9OpmLzw3oIxKWYN8Z71hYES637UEDIwdEonAlnRFoKJtFrn1bkoM3/Yogb7CcECSVor7ZpgYw4HoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMLYbGU6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMLYbGU6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so1965000f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785148496; x=1785753296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x19+TAQDChfRjtz7x9GYQXd2WO2WRgrIM4Fdlb0t5zQ=;
        b=aMLYbGU6OYm4tvfNifsRymZReu1RkX0P3m3W7U8Xzys8UPP4ddTYvhh0s+X/7RrYJT
         dN/TDwqMn2E/H2cfhp9rbrcicQLdl7QQ4dQExh7UkD8JwCYr9xSPRqbpVlww1V15STSt
         Z1Wtez0kDc0W/x+9Q+uYM1lZI9dTBsSh7pC3VbJX/Q+viCEaCfrfHHjNGHJoB5Mk4W4m
         bGSbiaXsxoPuX6aIxw9e4S4qr5849/12HRtflpQbmRhSm15gGfFe7pC8Ab+l5rQBkLOR
         aQAttko8P2t3Mt9juVLy9otW4ljmiizJA7FiE3iJ00Lf20voKSIjyMS8M7DAVU8HHtNd
         CKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148496; x=1785753296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x19+TAQDChfRjtz7x9GYQXd2WO2WRgrIM4Fdlb0t5zQ=;
        b=KP5Y/5Eg5ClGKqb7NmYWaJFD1+JU45ahly980zM1kzb49xd2f7AlS9F+p5UPceICyi
         LiRHlJ5je20n+aBxJalbZBo+9h5DbXzy4pM7xSYjGNG/Pac4/lJViF7090D5I2KKxeJv
         LxfwM8v+0zLoz8Omv1coFTDmawK7JFUmxOVtyFrQ/Z6nhbI0cxm73jhTa4lS6BqBNH0K
         HUcOGaIdMOS6bM5e3a6Wh9hTrLd67qWKJ6pHVO2UMwVy5LuvoNFErYltQccDL8Doobpw
         L29yNTbpI4AHkMDb/FNPbhZGn+EFQFTCTWIsUr3646StgDn5jmZ2fcs7b3MDNs84IesO
         /qwA==
X-Forwarded-Encrypted: i=1; AHgh+RphOHWkENWxCvhESOa9fuO4Mnr6FXviBK6OSC521gNhvYwZzFFYJN8Dc1BMiu6o8FQYbZ3rER0qNBVRsLaw4Ol4mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsPvk4j8whjAiyuW8nmjwOTXR2WxMjOKnRG7WOLkfKbuxw1uy
	ygsj/h9wvTZ1U7wFQnIFC2Gg5xQtk2LeeAlj03wlCRmHZnepxLGFlXXr
X-Gm-Gg: AR+sD11tafrgsJHTGJqOHp+sKPZ0msD4LSvyWK2isnYaXxlKgb66urDqnSuUeP4QaSV
	HBQuDZRMcT/ItyjCtfWj6NeuPlvT3goJZG3MP+Av6IvXqraLMI9SCdGJ5/ICtbfHwXMpxtvIRLg
	ZoH2+LOTwInOQ++0qgCcodu0regXFOQk9rblbklo2dn6zNnxkiL3Vs5bop81Nhl5R8y8XZnO7Di
	6PKjLhiRAQ/695CUKhYCUxwA0ENaJSg4p+NzlH6ZXLSPYI9gp2i+U0wD2F/+ADgapKmDI1vJ4HH
	cPOwQA6yltN8PtY4E6jCjS1F10YErUn+UNnD4wXi++zMUW0ozr2WWGYsx0j9djV8lkZOmnLJaR0
	1CbhRBCatlTGsVnN8xo59JycZylL9QYH03QaSjMNYj3SATGg1opuC0TJm6WIHuesoAE7Yoz1xyX
	1Hh6uv4+sG3SA2zd5336J0mVeOKPeQdOfmqad437kRHRcXw98+i0NSmO9osNbj4hHSY0HaGg2Ss
	u18smjqenG8+Seu
X-Received: by 2002:a05:6000:4b1d:b0:47f:6d9a:d7a6 with SMTP id ffacd0b85a97d-47f9fe88925mr9845425f8f.25.1785148495690;
        Mon, 27 Jul 2026 03:34:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm45245173f8f.14.2026.07.27.03.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:34:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/6] memory: renesas-rpc-if: Move static bridge configurations out of dirmap hot paths
Date: Mon, 27 Jul 2026 11:34:45 +0100
Message-ID: <20260727103449.3188105-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move the initialization of the xSPI Bridge Control Register 0
(XSPI_BMCTL0) and Bridge Configuration Register (XSPI_BMCFG) from the
dirmap read and write implementations into the hardware initialization
function.

The bridge configuration values remain unchanged across sequential dirmap
transfers. Keeping these regmap_update_bits() calls inside the hot paths
(xspi_dirmap_read_impl and xspi_dirmap_write) introduces significant
software overhead and redundant register locking cycles.

Statically setting CS0ACC to 0x3 during xspi_hw_init_impl() permanently
enables the memory area for both read and write operations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 104c28532c20..50294e5d2bf5 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -312,6 +312,14 @@ static int xspi_hw_init_impl(struct rpcif_priv *xspi, bool hyperflash)
 	regmap_update_bits(xspi->regmap, XSPI_INTE, XSPI_INTE_CMDCMPE,
 			   XSPI_INTE_CMDCMPE);
 
+	regmap_update_bits(xspi->regmap, XSPI_BMCTL0,
+			   XSPI_BMCTL0_CS0ACC(0xff), XSPI_BMCTL0_CS0ACC(0x03));
+
+	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
+			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
+			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
+			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
+			   XSPI_BMCFG_PREEN);
 	return 0;
 }
 
@@ -869,15 +877,6 @@ static size_t xspi_dirmap_read_impl(struct rpcif_priv *xspi, u64 offs,
 			   XSPI_CMCFG1_RDCMD_UPPER_BYTE(xspi->command) |
 			   XSPI_CMCFG1_RDLATE(xspi->dummy));
 
-	regmap_update_bits(xspi->regmap, XSPI_BMCTL0, XSPI_BMCTL0_CS0ACC(0xff),
-			   XSPI_BMCTL0_CS0ACC(0x01));
-
-	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
-			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
-			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
-			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
-			   XSPI_BMCFG_PREEN);
-
 	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
 			   XSPI_LIOCFG_PRTMD(xspi->proto));
 
@@ -945,15 +944,6 @@ ssize_t xspi_dirmap_write(struct device *dev, u64 offs, size_t len, const void *
 			   XSPI_CMCFG2_WRCMD_UPPER(xspi->command) |
 			   XSPI_CMCFG2_WRLATE(xspi->dummy));
 
-	regmap_update_bits(xspi->regmap, XSPI_BMCTL0,
-			   XSPI_BMCTL0_CS0ACC(0xff), XSPI_BMCTL0_CS0ACC(0x03));
-
-	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
-			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
-			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
-			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
-			   XSPI_BMCFG_PREEN);
-
 	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
 			   XSPI_LIOCFG_PRTMD(xspi->proto));
 
-- 
2.54.0

