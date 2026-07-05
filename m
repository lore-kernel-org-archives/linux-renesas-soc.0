Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216A20E023;
	Sun,  5 Jul 2026 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287356; cv=none; b=RnWv57pxknXz/26HFaECmktntAxeoc6TwF01gsbbevQXaaHjuRH5tnf/XduLtVOSnX7HQizfz+izxhz4C6WO8iVmhYNnAdHMrsAMndOK/WgMGeHaNFZdXVLCSxOVRUbiRCD2aV4Q/UmKlW4xl+QXfkMO4xt8O6f+qxKVUPSJou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287356; c=relaxed/simple;
	bh=X0bi44pGGq2wkUprmik/FLgZa+jUE+P80H0Y+kHrkJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9L8MpV7y0wOU94mpsaEBzWOGDJif+tI5iABb0FRFXP61Bg/U/UjFYs/R5+W5zfIF4PNJ7zp+Mdtm4WBULoldFk7LLZdMl0uiF44k7JxLiAUjXgS7bpSEGepjIsgjyihOnYczct0B1QaejapB6EdHQz1y+ZmTOcVk/lxYdWczRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W7POoZQy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W7POoZQy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC1A38E0;
	Sun,  5 Jul 2026 23:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783287297;
	bh=X0bi44pGGq2wkUprmik/FLgZa+jUE+P80H0Y+kHrkJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W7POoZQyk8iVfz22iValS6Xrp/Q7rkZOiDtjGsuM2nfaHRjG8wRe1GsYVguD8NCxD
	 WZ+mMdaS22dZwyLL0WMrhPi9je5xmHgRoS+T2X2aLKlLJqsG2RN9At8X46ahqw5voC
	 RzfIWFQfVmmOC8S3zZA7m3AD9wUFjUoMrsBz8+LQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: vga-connector: Allow hardcoding EDID
Date: Mon,  6 Jul 2026 00:35:39 +0300
Message-ID: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
data over an I2C bus. The bus is also used to detect the presence of a
connected monitor by trying to read the EDID data.

Some devices where the VGA display is integrated in the device and
always connected do not connect the DDC pins. Some development boards,
such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.

To support those, add the ability to provide hardcoded EDID data in the
device tree. This is mutually exclusive with specifying a DDC bus, and
can only be done when the VGA display is guaranteed to be always
connected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/connector/vga-connector.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
index 25f868002000..7e1b8e798e5b 100644
--- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
@@ -19,10 +19,25 @@ properties:
     description: phandle link to the I2C controller used for DDC EDID probing
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  edid:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      When the DDC signals are not wired to the connector, and the connected
+      display is not removable, this property is used to supply a binary EDID
+      blob for the display.
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing VGA signals
 
+allOf:
+  - if:
+      required:
+        - ddc-i2c-bus
+    then:
+      properties:
+        edid: false
+
 required:
   - compatible
   - port
-- 
Regards,

Laurent Pinchart

