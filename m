Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A03FCB11
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326084; cv=none; b=a3ORq/YyhhxBGBQR/0sVKRtjVw2fJIvB2ttz9E+VWb7poWwJsDcWfoN+Bk2VR74YQHjlOI6o5WtlX4rVTXMbiK8yZb8q3pMGfAlGt1qNdk7lTTvz9o8SJnNqDJxOiOb8Xa5bQCI6lN/pLoQGtypiXo2u8V3ogBGgvnOGPLbiKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326084; c=relaxed/simple;
	bh=nHafMZ2XTe7EQPlPZqClpxTD8fS1jL3tscvPWXqEAxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNxpANa5LAUmUw+z1YowcPujPVvnPFJZWrzeeGEDXI2poOzepiQ8o11miXJygiXwlN0Jp0a4SL8s20sCIeXxskjTAhOa0Zmb1W4m7b02uT0PFwwVWCmAhexcLwYAqkyhDOklxxk+vEk7R31g0dVSfXhRmITXE9uC09rl3ni3yOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPyZu+/k; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPyZu+/k"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso18548565ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326080; x=1789930880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=rPyZu+/kk2XMIIwSsUHuuioNHncKg4sF3/zzv33gi8dnPxp8fWVYCSi2gBVXJVBgko
         /ypDWFofgTUWY/9kn2bd8zZgB71+XtJNCEaeGRV9f56V44iJ05a0Eu6Xfliac6x+oYYP
         EIY1w8vphq4EhGpJKFL7r2ibARmdGCJsx5sFe/6o35RGr737S7ryvLZ+or+6tDJ5Asxs
         5jWzfTW103Q0wsqAfVi7TkaQwn83RgW787/de450zR2IANPJgNElSuxa3/8HCSySYHXG
         dLEGmYX2MJfzXfrD2icalr7g2Kfi1bclX0AY16FGNJKwyddvYO6v/2XjkR5ceXrS+kNR
         Yn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326080; x=1789930880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=Hvhko0HgG2AoOxqwKPXcuQLUGjt0ez4ZfTnvmj2ghddmblMYGM1P5bSlkU/GI/ZKF/
         CD58OIyWaskzxpAF+ZlR3l4XtTL82KLroiykatB5G/k0rYIKWmhCyTMRW9iyPYKRqbMw
         BTw4aS2Vff7mQzxzP7Eb4bVTP5qeMX2K+B2MjQ/JzngS9jB5Ct9YcvRGZlWoGn/YpZIj
         3sf1SURHqPhQaIJBSdSqhQCVHJbRKpDPV8uCHwrQGIwQhiJY6jA2O544PcNKjbiAn5UK
         +Dq7G0MwjEivhwCqG2ngo/DNMlcjYc/yGvQZATUQb8/cZBIwv6j5oZ1/e29EQD/5X1RF
         aeOQ==
X-Forwarded-Encrypted: i=1; AKwUvByUfrOTeJ6YRb0z787tCEEaoeuQ265sJniT7mrdMymd7xCjVV+OG8POuuMZW8XePteeW/hljwqR+kAJgsASMDDPpg==@vger.kernel.org
X-Gm-Message-State: AFuF++k/fHdSOWWhN7ABuXwPLclAYAlcjAH1RWlZCTWo6Xg4MY8evm7c
	29D1xMV2QblpGTDbi8B9kfmdANpYCfw6NlfCN+4q210TOQ6Vg9ghoh45
X-Gm-Gg: AYBFou3S0FnQZJES2jfPoKiO0jQwtNKZ6N4nQwZmmF9ThH8jEZlSVxLJVge/nKAsBU1
	W67Dc7uMNZR7DkE1tyyx5SELuxORoEm7cvxI/7Gvjg41+zZZjZu5uZKCsRCbjSAlF/r09Ji05mC
	PbIqPVf+YiQRlFIeM81vueGNTE7egQ+WAqpnARTHdgQ7vv0cMlCuMmhqmrom5ad9E/gzrdgslhJ
	dF5jPKcMcYg6w3KboSpk/Li1hrtGKGCK9a11iYRQ3qMYU6zeESnp+ebrBYw9LLx+L89wwSqAG4O
	94gqh5mwUXE2D6UNnL3N1T3I1Qk2PtaEfGtDQC/TUtdjN+mGI873NRu+5+IfxE7ZDPnJi6kfz7H
	dpa81fvrGO99krQKyk2WxFccCxTqo6lD/2QwaUKeoqa3VsptFNy2q4ubNPpWGI2jJItwdv0Eq8v
	XtvL7egxR2lb2qDOEHqf/2cvElNNVCuEOPPSiLBbSk1qCz33GoX76YAid62iTIVL9J4g3yfw==
X-Received: by 2002:a17:903:1a2e:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd2a35aa1cmr275548375ad.16.1789326080540;
        Sun, 13 Sep 2026 12:01:20 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:01:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon, 14 Sep 2026 02:58:46 +0800
Message-ID: <20260913185849.907479-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
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
index c2414447892c2..960a53afa8357 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

