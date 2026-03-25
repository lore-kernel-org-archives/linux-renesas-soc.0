Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A339F17E;
	Wed, 25 Mar 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432698; cv=none; b=ua2N5Uy1XCXyfEAsRE7gp5YFHBOIwnZku7IgBu8UrZQsbRBcI58e5bZmLxB1zK3vUpiVcVvNeW887kaQZFE6b2+ldadTNdxP20p9bfMV1z+IGZ25piTTACeBDqrp3mcjjreBfu2+w/IA6SFpqpcqKaGSpx4p+gP7goVfzDQsN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432698; c=relaxed/simple;
	bh=OKmaiciPVWisrNFLbqeRT0u4/TKZEQGtFJ0xXZ7ZH3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCziQR51MoM5URRnb6vFmFMnefDlBM7pgzaxEswtd1xK22p/gvk/8eTPlkSGVBVcxN7IXjuuUTQKhdNy/qY2+9DT9HP7SKItW3XdhgTPlyTBQ3PP1n05CnH3q7Y3KGTN5N0IZb5Te/xuVtAMm66Awet1tqRqcWIdNHxpKnpI5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ChT64poq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ChT64poq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 340841A2FE1;
	Wed, 25 Mar 2026 09:58:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 099CE601A1;
	Wed, 25 Mar 2026 09:58:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A9EE104513B2;
	Wed, 25 Mar 2026 10:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774432695; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XlTY4GNmi1IcWTIBx6blh1M7c6UVZ/56ZQlcZICgNdo=;
	b=ChT64poqrA2iZsu1IgpP0zfDie4khQTuSWyX/2G8eRmtbXgCv41cnNzcFWRPJqmXv4jBvd
	5JEQRNx3uA7sJwIDbSpq2WtAtH1tizqyIV+2QhFXyRqmd8/Nu7G5hy053oEyXiOkSHU75G
	rRlZP1ufmjbfIQY1Ok1iF1h5hoh2ISgp1ACGFfa+OllaGxZlblzchizNDZ31BcdLxL3f5s
	V+wjngK0PsbsRykN4SLn2TyhMLK8Z6cCbX1WJA4fY1uE9eS3y+UG2Jdi2Fg9OoWTHquFSd
	ZiObY+4MbygI0AmSdtvuZcQkFHeX1vL7TpX4eQhizD9NIOFqxU9tl7tBeorS7Q==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v2] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Date: Wed, 25 Mar 2026 10:57:18 +0100
Message-ID: <20260325095718.388157-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

When checking dts involving the r9a06g032.dtsi file, the following kind
of warnings are reported:
   Missing property '#address-cells' in node xxx, using 0 as fallback

Indeed, #address-cells is not present in the GIC interrupt controller
node.

Fix it adding the missing property.

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property in PCI node and in IRQ mux node consists of
   several components and the component related to "parent unit
   address", which size is defined by '#address-cells' of the node
   pointed to by the interrupt-parent component, is not used (=0)

No functional change.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260303102029.147359-1-herve.codina@bootlin.com/

  Add details about value '0' in the commit log
  Add 'Reviewed-by: Wolfram Sang'
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index f4f760aff28b..6acf524174c7 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -507,6 +507,7 @@ gic: interrupt-controller@44101000 {
 			compatible = "arm,gic-400", "arm,cortex-a7-gic";
 			interrupt-controller;
 			#interrupt-cells = <3>;
+			#address-cells = <0>;
 			reg = <0x44101000 0x1000>, /* Distributer */
 			      <0x44102000 0x2000>, /* CPU interface */
 			      <0x44104000 0x2000>, /* Virt interface control */
-- 
2.53.0

