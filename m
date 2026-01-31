Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334933ADA8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875978; cv=none; b=qmQwpcgmXLFXX9TAG4avLuvJ5kbC+xuBoyTJvBjsNzvw2FZSlXUGg3Zaf8XKc2ncTgdZj6RPDUTASYu/XOKtmTVqZ7dvcg8ZKy+spmRQZpw9stpL6bEPvVEAyfm5KmDnwRw6ip4gwLjW6r2M4WrrnFeSCOj5zr+XHOFzetSQgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875978; c=relaxed/simple;
	bh=wWlQDWVTHIyD2w74yQV82Lw2rsusocwhOpWbuGfQW5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjZu3CMisANTUDVRAQzee3AuP3ueYR12OYNJJEoYn9OiJd6udpQtLYxgaMeKHFhAgOxnPKTNrADOIl1BbQEnJvKi9qdUc7KCM9Om3eR8i+KiONvt26Uz766LJiyQ0n9TXcH4ZQJcWfd9MxTuGbzBQQJ7BV6uyhL0CSmP7otRQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAwNn3lJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAwNn3lJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so6386904a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 08:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769875975; x=1770480775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
        b=WAwNn3lJcZJW+kwyL10xcJ+Qr95ZudUH7bl/cLZswB1zpV/CnLQuIIL5xm2hjjrZSe
         fOwA+CsrLwvzjo+J74c4HKEd4HtxfHSZHlMnb//9tqnhkZbes5AoN6G2DOJtLlnFeDKv
         Gp7IcVBTJ12dTc94mV1esBZmMXqyoznZzz5Cf0TojbWopcdCWalsKRrwg3hsDS71jGZ3
         y4HJH75Km2zkJ5ScOaS2V54xg/YT8f65PGTiabSHoAmqW5oPc/+4QjYWt/xASxFU6kR/
         W+QL4il11Nt+WxvBxLbuCUuSgmLzXHa87/gkW31NdqZRrVvmYkwRjCoBT8dJeJAh1pm1
         kSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875975; x=1770480775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
        b=VV8n9ZVUUq9ykpjEYGQR8zHPnvNDjmPAHQbAzItDWtqToIu4xVTsDh5F1ntHiBc9Fk
         RiLI9lgzxXf57v7FIPpE/cTmmIny6f7KXHD1W066cKvOxDYIIA4AhdCibf9sQfTtJgdZ
         kI9/igAor6R7qck1/WjlEHmDQAtPznneXc5ft6K6+2a4Kc4zOORXmzCrQC950hPmW/CY
         YsNQhG1R08HBabkx6Qg73eB5QYSeTKnTO0K95TxZtZKML9cQhNggpS4c5y9uonNOR/1o
         SSLaVWn9pcD2fM6XTX9EMZNzLZ9+e+256CBGdUAJ5dtKwbmaxYYCuxeBXub4q+C1FUTQ
         ZFIA==
X-Forwarded-Encrypted: i=1; AJvYcCXYEKG+rgh76PRH6pARujAi54qH73NZS0m38VdsBAfSNGI6dKCDbBVLF0H0jCEVqkfhUFJ7lLuXGueTL2uw2mkC4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyddGXaZs9F6UjhkoYZiYs4bWPL3uaY7GZpwB2Sq2lrv/Edcqm0
	2Sl3zZKBZAUiBTUEK+fq4WMtsEh97zj+ZEsmhlMud7FL4fGPoCzTZ7ka
X-Gm-Gg: AZuq6aIVJynVnFql9x7urAeN5zT95E+VmHXMbVOHZ156H+PJ5Gtr9I14ozy8r5mriSu
	xsizaM9K3C+3bmVQNzRIoircyPkH6ffIW60UR5TXgARHC7N3k18cB+f46VG57Hke5Unm28ZnTxJ
	jYQ0d9Vbe8Z0NeQFArUdcWrV22Nt6JojSm/YJ54nY9kY833jMmcFnjCZJDJe68GAIFHG13AreNg
	rcHweN2PTuPmD00LCmxhNL8LQjZ6CvmwSa2bjCBliqD7ztVQFgZCQVt4Ik3mJB/K/e3w2SUprtx
	tV09USQE79jiZ+WWWjgJ3RnM+40Yw+T7iEFxiCVU9xicAtQ8kassdsmb1GYeT0l3qELovHUn7hk
	wYN9PsL/bRBJO4sYbtj54XO94PLslxWNMDnyl119kF6lKQIpBDfg5E4MbuffffP+VvmNQg/EMqm
	4zKpBGskxN9r5wGHQUDH0i60VZU5/1Ergfq5s=
X-Received: by 2002:a17:907:9701:b0:b88:5b72:ec39 with SMTP id a640c23a62f3a-b8ddf805340mr625902766b.5.1769875975203;
        Sat, 31 Jan 2026 08:12:55 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:12:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v3 2/2] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Sat, 31 Jan 2026 16:12:43 +0000
Message-ID: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0

