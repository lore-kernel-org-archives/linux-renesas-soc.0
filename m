Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494413A9852
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678123; cv=none; b=nkVy4WpYZZj86JbYUYCknqQFU1jz8eLhddaj1BNvWalWp3F++eG+UxqGThDlBouGzMg7K2dPc+1YYQlo+e0MWxmBa0OVKlYx4sfwJPmV/wELoasD3gK2ip4siyLBN4dySYXibNkXuMLm9gXeuNRnZVEI0UQKlc5lmwSUKAxNTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678123; c=relaxed/simple;
	bh=tCrgHNTqayWFj1XRarWJorXnl2XIBvQrDCQv89fV94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKHIRwogof1szS2JtDQjTAzBPBDedHvUjd1AUkNV+btnfPkAuVuZuJ3BF6tim44YGaHl4HeVFnz6OBNH3I5EPrLDIt+EQlmP+P9sCcMSqALIaaPyS6j9ay9Lbut2T5+IlXRBlnmQVqt2IScWPv0XfE818SaTa0JvaxqxO/9BzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiGaGXOn; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiGaGXOn"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so21629a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678122; x=1790282922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=EiGaGXOnb5fnK21aFJV/rhso8G1Ndb7dbJR/xKv1i2grVyrN30gdhwoR6NkRkktC44
         1QDLolfn8bSOjhh/Y9XeJTvaHkTPNLuPgifjurtfrki8RAl2qFRydB2i0KX+nNBXK3l2
         +gWoVYKZk1qLyhK0Ax/Fl6smrNzhUenSqgofmZbN5CoYYZHfMpl37Gx9tyivvIoqsiH/
         53gMLeqHpJWypzniI6xtX2X2KUetPwcdzbvLNrb343QANd1IUofTbYzOOhqHRuV8tL2V
         rK3hAQ97pOgMF+5EIvk5brc0Ji0NVHL4elzVHZnrCT/RBUJC6ecogFbkGTPdkYiZjeZF
         YaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678122; x=1790282922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=vLG4ofALJKWVLdVFUfW1C+KuCT8gBMXT4yj6DPnR/fTismJ5SoCKwKUoNfScL+VfBQ
         I4d6xEDBViGgGQf5mqtXrEwcQRCcXHsMd9/M7h5iRVEGsLinGX05OnqqmAv2c32rU+Ci
         xS/pVCZiMor28ht4ws7ZPZ3PUE9wl7whfjlNCfff7zkDgkOadXy3XS7+3Hvu6NjH35U+
         cLJp/bc8tM2eHmOhsRlKHLpQnT6jJBmmsTIVR57PDDnjs+Ps42b1ANmaQCOE++62csrg
         ToxAeMa4jQPEpy5/pdRZEsiE2JmNk9y3WeJuqSB6PNgkEjAkK4tIYgYc7H22dDfyGeh1
         jzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkOXCsxfq2GDfF2SFSakAvv+7reLfdg3YJerXY+aGENhhhWjd5vVmVwtQWQsbWdqUIAbmLg9DhfNicvWFnidcc4A==@vger.kernel.org
X-Gm-Message-State: AFuF++lVUhReFVrAzl4mTQ2GEUlHORabKorpB2UTslfnMgcAnTK3Akbb
	okr8no0KdnlP9L0iqzg1jbSwN0T+FyC7LFA2gQtDb27ztzTlFfurTFU9
X-Gm-Gg: AYBFou2OoiFX/SddoFXTmM9Yk7Y7bFlh4fBQ6a7AajM2OzEdxs980jPz5losgcgQFSn
	QpUDO7rAhFIuVFb6za116lkvFQyEMjGq7kBeKp3ZQE3OwVhlXNGQrojVb7KEFBe18FcQyq/IN4O
	ZnTkjBnHb901k113KsL8ZcdGLGIwDLt/qhNog/4lq8y4+10cgO4AaBgOehMNWqrFmZYRUFUT7QV
	nyWljxTUewLocCU5uM4KNtQU3WQriRvO24+q5lh5uGWNWxHObBt8pd4pByabeXQvlCY1fehbKpU
	PtquH8tin7r0SqXzg/D098dz+nrv3m97dowA5foj9MvXGwhyG/85GabZh/h35RDVmzGfSDZoZwX
	GZ4xdAW7oNb2BTnrHfMT9mdbM00TOzm2UP3VWWUSdoOeXLDAKNFZxL8KBbAza4gqS8/xpEOh6Qe
	IdidHezy9lo5OPWyI/tqtbw6Jiker9b/ynEgMDUpunud7Fs0F8eyaxcpU8qThTy//1Oalq8g==
X-Received: by 2002:a17:90b:1cc4:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39e54dcb193mr699171a91.13.1789678121557;
        Thu, 17 Sep 2026 13:48:41 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:48:40 -0700 (PDT)
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
Subject: [PATCH net-next v7 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Fri, 18 Sep 2026 04:46:22 +0800
Message-ID: <20260917204624.2427486-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
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

