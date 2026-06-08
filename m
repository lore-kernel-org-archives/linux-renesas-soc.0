Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AB3CDBBF;
	Mon,  8 Jun 2026 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928514; cv=none; b=Vx9ZyVUV0oKDxGxvwH8lt2UkAwA8kovcMCFQXHOTO1XvKdt4IvEUDxp59/Pbml7soJTlJCSArZEhEhej/j+CflVhLfUhNz0w5B9TEKkPstuY6em3N7gzrTELr8j+QHNI3REa8ibnyR80s/bgoNUAkbOT/U/Po7Bf23v8POu8T+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928514; c=relaxed/simple;
	bh=DzmJraeZ7ZUoNDjlb7iApIxNUcv2VMC0IgGRHP6P0bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxpmaEpOk8xSrbFhsBgwwVCH+bxq2tjzBTGgxjZmRLQbOG4XbJf/vQvxUGZhl4l8gQHWXlMRxHpgtN6hkjvlsMz+IvRpya+d0rjCcCSBnDSFl7s0mFcKfs9CaZbIuu6OZWeKMtltJ99HqTIIHI1gVP0WALHBA5lvyk2QDfzT1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y24GZG/H; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y24GZG/H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=hKYKRZ8FtESJlyK6uHnHiclPFcshQw5hyacJie3Eij0=; b=Y24GZG/Hqkw4vjVvWGTrZZXO1h
	Z45RVyKH/ICYAWnENd165CMalGpy/6JiYL7452ysr9aeuZ6jz7assiDwSscEt6/jaDsvTpZZRb6PS
	XDkHG9SkuhJldxTf09fwYaeygYBe0isQPe0hsM8NW5XzeGCykTw/oKEINvuW2/j7xmyn8PzFNZZai
	j0oK+/AIsh5u2HQ+cV/GuvG1nis8h8MnzWDb8aGV6kniFfO/dnmr8/k5RnoaLKZo2DZCDL3JpCZAF
	cg3AYCeyFG4WYszr8NFuoV42jJRaz9C9WX/PFmuDrAsBipyJMEREAVsWnKCR+8KUG95+Tf11FrAUo
	B7x6p5hg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWarM-000ITR-00;
	Mon, 08 Jun 2026 16:21:48 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWarK-0008uk-2X;
	Mon, 08 Jun 2026 16:21:47 +0200
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
Subject: [PATCH v5 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Mon,  8 Jun 2026 16:21:30 +0200
Message-ID: <20260608142144.564871-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28025/Mon Jun  8 08:33:34 2026)

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
Changes in v5:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..6237fb2ae50e6 100644
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

