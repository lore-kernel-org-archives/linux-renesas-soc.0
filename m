Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C87397343;
	Wed,  3 Jun 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479395; cv=none; b=I0D6RLcgvo/SLLGEo9YQZQP3oE8TPEaPWKF77rVZ/0juTOydA6Lz3RE29t3ysjSj+8lG6Eow9HcYu4WXXtZU4xQDip8WTDN6zDVG7p1qtNUh+904i/LI9guuLF/VlhotQwpvE6C0iL6LldzTK0ZrqXKzfU2z7RcW4U99s9Xh1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479395; c=relaxed/simple;
	bh=x+Jghc8phZZ4zUp4zmbuaQTsfqE+g9iKvQx9b7YWkXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cY4vMzo37UKRVqfjRxHG8RY+AA8MJT8fao5PZrOWQ7kCEyrjXV2CZX36h2DmaSOkE4DEqSAIpR9ptqOtHun5CXGvZROFSu4pzfBX9N7e48ZizH2U/5lmU9qFPoqNKd3HxI1wwAeyQeQ7wEcUIRLiuVujkAWJ3z2UIVNyn3hPnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GNh54dWJ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GNh54dWJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RwDPS3J+iwGQnJ5j2x+0W+FSjnR5X4EL0UDsDwy7jSE=; b=GNh54dWJosjirEQ+uOMV6AjCUU
	p3cGHsxVlj+LNMuLFMbouYHAAyC15gslju3v3GMxWKz5RBJEaMI9sMjYxN5Y7Z47OjC5MwL6bvVrO
	wYcZCOSxUVgIzoBriLFcDsAHT98LuWwdYdc3/MAX6otBcaHjunirYpkOCjT1JHhEk1U5n8JjBfz+D
	3dugn/tsk2v1nHXRtoTkPr35z3EhAQca6jq3A70uHZsEC8XPAF+KMntBQK88uHSUH93JscXD0kyuW
	zcFOOFv58/byBSwrCRe5Z9UioCEC3aMvZce9o8GsRtft4q+dhU+vtC1Wu6W4AJA2icWn44hZeQZlt
	mL38+wWg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1S-000303-0Z;
	Wed, 03 Jun 2026 11:36:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1Q-000Hpl-2T;
	Wed, 03 Jun 2026 11:36:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Wed,  3 Jun 2026 11:36:06 +0200
Message-ID: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)

From: Paul Gerber <paul.gerber@tq-group.com>

TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
MB-SMARC-2 is an evaluation mainbord for this SOM

The SOM needs a mainboard, therefore we provide two compatibles here:

"tq,imx8mp-<SOM>" for the module and
"tq,imx8mp-<SOM>-<SBC>"

Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 4d167cf392830..67437c8d669dd 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,18 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description:
+          TQMa8MPxS is a series of SOM featuring NXP i.MX8MP system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be
+          placed on different carrier boards. All CPU variants use the same
+          device tree hence only one compatible is needed. MB-SMARC-2 is a
+          carrier reference design.
+        items:
+          - enum:
+              - tq,imx8mp-tqma8mpqs-mb-smarc-2    # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM on MB-SMARC-2
+          - const: tq,imx8mp-tqma8mpqs            # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.54.0

