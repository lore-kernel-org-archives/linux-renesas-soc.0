Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4354D797E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847657; cv=none; b=ikHFPjS/qNSK5I2bC55qOtB8aWomp0Q30p0e8bgE54ENU8121bvl0gD7zFec6faUI/4DAUxeq8oVEr2vM+VdKErV7bnidZ17L8THw5tT76b4QOzDeW0Y3z3UFBDv3NY5suFwhTnf76/z4aOLzurd/iie8H+3uxGExGmq2hg9mSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847657; c=relaxed/simple;
	bh=h9GvHYGN8kFsxWomTSL3+w0/DICIY9EnVyVSQNo487I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgaoU+SiTsP9oVQZCP1QOmPbSxFwSKUIwIg6SL3kSzlA0VkSxPO2PHGqtjppjyCUyHobxq/wtrdE+yBQ5Am5XHkUI1W1EcmtK1Uje73KLHXf3yVNUAuSpzLoPueRrUf++CaPsrdAff8zHmvSPOt054iu6+Hh9yIczas4oS/Qs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH+XbmRn; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH+XbmRn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so816886f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847652; x=1791452452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cPn6AeauBdz/GNX46uIDkPBYty7pPt2F9eA6YyIANk=;
        b=gH+XbmRnW5/e4TKVQerr4pRIQ64HcgEOFQBwSVlOmnvsknYX73VFLY9k1D+q2pDXnZ
         dRe9ZKkkKiV5pudYu+nI7pNZrj0OSiS7zPD+VoekKTFXGya575DTIFoRfdU8aExW0UKp
         swSgCxiWc46Gmr7ZZsqX7VudaCUm2UH0MUisfPx0lEHGowiJFgGGhtzNMS36m19e6/37
         hIrQ41/5ED9fEAs0Ths0RBIKgKugkXvnKNhlme3rNH/3bcEy3dTqRXm/snZV/p5nAcSn
         51QjTlxgraoaw+JNyzijjsTBYxgJ5vfu1blznoVcTc4dSQFudkTueWEh7OC3QMrf4Zu/
         Jx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847652; x=1791452452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cPn6AeauBdz/GNX46uIDkPBYty7pPt2F9eA6YyIANk=;
        b=Nj7NpuAky2LCZiQdCyzKGq4aw3MDrRs+Ly2JvTcglR4kT4hqWy6nR3zcklm2F3RkVS
         yk6LnSExsqQWndLh/K0L8KhonkTq2LxY4gtW+d4zNdtk28cQSMV6soQ3RVk2CkHgzISC
         l+wUK+92gEOuamLJjVvTakLdU0yE3zPgf4DV+fo7E/ztD5ThTkZLGyLju0+J7d36Iefm
         5XJ9fcvfCLHgCFn913v5W0lAYdFRubWY+DdGcV181YLjpIi6xeojL7qBDCrCfnNtqj8t
         bW6hK0Lp4TNRHVT2y29b2IJ1PapegHUe7zzEd68QUahRC7KqCWrJOxJtZnPTNywrzblq
         hu5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSugh1Bl30aSdZaWpBu4D3k3kM2yjRjPx67uJ4lMgl7r1XDSepe0+FjXPPxtuJIMJnlydGgb/tdrEWDLwqkK3FjA==@vger.kernel.org
X-Gm-Message-State: AFuF++nrJx+ErxxGvtk+zmXTz65FcpU8ZBco4kCvZcwlb6MnetYqGIAt
	lZ3QO/gDvAcDmHnJB6pC3Vyug7VZUposE7cELBJ8jZDam3QEc/uEDi2U
X-Gm-Gg: AYBFou1egoRd/2+SguUneNc/dj2ROpF2X/BSIZnewtq3LPAcwBjTswHg9if1VW7I7lo
	FgFDcHzhn951EvddvZ9PY5z5WNzGIzv/fqtPSsdCcsdXgo3Yp/CHVzIYz6yW7eZiP0b5GJ98pUQ
	0AtKx/Spk/IHaU/kiW3pGRPRvU6ZcWcZebXeo0a5PJegAM8riRBUWuHyHsSpfaJoRUlmNur1NbM
	B+Xgy4gpRo799n4QR+PmODqjQBW+zRKDilhYb9YGU9IuQ6IJFyeVkMJd32MJ994uKBvd6NutoNO
	p+Ejb8BMzSZGRBDqcS5GbabPTv8SO46RHhsak7xJWETv77RNhBIhmv6+NZRqpiucVTz+bTzqnan
	YcE7klkColvo4V4rkMP6FHYfTdCMWJEcyM6PiMvXB4xyLSIoNZhwY2v4Zc1aUxBfY3o8efEMZRQ
	zPu5CPKSMVOfDxtdJTJPCBYGoEVNeSWdn68li2QzejApP0C2KkD/H8D7dO3XE1pOSZU5rcPkRIp
	1Ca
X-Received: by 2002:a05:600c:4584:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01eb0389bmr43622515e9.7.1790847652365;
        Thu, 01 Oct 2026 02:40:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 9/9] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Thu,  1 Oct 2026 10:40:24 +0100
Message-ID: <20261001094041.135697-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
ITE 6263 HDMI transmitter.

The overlay enables the LVDS controller and the display unit (DU/LCDC),
and configures the ITE6263 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated license header.
 * Dropped reg_1v8 and reg_3v3 nodes as they are redundant.
 * Renamed it6263 node name from it6263 to hdmi.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 86 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b9dad3f44ac0..05df4c642e4e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -267,6 +267,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..3c64db8d22e9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
+ * connected to LVDS and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	lvds-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			lvds_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1p8v>;
+		ovdd-supply = <&reg_3p3v>;
+		txavcc18-supply = <&reg_1p8v>;
+		txavcc33-supply = <&reg_3p3v>;
+		pvcc1-supply = <&reg_1p8v>;
+		pvcc2-supply = <&reg_1p8v>;
+		avcc-supply = <&reg_3p3v>;
+		anvdd-supply = <&reg_1p8v>;
+		apvdd-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&lvds_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds_to_hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			lvds_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

