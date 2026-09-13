Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB423F7A9B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 19:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326063; cv=none; b=PagUfWzXIpc104iKLRRmma+D242PXkmMa/cyPxT0SiXAiMPNGjjC8R1C+X9snARDAjZM83Yu0h8o+vLiKCmJX4JSsG4lMTdqOHx9y00q8OHlNBZQ3tnSe4da2sGyGmghtmVKdGoFqKlOqtgsy60jHgXUUBpb6LDHm+QcyXBRh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326063; c=relaxed/simple;
	bh=/XopV8KTgRYgJTjrUXTlaOTR0QRZ8vtOfg0QiwkYOPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCIiZc3RnFqsXD4T4x369EtJKXwzqwIRmUsDOAei+ZAG+41fGlj/Cy/cKEtAAIUZgfhRJUsuSKYRrpQ8X36EDkgwNtsOlZTMC9HboSihpEtIk3wYjOFvQsoy033OSbHVVCV/bdyyRz7MpPxnHNMqxGy48cLYfZEIWMxZd6dENA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcPwio70; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcPwio70"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so11702445ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326053; x=1789930853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=XcPwio70FbxEMR/69nLz2Jkdo3He75E5qKdEijddj/doqM/WCjsfJ75WPIIU3neOes
         v0e3chnisWmuSUN33YqYsjx262nme5HOL0nQJUX6yRFHCzH0SW5eWzbbDk2YNY7LH5IF
         Hx9B5dK8zdZ8EbrqIIKyhAkLjnfx1tc29PWsT9KnTFtdBSy2A2T0rd+SCmlx6PXZqPmq
         S7O6GiBYTcIDzTxygnbXY5+6l4EQYVIp2IGZc6/X2LuZ/7cqyI1OHblvAgRSd+jK2Kb+
         qfHEvNBkK6vJbjYKKFArtiJp4MnzJ9iV1EmQfX0XrQWnI3ddlB/PmJaoeZ3VMuVzEb+n
         l+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326053; x=1789930853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=goc2Je+0SKomQzXVZYkrh2ulLUzq30C9deqaTBBygPi612zPwViRgtHsEZix0j98Bb
         gD6b6pL3sD6GA7ujY30oIANOcGLBhKERjD/2tV5NAJgyW616Gh3ZwON6CBSPCRLxuArN
         c0VlAbSuIGqMRSD14JBBIBZ3M7AtZKMXWrww7GwkZZ0ql8ASp7UHEU3oO1KuonDA2LrD
         X2rJdZkeG1W2FRqYB2JTiTosh941kNwZSt4u2lkQ+46BmxkiCkxGUhP7zyf6evUTeOIt
         TucqmvIHL2fTEJXx/79E3tN4EdB599fMFE/YMw/OIaUpDWSmDypu2aqFxgU1WlAbaxzK
         VC8w==
X-Forwarded-Encrypted: i=1; AKwUvBxin3Ub0tse9SzbDhVohbts1XSOR9ZoJ/FRqsV+Sc612WZcL9ljxv22fRggqhSgiznFfD41SJH8Svj7yX++QF0PMg==@vger.kernel.org
X-Gm-Message-State: AFuF++nxylxjXctIOK2Ie0RQzbbeofrAbd0Hh9Bsecq96MvX1ug+YR5Y
	67Sk5nsxjM2oMarsM8UDc8bx31fvRonM0CX8MLItz+peeJLQhF6s6459
X-Gm-Gg: AYBFou0oR58mtTaGdOdL2Sz8lp6uGo8BwhLKLdJgKh+kbuEQkexZlRYcKoppsaK+FjH
	W4CHHAQ601gdK9gGFH8HzjtBZMGFZEeBi8vYMYdG4dzfpZSqCOmOPzauz//bv/zs308sw+QBw7Q
	DQlyFDSkfuRzQg94U5SgDjFKFV5akzzvFSdSQvSt2zVpjMaR58pGcY5X2qHu9Y61y8nx0KDEGn9
	geQ6OQ0pzuCvvWsiXyI/SX8vF3R3UpNQcxfdinTXeBc1+cM2eu01PHS79C7tJO3pS81HeEm1OLN
	LJEbvTf1+dwTMemKT8dkkh5O2wGrjMovGd5svNk5T2dNzKnqv3LU72wJICaZs92bOViB7zhlsvM
	bpAt2tPeN0SAFH2Bx5ht9SeVio2Z9TFUU7T5HX8qIjyX5gKWRg0LQipdQNUFv344JekDYVbExBs
	XiVxT2BAQtcVxhI1yIgxlcHc76zL6uugQXbevnYi73ShlBjZkSoUVtIXSMse/WOfDPYDmotQ==
X-Received: by 2002:a17:902:ea0f:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2dd2a1c41camr232853065ad.3.1789326052648;
        Sun, 13 Sep 2026 12:00:52 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:52 -0700 (PDT)
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
Subject: [PATCH net-next v5 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Mon, 14 Sep 2026 02:58:43 +0800
Message-ID: <20260913185849.907479-9-coiaprant@gmail.com>
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

The Rockchip dwmac glue driver now supports SGMII on RK3568 and
requires a PCS, referenced through the "pcs-handle" property.  The
property is parsed by rk_pcs_init() and a missing phandle fails the
probe, so describe it in the binding and require it when phy-mode
is "sgmii".

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..67b21ea77ec96 100644
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
 
@@ -159,6 +165,15 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
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

