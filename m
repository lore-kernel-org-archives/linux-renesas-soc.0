Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E64035B6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970794; cv=none; b=IEdQtcV5gpY5bfuA6ksXMsPueAuds89OnFQMZe75Lo/xj9yP5uJnsFxoVTPnnhHQb0+NwB8si9ZMpb/u2+BNd2RP/Hk4FV32/ynGAWFXOvdS5KNv4Y8b7DNhDZ8gfY6p2h9WzBPAm/lYxDKNXVSM8vEXSbqY0SXPspl+Pr9si9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970794; c=relaxed/simple;
	bh=QKjUHtkaQU4K2EWtKlhEyzu2l+5jMZcIgnLQHPHe9Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIv6RB838VaQBbMwfUkQX2fhoKIPoTfchFMQCs9n17MMAg6ufFMHLVNU8shpif9VadPZhqWZJYyN6RnWsEwYoKq8kGZCpyymyF3GAljP5MZCysOZlVFD+wQRhDDGlB8M1neHHRNbYwbKUklZLonvann4bOyWPFPfszcddIZfVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W2GP8v31; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W2GP8v31"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBEB4C59953;
	Tue, 31 Mar 2026 15:27:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D1426029D;
	Tue, 31 Mar 2026 15:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ACCD10450296;
	Tue, 31 Mar 2026 17:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774970790; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6BZ2FPgNjdMYR2r2ZjZBW0zoWc5glq/YcQdaotqpr5s=;
	b=W2GP8v31z4GGiGcxhfutJF1SdY0J+BIxe3FH23Rkr4HgAE4nr0pvY6q382Kr7gfe/FA/qr
	j2GB5uv0pYQEgmAU1Ipa/0YBvuJWMZpKW7muKdvjIp50U5IJ4uTlQkxXA6UKI+0+zaNNAL
	5PVWOqyTH+KYd2O00k+e7mge08A8uleUhpQZmSZ1q98NmiZLVc/ADzXaiFwX/S4X8Iuj54
	DeJ9Do6QCy2i0wSlaCf5J/G+wbXHSLpW6R095U9LtZ+aD+cvNq+4q6vh8oWF4dQ2pm40Ua
	XR8AdSewbspl4ofpQurrRQvnvvsnwYmgyFjnFrXEOd96GTt8g3GUCtGGeYGlrA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Tue, 31 Mar 2026 17:26:15 +0200
Message-ID: <20260331152616.197031-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331152616.197031-1-herve.codina@bootlin.com>
References: <20260331152616.197031-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 timers driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..5655d8b0c89e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22512,6 +22512,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
 
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.53.0

