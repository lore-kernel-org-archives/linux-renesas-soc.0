Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0C42E8DE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435016; cv=none; b=lFhF3PVluZyqkTPPmhbEX/tvcFV8QvvMFagQ+TuAn48k78e+8cVT86kYSl/NNIUFjSp+2ouKFGgMF4HLG3BsaRbx3ROpKPV2SVraK+tS0AWKTTwr5ekdxRjDN2rTQ5drYgyjvAXGyvIpCFrHZRAii5Y9eVqXoJiUYl6e/r+Dy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435016; c=relaxed/simple;
	bh=WssWu3DqR0qe3dABdY915lCl+Y65vr5ThvbLeMQG+ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX4BQROcZv6FTn9o3r2KJe3RD9UGaOEBXiHRnWZ6XZDK8lSYprAhRgH2P6WpLABq/nELysw/vYr/kn7cMmpyo1W8yQZeean+JUUh9mnvGnJ77ASSIL/z5QHlbolMQFpcZo1aXDlNIIUMaXmPdAneQ/rUk4mdaoSmLo73LKsILvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZZOqcWO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZZOqcWO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c19bad03so40444665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435012; x=1784039812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mgMTUEIANdNYJtQsbvr9a/G+hXaOlFaKgHYZyQQLM4=;
        b=CZZOqcWOwcbEoFCw+QozXwE73uID3s3CJEK2jsaLGNFzuCr8CsC18maA6c9UA7iKFG
         X/ChaMpJbIZlBBFP4HV2kBsb1nu10KQSDJSmrgyBd7T7giIjLI9kE0Auo+Uvm9ONvnxj
         0rdWuIaMh3hKMag4Vui+dVpCA5WYiEvzUa9RN+JeTikkOI2s9DFF/ROPc+NgsQz1mz1i
         pgziBHtZ77BwU6ENnvmMZGYzkiudSkR+EGd5KPdxQcGNspQ9C1scqHneFWalUFmHdfhs
         JfZE///TOhEXaNzFtMVd+KgdBDh05+AUkInaVC6e++xwnFYovRKTGmR+WZI/lkxLortx
         Gzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435012; x=1784039812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mgMTUEIANdNYJtQsbvr9a/G+hXaOlFaKgHYZyQQLM4=;
        b=YVCUq+B5yyqAEfsXXAS9ADzQP9mj9UI1XquLtFvnBkNvh2swLOjGoknxN6/GEPWvM+
         SCZnYbdts3jYWEEdhkBnQ37pWbOPYRo7gvCbny07kmjrKNnRQWRV0QM2jJ6aW/JlokjA
         oRdXhbQe8WWKXku3pEI2Pszr/nJIq3/4xHvTJBpHr1hcJv9fKYCtxQ1E8ekQjHdmIeJU
         ro/cknNU0GaQ0sdg/woCXyfBkThDORJje52gOIP8TifCACNbUAGE1F4tCs8PY7a4+KnP
         eXfgbN/EQppQ9YufBNmoU4Z2RTkVuonyALiEvWhIerJqbi2GsDNTTgmrtdy2bZIe7Enj
         jYvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0DWBFTNCMixDtEdjeHMXmMnGQedQS7uMkttYDWmY1rxJCzKbleinIVkO4A5T3pcc6Vk2umF7v3a63omTgbKUsUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDOBMXNDcHrzRWfV9A1hEw1Vhh7YJ8+TqyfTxBU0/WiojumJv
	vzemgtBcyXlOiRubC4Mysi75vZdyH+dN7KPUbRwc0L/H8c7b0DBl0B/5
X-Gm-Gg: AfdE7cnldFTMCRZ72jnoKrUSbivIJhhuKaHh3pxskRfuLt6DwYKGXzpGXpVZwOiFPhJ
	PI7OK0jXSb/sWXkv31vye+a8ki2dre/ALVrPtgkiiyJeUhryRmxhI2hOHh8P//v5T+EDA3HrKZw
	YieWeXHtMXnimTvfUeZ3Mu4JGWfuuQx6+QYmotHnI/lwgIatzX7V0juFhLQjlIqe+pmG5Puv6/6
	vDGAwyxBD4nSNhFDSS7TdUIpgUiygjqiUby/e3X+xOG5FLn3D7kogtNo8UKIULbuU4Fyvz1DIOw
	lOm2PhRLRhFAgdMZ28nOCp9023GKPAt3KU+yxHgxaMbnCpqyFuyEt9kfdan46bR7gI8SJ+P7LaM
	nvVMr3Fe6tdgc4vSIJPX755oFTmkj9+VhLNxUcnnkR+/RVBhLU8Uncex40M5H9rc6jTsQ4Vclxj
	lAgCvqSaIUrsGt3IcQr6E8rlsPDN+jrBefoUKMRQ==
X-Received: by 2002:a05:600c:4512:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-493e4283464mr17627765e9.2.1783435012237;
        Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Tue,  7 Jul 2026 15:36:36 +0100
Message-ID: <20260707143646.245177-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwr_rdy set, similar to RZ/G3S. The RZ/G3L SoC has 2 OTG
controllers compared to one on RZ/G3S, so it uses a separate
rzg3l-usb-vbus-regulator driver to handle the additional VBUSEN control
for port 2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1c4c8aae0e80..734255258b69 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -120,9 +120,15 @@ static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
 	.pwrrdy = true,
 };
 
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_driver_name = "rzg3l-usb-vbus-regulator",
+	.pwrrdy = true,
+};
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0

