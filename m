Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1539B94E;
	Tue,  3 Mar 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533240; cv=none; b=IpYBTO2SU2K+BHRpce0wR9ry+hbqd7zhnmxqcCgCU+RrFRRlB3MwYki2YdVTU9qdOL4eCydpjzbMrMbpY/tPNwFH3AcsQtt/Vlmj0f2wL0IcobEBME7PkqFYJUD0N9xEEcS9DZ1pmn1df5wm2R4+QPCB/e8sNjCIJXXQjko4PgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533240; c=relaxed/simple;
	bh=26dxNzDjY7CRlBAsERtAcTM0EaQVX2iVppkGlcMDxj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLoJd8MNXhWHyE3o30Ti+5yUUodkjLALX7ecZBAAsVFiTsWke/D9Z5UDTjHNJxq9QG7CUjBP9EMW+wdpxoLGaW+WcMYF1bdNOGiZFXT+cVDn5KZBJzJrkyFppv9zI7/tqnzOd6U89Bvc26wJ5NzenDd7PVMDtFFrogTOcRo3KIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sxfjVxt1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sxfjVxt1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E52151A2381;
	Tue,  3 Mar 2026 10:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B24845FF29;
	Tue,  3 Mar 2026 10:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20A5A103682C7;
	Tue,  3 Mar 2026 11:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772533234; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=b4i03LZAFmyOpibvX8KpgR/jnv1vu75TEt84f6RQncw=;
	b=sxfjVxt1BXcUaLnzR5grqFZvZa1eT/9kKytOTyJPGHP/UIfwY/FAgopG6vuEa1FEKQDub+
	owVaaEEe7lnlE+8o/HmZYkhybPwUJt7KufEZAqnGsZMmSMMdsCyHvmkDaBjLFPvhQoHfAf
	95RAX+ky9eF0WCnNjCmO/HZrRvuUrPR/Rkf2LhYtZBmsgwjGoHvf8Wj3AQESLg1qg3k8v5
	udrgNHvlGBlGyyhymBOI22xQ/rE/bPfZIXzFpuJ1668VpE1HZWeBgdRD7QzgW1dC+TPiuA
	M3gvVmUK0ttLT+qbtHGm0fFi3RGAANy2cgP+0ULDo5Hc1JlHEi1RAy1gky1c6w==
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
Subject: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Date: Tue,  3 Mar 2026 11:20:29 +0100
Message-ID: <20260303102029.147359-1-herve.codina@bootlin.com>
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

No functional change.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
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

