Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D92407CEF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678098; cv=none; b=K75yczIsRpCF//FVQlZnVVztDnzOHRXRJ9pu3iO/N762nK6CRiP26kxQroSPBmJwbjW7PdBIYH89/l12v3gKn3KYYUJ7Jtcy9YPiObDUki/4HmElBhN/oDIaVu+O0KO+UB2yvexIqwmxq7Q7ngD1WZReliSpeu1hNcSRBMY6O6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678098; c=relaxed/simple;
	bh=Vpg12s5aCfYhqiZT0MliutjEHvX20bbyVe8NFEbpumw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHADt/YP4/lU/93YOz5v+bf+ywysn8xgC9OSFsF8P9FujBs9oe5UIL3cBuGc202ciZ8NvzV2phziKzhWyph3xeDePqwxCLeWKiir5crsYJlKt9g8Bha7LZHrCcWb4cFGbwKNAHmiq3Oo0GZoyiFk3VH06Eq7ke6svu2UdcBh7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVM3qwg5; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVM3qwg5"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-39e44984991so43057a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678096; x=1790282896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=nVM3qwg5FLDOsrZ745hiNOkU+KE30LI3UQL8R8cv2t/iEdn0UcFZBsK5TAcGzKeg22
         6D7SsqpM223SfL4vYvg+juGty7d0FenmgqC5Piqig2HALHtFzHkyPhKU74NDMIWJ+6Qi
         KEVJ1I6NAWLRCuKucGgCXnTAa/oWHY8q0k9Lbs0pcShN+a7n0hf0klfbPMmJUiX9sirS
         LxgvlGSb3rBq4l5XChrKLWwpuoeApDVKzNKFaaQdb0OJvg8SISa66S8bqZ4sJSKogEnb
         db3gqrDl5OxLdTXszhzesgrbTbpPn04Fvm/dOG0kYmAcQzkMFqNNCGkTQFLPd93YyoJ0
         vh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678096; x=1790282896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=k4scVSmeZPO9/qFOuPV8DK5Vf2+F/cvtCkjAC0buwcB+F8s49FA5lVd9sA/PgyJNi4
         g1cUa2YCTMAehAbH9oHTrjx/V+guQE6X3eoBng9z5wHtkQEzHn7grX3l0O/AWQpkNdGO
         oZ30ac/AeIMXryWePprvgzSp3EZDPsEMnoqRjC//20QYT35mVulC4yV3ylI2/eMYoXxu
         PhBKZUVauQ24oNQJe4DI3pu4aEAXQi0Q851N4NG7OWGtu2J9k5DUkXFnJfCyxisisc0J
         +rzpFTr++h9xJM8WUo5peswwaTBIQMlVMysbn23vHZCggRlpFJVs8w6vHmcmounL0wOu
         uH3w==
X-Forwarded-Encrypted: i=1; AKwUvBxxtv+Gw3hM42Gotief1x4UK54YIFsVpFWd75hZJwMOf5Gi+znJphDPQhbLhdgIAloZqhjFlPVEVRlkHMMYJL/rrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mtrUxgzbt9yzINVy0uMlrDIAVfAKhviFhMXWBXm++uNuBXPtQz
	VYkqNgg733JAFQZKQEMAQU/numpqM8oK6xA6SVozGnKCtJzoCuYQh6i+
X-Gm-Gg: AYBFou3azDaWrUc7yZY5T/YKSz8HhvNWQhxXUVAVJSLek4p2Vp1zCdpWtwbDXLGN6as
	w18JQ0Pl6GmQgFg0AckZlmUa9Rzuifs73vyEopBQ9/qiWCU6wz2g1HvwFHo5BLomXxRtB9jb283
	jUzG6IHUiKv5IxW4ybd+AIJ/vce50FaffRORkYGvjS0vo1rTf5XwAtmadeA1Iext+x02kJOLiRG
	x3JLJp5+kChhL2qmD9xBmRLOYAdfqv8od4WorwrikXu7bmvXtGVXsjuUxBMcZLPrdgrPr06PB5Y
	JWbVwiG39+oyxNeNagdppsg0k/rgYTNvCChTYMRik5S+NG/WLbEE4ThmlFWemsFw4Lwgxb7wvEq
	g0HcOvdpx23e+5NIwbNb+mecCY13Wl71SjpqrihqWkdS81D0eu7mShyTTMmQVUffoRRuFB6/CZE
	qL+L9UpEhjNv6KfVlsrcKMN5GC0oCV5LGvhQJUUrbb8fZtxPkEmdjKe6eHURWavnskGeElIi5q1
	Mo6W8Je
X-Received: by 2002:a17:90b:5305:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e54dcd917mr1044616a91.6.1789678096241;
        Thu, 17 Sep 2026 13:48:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:48:15 -0700 (PDT)
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
Subject: [PATCH net-next v7 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Fri, 18 Sep 2026 04:46:19 +0800
Message-ID: <20260917204624.2427486-9-coiaprant@gmail.com>
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

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3

