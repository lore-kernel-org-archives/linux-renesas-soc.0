Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6872602;
	Thu, 10 Sep 2026 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064374; cv=none; b=fTTskLdS+BtvpP4x7PZHYdX4GJkvbUhp8EcIgQo68p+QGzeRuR6IiUJaiMPq4Sn772Lg6TRfWWHnoyAJgOdLSJYq8MFJP6fvHJVbQW3vC/nSu8OPhMBpjt0RVoHyJtFUE8uELdWkM8cTSrMHJjLuSX/klsgKtyx3/P2uknQAd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064374; c=relaxed/simple;
	bh=XILEEiHUPyLk2PRwubmkvFRaUhs5ooUV233P7pz70nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=haZhIECjKArSyJ8Um6aS3BBLZfmuakTgCh9CuDFPVMjsG1eTPUoHjiJbTnpeaGcj+su/93+bzxTOCmFE1Gd+tbry8/1o6+HFSdKdHb0fKgCXVSjVoSqvHhu92N9sNh0inmpm9MTC+o/REpc2qAViYnsPrHpIIPLekTSlOyI4dvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RLFyJEaC; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yEtqTVNH; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RLFyJEaC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yEtqTVNH"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hgmD113vfzKv7b;
	Thu, 10 Sep 2026 20:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tzEc8lhKb/AmwwInaVCm519AyWFaLkYzW0zAwLPqUF0=;
	b=RLFyJEaCGYmiH3CvM4coi05hFkRsIzsiRNhsnb3wY6dtCNszn9FxzJIGVDQuApsjgZwAgF
	vvxaUHev0v//fv+HjyWrh5vSjv0kRT31SMpiusJ4kf3QhPaEAacIY1jWYM2vF7C+gNitU2
	PI/7+FRRZ8P7z5DPZHSEwP2KBlNzVix4LEt445HuqJbaTNmZHl+PEgHJ5+lm23+vAgIDD0
	45Ldk5ZVdxiDwju7KNNgESCbp0/kFAzKndetC1tPUfFGsDNtHCKUQe2Dz8twP28pERR5gd
	6dq4WE/iyRW2bBG5tAqmJZ59ii9YGyma7yLwUKvfG48KwxBdWfDLQxTGkdFUkg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tzEc8lhKb/AmwwInaVCm519AyWFaLkYzW0zAwLPqUF0=;
	b=yEtqTVNHdWlv0I/52yoHVNGVMuBMhlhlfNrTfeN4ZbiIaCmoe4sHxRRUzozWIoaszF1Utb
	CQADrO399cx5BG/QhPZkUgD5duGlIicItIncT8qUWDGOV/WBW+AQiA2XD6WVVwE9d7SzJj
	hKrtPxMLdXPlKqPY+uBZTEPko1yMpHmsBZqzsGj1QpO2tLlhZVwUWLSniKyfyS/zl7Fdgs
	2YdzE9O+QomFCzGRCP2QuLHe9zaOCklOE3jREnMk7H7joOmux9jVGldUjcfrmXi4A51YYe
	d45Aicn8XsZBiEFahJ8ed3PfaXQJglRqHodX5abIyDlxQzX4xdmIFuBFoJT/AA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Document 10" Raspberry Pi Touch Display 2
Date: Thu, 10 Sep 2026 20:18:42 +0200
Message-ID: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6f540de8102c5fb3121
X-MBO-RS-META: 9cfcuuqi53w7ub8zjafgbsz17du9g3py

Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
The panel is based on the Ilitek IL79600A controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Extend existing ilitek,il79900a.yaml document instead of introducing
    new one.
V3: - Rename ILI79600A to IL79600A, there is really no ILI anymore, just IL
    - Add AB from Conor
---
 .../bindings/display/panel/ilitek,il79900a.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
index 02f7fb1f16dc7..f475302b87b0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
@@ -14,10 +14,15 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,tl121bvms07-00
-      - const: ilitek,il79900a
+    oneOf:
+      - items:
+          - enum:
+              - raspberrypi,dsi-10inch
+          - const: ilitek,il79600a
+      - items:
+          - enum:
+              - tianma,tl121bvms07-00
+          - const: ilitek,il79900a
 
   reg:
     maxItems: 1
-- 
2.53.0

