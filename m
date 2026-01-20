Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395D438FF6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913569; cv=none; b=SW+XngXdshHPRXPjyD3RpNhr1PKDoRC8TF56m9/Fu73ERDZoJL8l/bdHzes0TIJE0Fy1I8zNub3i7WWdZmEFkxpC5/oS0Kl1GwrmLmQGeXeLJ2wDtbvu08vWaGLI/1vaMfDN05Uwk6asKMrON+neRQpIUsJ6GjHgArxoJTL8VCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913569; c=relaxed/simple;
	bh=DNvCcHyX7sPj2C7SJV8w7x4hYFhROp6KSWlENSBsykQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exmXuA87NYUDME+D2+9IEsC05/9xEcNoS9cN6bYUgc/7PxTBPFI1wqiXB2ZzhdHWZtuFA2ObeXyfOyM0vlhTpnr3lbmaR/RJhuQ+9eMsAsfSAUlmzlxfv/vaNz1sg62FMUCgi68swGTEORKuUlmVTFIgqS4tY+R/wD+GKaJ2hdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc4aCsMX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc4aCsMX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b87f3c684a1so232923066b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913563; x=1769518363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/PatGsOkc/gWR4SN5iTW0uIsVTQmqps+7Qt5H3c+lw=;
        b=Dc4aCsMX3rX68isTyXrN3dNmT2TFYB8ohaOh2LSWnwVqhai3ah4XwFteWr792HK6hT
         TtEt85n3iL0XaFfHiqH22F/QZmC+Q98XyOAQWCKo4yNyE8ffMVDg4+SGheZaqAapHwIY
         nJDscf0JIivAQ8tP2h7pgM1pDnrtddxq/Kt7xSRQIAtn3KMRelQoOYoqlon0+zlyesfo
         1v3sWOHsod0TujSLJW3/kXmOjtsYvD27Q/muDGy9ci8zRPbrFD3+pcNdW27rov0YNg8W
         zc0VJFVmvuC0WgefRyOlS5cJNTQ5bx3BokcDzY9JL/y86G/qDfmhbA4SlwXQFPLixAZX
         al8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913563; x=1769518363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/PatGsOkc/gWR4SN5iTW0uIsVTQmqps+7Qt5H3c+lw=;
        b=MQlGvn9W2BtqaYa9ZAh2Qzqenc1N/Z5qpKVshjQ3MIcDRrMeo3epAmT8hMWKOtJUo2
         uy7GowUZAJ4O0b8rfVF0PfSgXCW6bIV+pX3B38EeJNsu+6go++sDRaQa2uRlbfNXtFD1
         56fECx3bS2mkkh0Lta6cl82fuGX7NbCuTuOhVeuSbnGfvJ7W4BruDo9aM6SNv4vZtnZI
         yU6jAN5HwntDUWNVL81Uu3s4SsiATqw19x0Q/grSS/EVDUBHJdy2ioamnqIZejlWTn8u
         Kv8hLBEMTmXpazl3seINlzcZnLntu+W3Hmb5twXC8+sKqv22f+R8qhDq4+0JZp3uwAMs
         TSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWge/nSmqPlQWAN9do9TNwQlG6cupQ6dneMifYGI4/6s5xBJdOefpG6/EFhvURZK5X75Bw6VZ32t4HlH4Z+uWDrkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJCQte+qMHF8Cc8h6rO5gIApaIkYaPIoZIm6XcooBpNoHNIap
	g5RZn1brMT7Dx9ULGml/9LL2ZaAvM06qqoM569ayEFnHDNpoNML1MkqQ
X-Gm-Gg: AZuq6aLQ4KZMNeraw+DJBmpRAWXrJAktVVA+Ch7jwiV3Gw1+eX7Y5GBXsP9+TBKvDjW
	Hnqifb6Okx0mJ82RgDaFUHBQIP6WlcjtDaDwWTzH9IdYKSVfkQJZwUqbQp6wtCmMI6dGdXn1cD0
	UQpCnmVwRQnarPc7BDA4a4u3PugPOEgCF+bHWqo8Ys24TnlhhBG8XyuxOYoENztbyIkq9QRq6KY
	UWcVQG6o1jU7BSoT+FJtrH7wDtfyk81F237P++YhtRdWR1EjqFA7zQugSuD22z/Z7b9/UQNctvn
	mCfDfQ4DuKgidFF91poxDUIcvLRBAbdV8KQXgavGu3jY9SlULR40rJddGwJgKq/ndpB8grEvPN5
	V86VNT4Tn+L2Q8fPgV5/WyH+4LquiTB97QxWaTnBpr0FDzE8FAfNP+O/bVWNFOYh0gDh4TwvNrB
	fhzLlZSEuuR5jbD9+9ODT9hLGFL/E0YgWxJpGe06pqzcTfGg==
X-Received: by 2002:a17:907:60ca:b0:b87:d09c:182c with SMTP id a640c23a62f3a-b8800262de1mr164787366b.21.1768913562510;
        Tue, 20 Jan 2026 04:52:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:42 -0800 (PST)
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
Subject: [PATCH 12/12] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board
Date: Tue, 20 Jan 2026 12:52:23 +0000
Message-ID: <20260120125232.349708-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.

Added placeholders to avoid compilation error with the common code in
renesas-smarc2.dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 41 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1fab1b50f20e..0153e772c231 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -179,6 +179,8 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtbo
 r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-smarc-pmod1-type-3a.dtbo
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
new file mode 100644
index 000000000000..988b1f96228f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3L SMARC EVK board
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
+#define KEY_1_GPIO		1
+#define KEY_2_GPIO		2
+#define KEY_3_GPIO		3
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "r9a08g046l48.dtsi"
+#include "rzg3l-smarc-som.dtsi"
+#include "renesas-smarc2.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
+	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
+		     "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	aliases {
+		serial3 = &scif0;
+	};
+};
+
+&keys {
+	status = "disabled";
+
+	/delete-node/ key-1;
+	/delete-node/ key-2;
+	/delete-node/ key-3;
+};
+
+&scif0 {
+	status = "okay";
+};
-- 
2.43.0

