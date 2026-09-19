Received: from mail-pz2-f4.google.com (mail-pz2-f4.google.com [74.125.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254E3D668F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822323; cv=none; b=WSSCeSNie73Zwa7rL8J3AiLWNTavHvPxFh7sHO1bKNtQv2D/79WrRuK26+D+a7Z8/Nq5nyzBPCii4GSl+vasabixIG8WgriKn01oq6ek4CVpXtaOe5JYhERmBwTb/QJgZG+X+z/TNOJO10ygLwlwr4RR6CJMVHNWohe1xxXgLv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822323; c=relaxed/simple;
	bh=RQ8/bIf5S9U/FiX3uQoU1u6/FV6K7LLD2uqZys3J7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvDvQJB9Im4HCHTJkeObBI8fibVhznUUgs+NQJc2jCmoiG9zkFEx1EIVlTlyW0IxGbuqoQoYBZOGzAZ7gX253qCK+bb7AZ7TumwLPqRZkFGdQVU3tj1FhM1u8ZVEIPk9XWMiqSoIsux+ASep4UsjomDkG5u8tqwpoifmjWdMXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuWINVYZ; arc=none smtp.client-ip=74.125.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuWINVYZ"
Received: by mail-pz2-f4.google.com with SMTP id 41be03b00d2f7-cc4b14f0364so608656a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2026 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822321; x=1790427121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=iuWINVYZQOlRIsm5MQpniniXdaMMKlIDbcdiL2joT++n2t0GU//Ojqx4KQoIp1Y4eu
         9vyYPxwDHT9ASrHGCZFi7EbCfORmR7gUBwsr238FIBhRGk2PjL5OZQJ9idBmLfuhw538
         oYclFqhOlmE/8JtxKzog9GeCP/xlapJlRMmJTgrhzdvmSFCo3JygnG3IaBQtJ9SRDGkW
         7NLX3oSECRgndTyKgduwk+gj11qXuQ+SZNcYZRpNMUB7uBVKXOlAXzB2C787B6gZek7b
         x8Swonb/HdXDVtk4eWqKHYv+9e1sIk5gDuQ6NKsE91D4yu3WR3Nonw1nrwvxCi4pxrN9
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822321; x=1790427121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=XuKKBMzrcKvx600QlFD2au2CvEpzd+WUXeFLZZ7v2FDytO9esHqKBm4/EvGaSW79i9
         FS4IL/m+ftXg323rtKXhjSNl21BuvFKBnm4TEgH6l9qBF8wSwoZN2rrX/Ii+bwuH+qAS
         PNZBEwtEsoaHPIYUIt0wR6HWZ6kPXr8Gflt92LJVcik5ydtBgqm/IKjnuAdhjhMbqHqk
         aS9FXQ5t2FAyS3ZIX1bQWcJX2Dq/bbj0dYI+YjCBzxcq1HqSjIY0guIIR7laCVYFeMCx
         ARL6rDdsJW765injM+HXIf6cH5tGywKHgRnY1fJ6/2HaElqV50CFgmTfShUErrKShLhE
         b4XQ==
X-Forwarded-Encrypted: i=1; AKwUvBztnvfESuoGySzyEjsaQCtojKNYHvoVHhFP1zf63VpUKdYRZlnL/XudXJJ/o8IBSS+TCsGIBchORWuNzYgLPgVD8g==@vger.kernel.org
X-Gm-Message-State: AFuF++klvqaQwVO8yWsZdFZqoltMAgwDP2WC1yKzJQEOsBOojpAmG+ix
	aYdgq1JrNLJgU7m+L1QPSm0EIorFGxCLuaRJaLHTK1QCBolSeCiWXCW3
X-Gm-Gg: AYBFou3cbPe7dETXt7CHj07jbaBxaiRc7Elt3oKyaxHxCsXvXW5jZf/lS1Oq82aKq2V
	L8AtgW3Csus9Gc//cWPA0ingm1C+YUpwCOPrh/pq6ogr9t9dgIgVasIHzO7wtnle/w5hb9K7xKJ
	65/6wGKyk+lNUjeoHBXpIWdchCA0rhXS6LCymt0lczjPd1lNG98rvnRMvdOyzEc8n+Hcgfl+ZEP
	+rh4Wgvvw6eXebCwVD0soOZqIimpE3qqlUGwVAf/H5IxL4pfqhE6Uvk8xv30s5IKbwjZd84nCRR
	mLAhgGMp29bpOLSocf1EJ54MjoqW4nvlCTIl3Hz0HDIsz/FKp9tOr6krInJ+86fX81oZtgFHXZW
	E0BLRO6a1Cu/0DbFV6lW9WCxl19fioNY9jDdVIfjtbyKYm+BIeLdGUSWrt/tN080JXxHMQ2GbVt
	09E9h6n4719SN6Wt93GLgrftuHOtaXLuWISJWLXYPEh0QkaYhxrMpVoIbUCZIME6bNC2ByzA==
X-Received: by 2002:a05:6a00:9086:b0:878:3783:8a82 with SMTP id d2e1a72fcca58-8783783932bmr1483263b3a.52.1789822320744;
        Sat, 19 Sep 2026 05:52:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:51:59 -0700 (PDT)
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
Subject: [PATCH net-next v8 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat, 19 Sep 2026 20:51:09 +0800
Message-ID: <20260919125119.2107089-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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

