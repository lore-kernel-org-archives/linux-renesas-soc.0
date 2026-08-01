Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93838357CE9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594273; cv=none; b=Fnb2SspaukGwtvTeCgPmo79V+K5RykjYfoADwvXVduejyBBQsH0ASvXtNmvTNcRzGmt8hAbofRYZ6JBFBRORFUZM11+lHXeb1wn86DbLou/7FU8qh913ie00RuHsgxsdOTRP0WPLuKrHEijXWnScXcma0DRFU5k4MpJOlwYCWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594273; c=relaxed/simple;
	bh=ekhQayFdhTwRrW5sTrt8sRRbZApqgEdJGIrgdXRA6io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZeWYjXuk3d/HQmzIXZLUysh1J3fniLX40Nfy6LUGS0KFK+NVFWW6GxMyQR+2g3tB0+xtvKe+/ZBBCvTAIdczb7sYY11SieLuF5TRpmfPe+nKmuICMv5eNpHC3BJiS0yb28thzlAxdrSf+Cz5il8i6DqHM0ys0Ea9kHB5FINVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlbUe3dw; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlbUe3dw"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so6118975ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594262; x=1786199062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=UlbUe3dwqkpzWG1CxMDtYmOmrqjbxvyR3c20U9beftkwsHsEgVCkRf6ZwcBOZPUjLO
         4v58Bk0ax4qQ2/EDKMc9HZWnM8CBo93mZbZ8kU8JVhb1Eg88l1aakU82+N/EDJVe3bZw
         KZa/RiMYJSELmfgNC9lczJCth7+DcGeW+g9enYDKcKS+wZlw3+iKmTO9jd4xH/NzcQc3
         UCw9kkMvLweDeKBjvGtP7PZWk4r4rTVjmDRWZKt2zqMG4exk6X6e6peoRavWiSz4L5Hq
         g5gMqCKJ+i0Dzo0oSDFUaWb67sJTXDAUWL9e9NSV4pkPHsMnIwUcP0Ikf9zbgQARu0T2
         ze2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594262; x=1786199062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q83Sos7xhYVmpTWu/ghFNGUmMBURB6KpF38DP5+YZjg=;
        b=tGk3GlE0VYXY3JhizgETO3l4Hu4W4DpJTXW/iJuRiLM16nhzDB0Ar/w9584Ccr5nME
         3ASmrZad+VbQ1bUVcczFEw2m4LbjaWsLfODS4Wc29T77zQJqSVi3dRjaGA1OvGkzNnk6
         iL7vqkHeGBBgIJNoIklKmUxEA0rQMW12YsgHkx7iMWr2NtGgRkXeCZ53M5E6Cav/Joba
         UTQ2EIWzT7bmFUj8lRGpAY4ZYK5ywMQmLi1me79ViACZ1wsVf8L0c7+yD6/8z13cLLQY
         RUnyZdbQCafht58rXii2k+M7YBWuoy7cWTOtzYcI13Es0yhWwutL41ZHxVnpi38voF8u
         ToUg==
X-Forwarded-Encrypted: i=1; AHgh+RrI1R3ibbI/EpfBzghD9Lwuc0elkGbRyIQR7ZX5RcfvbF33fpNA2C+maGN45GfJ4P7SV5ojyUljVUeYtlsQPRz8EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAirO7smxwq4ohdUrCE4A6O36IfvWh0MHVbUT7hwVRVI+aVfg
	emJ7gmyHggBV5aSml3thaxgsI6gFSO/Pr3u/p9j6Gy3FHt6jhSw5gU7V
X-Gm-Gg: AR+sD12oShUbFuQKWNpaALQWG/AGJDH/Fa4X0d4lniPBwI95xgkqz0Rq4k6Z/zi6GLJ
	lnQzsxmBJEkzjo2gOQGHClDxPEJFuARgTpG4o7HZfL8RhHVxuD3dozWdjt1DRqUstkmhbhueeIL
	o3nsai2rweIe/hLKth9FOVB26/2/YFsDRPZApE8nV9ZK5oHHZ1CaRcqjY8HEiQni+/BlQ0LNZVo
	KZMz3DKUm43nn/Wpw9j5IhDEiyh9HLiC8y0dGcZs1UaBsd8qImZHWrL4kWnZIcYCc3PH95kPjQz
	xD9h7dZRn/rfVQOIqxqU/Ch82a5vGHwDRmr+7jxhQxXNl8eEbY+33j2vH2ycMehn5JyeqYtruDm
	wr0B6jPWeolPBERK+pkr2eAuSMFLT6p2WsHLtwvrTGmkESOuvH5tgFUKG7J1bV4eBBjExx/pxOz
	6TGQq5SYZrHvg5uTtAOcoZZbyHWATRGBma2vCt39TZa2oi8/IX70FgvII=
X-Received: by 2002:a17:903:234b:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d0521b8488mr34096625ad.17.1785594261862;
        Sat, 01 Aug 2026 07:24:21 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:20 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat,  1 Aug 2026 22:22:34 +0800
Message-ID: <20260801142244.679437-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307d..cd5ffae6afd34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23468,6 +23468,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

