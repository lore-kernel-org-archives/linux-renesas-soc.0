Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D54AA401
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795533; cv=none; b=oahcPg97f4OIS49qIktoH4Q9qZvUpgGbXg6kJ7zAbZSEAWOVdf6BHt0rGQS9ob73p8r1tUwTZwRaqJhOflAntGP6pKe9HTmVFcckDV99PG8Jtg963MfkiVbd9CDyX/LPgvwJdSqX61ar7fdXI67GLtowFi/vzAIRY5a34lrfwNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795533; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6YE44FQnQnqw1cIjWjWAMgpdvWYea41VLVekwYXsUKcldJTyCtmbmg+WohkTOXadgr7IHFzO7lHOMXrJaVmOU8oBYaO4ZSiZGf1zMK36tavQXWct1AsuGC2oC6eQap4PVElS1IBY1r7Zj8uNfZfpUaorCCs1WVk9Ec2e1+QPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv/vx9+F; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv/vx9+F"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-399213ef56cso1810099a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795531; x=1789400331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=Dv/vx9+FdyaJ5K0zDCPhMClqwDcb5KVaepp/oSxDG/LtCaX3Kyis/ZX1PEFp+KT/54
         l0Z3+0WN/9GdcyDAt0RWEcbLCFWEIffYYOqg2yQb3UHoscL+Vz2blenkFln/TENttXUG
         hKfSYPHjqqs9tzfIcCYvhun/I+F6lsz6+1sKLdRc0RJvLenqdb0NdOmNagNT7Sk+p+g0
         ij5aMKhzl+0TrmHWORIrgyfsbujZpATAxePIwq3071xmuin5vgvQcthSvcQVQ4lYwCap
         1ijxd9HAXK73LO4qohu5D4M8dzIuZO0kdlcZVvfdqv1TUz/O3PImNnhg4OJ2Fm1GI3O8
         Jhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795531; x=1789400331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=msEH4xKexR2/jqVJUpo86fLvafPS3HFPyi54GzPAwpoDRhnt32UYiLRRKNKo7C/wU1
         epYnbFuPo99cpAOlI44UhmxiUI6CQlYFbdpsYS0bn9cAWRXV60o2TQyHEWtq5YcCYyih
         l7zS9NM5QoPVWZR/V7TyWGymYPwIy2XDzMLdVcIQnhSFYSktLlU+Z2NK//jV9Aza7KcN
         YaMnEbLKgUEdL2+WLvDvMy6viDLw8NIKx9lzlB9MDitHdY/UJ8YP7gtIWwcLVnTPGphQ
         7KN54jSnpGqjj6ptmpoh9wNJaMbzVeP9qFM97XKts+wuqu0yCowH60/Ij2vapTAlNTi3
         oljw==
X-Forwarded-Encrypted: i=1; AKwUvBzUuxuFaPe0cGiNScJxyY4061YIb64170agsvUFEzZXEFb3DaZ9GCO930Poean2JTUXCaE/JYmN33AWU1J5OILXrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n1l2Nrpz2zv6jEb+BsCyMdNOnlc/hTjYq4ZWYL9CvkkRUNM957
	j8zhgNkNjlgbV3q6eujv/mCrUK/i0Z7yl4LsneCZfSkM7sd0EDDa4PR2
X-Gm-Gg: AYBFou3L9FsTWPPq9dK9F7sprrQ3NqPwGxBUhZe2VHOsZAMBbwmSED6ghswUHkKIdEt
	Fm/fviKgdq/f0fKGKKxQDyJB3G7f4nr9chb/Tnb8wdVj34V1SfpcNzXD12MaNW3iSaaUwHesyHc
	6kTcb2mJ+jA4YDtJAUDhGrvntn7q5pOmwRnaOCyt+KxXMZ9wTPLqJbNfzAF9DDfK7ttVnPd9E4T
	XA17VjPcgMD6jC8awv59g41rbLnJ4uL+pBScn0d8nLUhfj5qi27QEs4i6LFmcpJC5eacbdM+YtA
	Fg3ti+OvO57M9wr1SxXh9eO1lApmhQ7wzS9vJpit2+bwf31HxODK9yQdwJtJr3Odoe6+sfZnFgQ
	A1vRTbVy3/8Q3IGadwFkJovunHh4z30Bbx8K5obvIyArRFZCgPEGTmdKIHrtOg0qDTTeGuGB7E6
	Q+HAnOh1gfkKZtsZipNlJHMp9GJB3yhuLpTa+cAynlbDOth7STtO1sWZ4B4w0=
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr37885553a91.19.1788795530498;
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:50 -0700 (PDT)
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
Subject: [PATCH net-next v4 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon,  7 Sep 2026 23:37:05 +0800
Message-ID: <20260907153713.2572547-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

