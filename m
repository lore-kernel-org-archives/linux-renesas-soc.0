Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1724E3D4114
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784154266; cv=none; b=ofr6EdJIpd1wlXloImigACmTQciBwHFBRgxqJS7Z9sis5MlwAr45d9BFSO2Z/4aj9a1EmJtn2OcwcVbO0bvgMpFUF28uDYXdLEveBkLdp8AWyE1sQfk5FZ+5Uk4EiZH9nDvUgGxDG4R8yx839CXJ225YketreXkW82L0y5V21qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784154266; c=relaxed/simple;
	bh=xf98bmANgzyLY7d0vN8PC/XFmQgSnyrCVMnzTAoeOLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plLDCUSkOvH2OW5h9wPDtw7kKgGSGx3b34ixaIVQYB5cpKswjBCGqRNVoH0jx4wjEzGcl4BoXXug2Xk20oS62RzdxllGrKRP+YtLBxpIFOI5c/IV1SWBvRSZUFVkqoqfmgNjc2nRa1OaK9H2VRhKdvIBTtyXnbokeRooNcAbb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJt6Gx3d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJt6Gx3d"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so1385122f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784154263; x=1784759063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x19+TAQDChfRjtz7x9GYQXd2WO2WRgrIM4Fdlb0t5zQ=;
        b=XJt6Gx3dxKdpiGFr9YB3gZFf17X/CDRrZU9of3eq/4EwHXaLjXQBpVMpzXw6uSztmf
         Wn3uxx5O+YxUlFr8+xZJR5ip+p89WtalvryJ1YTGIE4rBJAsWi4HzvJl8js8Ca2rTqud
         pvzFTSg4k1qLHPqVFYjGqPagTQfq4Tks80uSw6XGSSSw2ERQulxHSCfcrAI/8hPhjdOs
         1DmNxsOAIB3WoQWI2fHsb7iaCTDrkHYZrnN/p9XX20hEStgt2C1lo233nG+A8ogNJmha
         NqKuuj6mwiJWqQoL/h3pjjh7vbD8pfw1rNlzChP96l8PpwV0lN77al7vRhyE/SUjEq9r
         SnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784154263; x=1784759063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x19+TAQDChfRjtz7x9GYQXd2WO2WRgrIM4Fdlb0t5zQ=;
        b=HJsxzgp/pxgbJNOlLRnf6dN1cToqd3Z31iN+Xbmb/+Md4H06FJbIGr5DYqj2aB4y38
         xWPJ2x2G8+4iEOMa8BSo0gjC7HMvlKc3HpXn0+Mxb948fJSkHBHtlTEtCV+BxsskWceU
         CEXWEWX6nET9i9JsnKOqh9owsf3jMAOFs+mMhhRfAFTh3nGy3Y0I+aVwcpyZ241r6pY7
         qCmnkEbidDExENPIzuuIc+fBzOUm0pN3f/MEGzCgbORyt6bdy7q2N3a8xAzDhU+jearJ
         s8M6d/ICW8Pe4E1BvgVGzXknRS4HFak9XSMsArs5C1mLhJceYOLWN3P6WERuKD6unjbV
         7mOg==
X-Gm-Message-State: AOJu0YxrPWBHrpdNO0phf6wp/vr7yIYQQXzQ7QVawR4DziOq/2/0s9C3
	GUTRrOj1LFzSBycP1FAb7HEE0XBq3NN/E44P6H18Pl8qxFBypxpxUCXY
X-Gm-Gg: AfdE7cnhh+9lPBETI86J1Sg0HR8I3vCAvDMrLe9JoGcVwNHJQxaTgmA/FpYBv9dQ2DS
	gJiUPCWrGXNkldUILIpLBbKIaZm6ZwDhYly31SmnggOXL9kX3cbdcdr7mcQ98LJrwJJb7eU2Oab
	VsjZF1BhWGoi0PPjb7efY9n4p9bY3VxZ/z9ZlA+Ke/FjDe4BcyUAxctPH63EGmyOg7omVxu3UKv
	YY6D8lhkG/ExPTgJUx6TI2oWQ3ATbm0Z+mQKEZFVmZv34zkh8TYZVi+cTCDo5aFo/lT0tbhIpBz
	980zfvzwI0lS0ptJzIVnu+jKXwBtWt5mZ2kMKJRmOgkvpqavY8uDkNVp9ih9RJyE5zvLGIOZ3Ws
	xLLrGav9PcjaLW9HHdJGbqGexGBSG7gocX8i1Mx84jnT+D3+wbadtPd9buRrTmZJyGIv0ouVuOT
	56abPzi4WeWer67H7qQ4Td7ok1EQhMMjhg3QKkDyfQJpt06FQeLap4N+benbt8kfRr440f62QuW
	OIgdGQsERoHr/Yx
X-Received: by 2002:a05:6000:2407:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47f5a53f2afmr5353f8f.29.1784154263155;
        Wed, 15 Jul 2026 15:24:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6d4f:b160:7aea:9d1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e036sm22337783f8f.5.2026.07.15.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:24:22 -0700 (PDT)
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
Subject: [PATCH 2/7] memory: renesas-rpc-if: Move static bridge configurations out of dirmap hot paths
Date: Wed, 15 Jul 2026 23:24:12 +0100
Message-ID: <20260715222417.2997712-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

