Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDE430CCB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329772; cv=none; b=lX6xKA6owUKiJVo7R2sGvqDY8qlUe2jIYMnNr9cCeocdf3B70d7PIIb+MQR5PTI5ar6RoVcCDBslGd9vrY/jLhz0ZkWinKCSxx7ENcriMG2HSGJTswGGmyB4mpBZRCElGRoA6HXSZnCAROkWRKaKD7u2fILe3vDvG/NMxGALkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329772; c=relaxed/simple;
	bh=VkvGp/rTRuPjIx2ipVtb5348qNMxB6ZgaiUGVEKCpMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nltzZwOd1krwz7VcZpgfPvqx5UZ0gkz5gFvht4Gx3yKsWPn4DxRQHF0cLBr+6B03Xh2kkecXGuQ0ao4SuPtVAx1P+y9sUpeRQG/9CdGDNgDqANdL1RnSBvPTKkuUqiJb8Xoa1Qk3yLU93/Q0avf2bmBq3MInBWGeM2VrOxIVq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGZksjUJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGZksjUJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47362928f65so815752f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329752; x=1785934552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pinADpOKzHPTga4WMKKeUJ9erRfZf6ZG2bVQBoFuWYQ=;
        b=pGZksjUJIiup+vFj9e3fHAeIiaeJrKkzj3dDgC786yQOcgXQOeUt3fSF6fCFYEs7BY
         JVrdGpkiIaJo8E4xYNYLJPbvOtx5EYR4pGn8V6DZLLiw5KW8WTmh8JGnrFP6oyfgeHkf
         qioMFTk9LupDVgOcLA6VazWt4DLwqAw6NmoNMbDDbg2J2lm8eajNwjEgiKHsnsKCsc+V
         DuzEQclhWJc5oGgneLHwzaB67ArlTRJ/PN0ZO+mY5lj6DLffJ0LmW5WjUEXYnMBoBa+3
         AW16TMjFYIFHk1c4gEhjOkejLWH9ldIMjuhhpO4P4T5/UOGi9SxRdvuXaU28rSpW+EDS
         kT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329752; x=1785934552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pinADpOKzHPTga4WMKKeUJ9erRfZf6ZG2bVQBoFuWYQ=;
        b=DOh19g2qZRD503bwQKLjGWDRAOerzfJILy6V6oFvl4kDAyiBzvzr2FkLc23SZMa/nl
         zmd7xaYn3QNdc50+y6s90tHPbpgtU6wfpLqmWV2mM+/1VqZd1Rj3E4N52MohZ2usOCbQ
         RE1btH6b+1XhG8WLfmo0RziSUrWIN8tKj01ow8EMeKgFb1W5sQJr4oEv8YOlTRMIFqZw
         Fkd6QhIq/JHP3QVv5F+Zi2oCydYx6wUh/xh/zJfO+7wP57Lt/ZA8pJL6Zc9mVnZ7qPFs
         D5c7SIEfLEZJf3xZceVVkbglMjZmK2nv24gBqHqTmC21HJBqrDRlspdWPd0vjeGCrO3Q
         KD+A==
X-Forwarded-Encrypted: i=1; AHgh+RodW9wCb7SgBYp2xKNWstIPE5VMcVS1lxbnkaH1eS4C66ZXoEo39LRfI8oOaA8ZN+Cjdl1g76X5MpIcSAeSebsVEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ62Hvv+Rx4WYXwrt5U9FNER9n5yvf9gTzIEUlW9m1UX+ICf0g
	3n4yUqLZx4AHGwCa7AqhUsUeA1F33Zq50dFdq4xj7xGP2866rcGZfos+
X-Gm-Gg: AR+sD12Q7/9oh90o1dqqSfDvVL525UGdYJwppGyrn/m1Ij3UF9Y0XT7czgZ58ccTMDu
	rwVkinKdNVg6Mv3cfK0YUw5R0cvIYS5uja22rYxqd1rr42Sh1uzJ8vmlVV45QPi4gpilj5T7SK+
	MdEv1bdyy+5Li9r0yFXHb/BKdedtY0dcKbN517BO0meBJHRMNR6/7SfVUBsOjBj5sSwmP3NwDFz
	kihbRcp3k0lhaI2JLDd/pB07xyR+5HSuUTDJkHP/oHPkuduLJur1N4HIeEnjfEy3R8+QOaGmjww
	eZK38rrA1iAfFbkQbzq0aLPwNnxjCm68an4Bujx37QSgseV4p9RhEadtp+XEon6kjwu+rHCpQ/s
	tW29cvr7l434cCd4dCU1vH4vh8plpixk96esDM0pSOibNwUyJ9VdZiAeUtCZxMTn7p0G+7zBCd7
	InH2ZX+H7WDdtpEJuGVelojwnmukEsCirfV26U3I0C02cjLUfq+WpGgSuXo0kxOc5nxl310iYg/
	GNJAzpneTauj5OuzILZxBFf
X-Received: by 2002:a05:6000:310f:b0:47f:776f:3845 with SMTP id ffacd0b85a97d-47fb1ec814bmr7941751f8f.7.1785329751598;
        Wed, 29 Jul 2026 05:55:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:49 -0700 (PDT)
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
Subject: [PATCH v2 16/16] arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263
Date: Wed, 29 Jul 2026 13:55:08 +0100
Message-ID: <20260729125516.230757-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8c6a44890715..3cecc40204e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -190,6 +190,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
 r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtbo
+r9a08g046l48-smarc-lvds-ite6263-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-lvds-ite6263.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-lvds-ite6263.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
new file mode 100644
index 000000000000..95e1f411fa04
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
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
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
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
+	it6263: it6263@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "vesa-24";
+		ivdd-supply = <&reg_1v8>;
+		ovdd-supply = <&reg_3v3>;
+		txavcc18-supply = <&reg_1v8>;
+		txavcc33-supply = <&reg_3v3>;
+		pvcc1-supply = <&reg_1v8>;
+		pvcc2-supply = <&reg_1v8>;
+		avcc-supply = <&reg_3v3>;
+		anvdd-supply = <&reg_1v8>;
+		apvdd-supply = <&reg_1v8>;
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

