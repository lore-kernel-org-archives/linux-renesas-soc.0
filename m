Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74E3B6352
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476002; cv=none; b=bwZ014SeGoHSJaa0pir1p4VqD65xo8OHthDG1h3VGHJMSZ3/lqee/P/HSepwEN2K/4lRj82OuZCIeI5A9QX214BbVwd09fJIPh46L7c17hbR4hn44qc77K56zHV9gJF97A5nqVOGItdQS9YOwGlIwd41dCNXWiO7+LwLtF5OpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476002; c=relaxed/simple;
	bh=tCrgHNTqayWFj1XRarWJorXnl2XIBvQrDCQv89fV94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1CKH+sC64PeCEDSEDS28xNj/j9oL8N6/XgwlFk0O8NAtVM7xBf4hEY6k5dgke3sGRSK6LMr8Ctnw/uVy9uiUB+kBM10CpLkB/z9C1XnffrA5uVQwyXTc7056Zp6ZziIRA4QxmtzxMq/SpWXSeobKn8iiAvsfBYMNERBvBnvgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtCYZ6Kb; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtCYZ6Kb"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3989fdf58bcso265602a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476000; x=1790080800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=AtCYZ6KbYOaS9auUBsv8QrA525jxfl7noKBHqjywxD6PrRM3L3BZVbABKVBYp5ysZB
         hcINfyL3TmcfDgLgSxDUYaDGiUNVappIAvlUN5UovcLxMpLJMcnWJ91XM1yQlXwsI6L6
         BMe7Ju+StEikNSmPbDQTpnSsr+xfHv56oday/jdbZ4n3zW3Uv1QcBtnncaMmoIC3Z+VY
         Be90ZFC3QgypwSxgwYbHWhUN8ocO7OjvZ2eW5Pa6AI2Vf6EpT4tHfpx97/rSJrew1tEG
         d6pzWISrtHgb4/MQEv/QqQs2fczOCabJgX8KusZ7rDM6RtgjIPl4Ecuvnt8BwplWsQPT
         iMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476000; x=1790080800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=XkJf4WC5OCm+SxCveVjgi7KFTp0ewZ/tRcK1dD/Esm2Tzm9SP6Bxl6q6+UUCPJRmOp
         SH+JrACnQLmnRJ90qiCNX+uOtxkD2PQgdijYSR9D/fcKvUaq6cM6ML98EkUSP6Xp5T6P
         c77QwCdCdpgnkr3aKRxQF66PVF6n1Wpslbyt7AyNlWB/xx9cvT0ecP+HNAoasWGr08Oo
         geT+NwHTRMPURaGlB/zTfMQG4BgtvU9OkUedi88yd/QrXZaK1Daw/JZ4Heu/f9S0Llp7
         rB+Th4XL5y8JxabefROh/Zy32mkuUtTwGy1gpYCPVKW/iCkXtWOnYPFLcRjRQl3q6t4b
         klpg==
X-Forwarded-Encrypted: i=1; AKwUvBw3gy6VNOBY1TjSWAcV+ogRTHxlC5g7Fl/z4nqPs/bUx1ra+cALzytDZVK2qL3mcSxR9QMCBNqWlcsV1JKI/Zc6OQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFPhwPUdBaAfDI6f5lg/4SNYyP2uRtlr91f5fXdD+LoR5K+rFa
	eiHN2bYy4JssI0fLrk0+hdi5D7MAY36dOa/H/kuIh/bBxyO0qRjqEmbZ
X-Gm-Gg: AYBFou2ND4gxkKo7CBzgzSc0ol3tdccVdUdDTHrJiZo+AgPj5uCekGYgk6e/VDoM/pW
	R45o4lBmQXRLSdUk+C2W1QpUviv9zxanS6kcKYGJ618Nv/kL85v58Vo73DzKnHrBPsFZOcHwNPY
	Y2qcTerifU7gnNRigAa5b01BIvua0E3madyl2cMNSHI2lfrQp7vLlGkRkPgAdRk7AZIuublDoSB
	cZza0CD9c5uDwsa58RJeBN5LMjZL4pQDpDadysXlfkzLnF74rUU7VaaRuRPbQwTqjMBiVMxB+Nz
	nL69VqwmSVDJ0xpnheVJ8vnKykYcFOKxVj7SYMGI7HxK1FQOj0gfOv31KzAly1IP2l+5dzQfy+f
	A++LVERRYtnAxFF7Qa0Z4R++fzruNqOJo5DulY4H8Vyy/nZnWh7rAJo1IG/7cFn8eRbmvK/t/2v
	Xye0XrjBaM6Zfhxc3YjZ/XvJ/3l1MIS5sVyS36V1onHhBh2bXRTQ3SL4pOeoQ2z2+iNcnKwao=
X-Received: by 2002:a17:90b:314c:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39dfe1901e4mr3823167a91.16.1789476000343;
        Tue, 15 Sep 2026 05:40:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:58 -0700 (PDT)
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
Subject: [PATCH net-next v6 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue, 15 Sep 2026 20:38:00 +0800
Message-ID: <20260915123802.1561724-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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
index 3b2eb2a7a89a8..f53a519da6298 100644
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

