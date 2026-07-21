Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978373BCD3E;
	Tue, 21 Jul 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622620; cv=none; b=bLAlhPBsnJGnBqTrHrw16EpzFg2OiPJ2mSb836/ekW+Mig2ZZ91AOuFzD7tRII1fBKrz3x5IRTOmZ/CvHxg3+UX/0/Y105HPXv0LYFI3cNvHBGrxc9kRLXUglL9C++QqPB151GVI3GzqEGvH7otCcHK+OhQeCkNT6Ib9qlWdpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622620; c=relaxed/simple;
	bh=53cQQbHnKYTUlIp1/Oe1lnHotiqeGBENPlrWHZNDVy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VN4gafOpCLJhTh87HupWERr8xwHIpf/jlKnZIfk+IOXiMsvyYriWNoZh3CGik8ruWVXFxF0zwZWrsFN9QR4wIgG3WXBkCFDy2Ua1qoJisl7aELUpHAnYF6umWy09z7Plb9OqZp/a5KbPjfv4abGzWQ6/6EeXQB2hBR/5o8NfSYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uf3nSZ1l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uf3nSZ1l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6120B1A1131;
	Tue, 21 Jul 2026 08:30:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35F2260368;
	Tue, 21 Jul 2026 08:30:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E24F211BD0D07;
	Tue, 21 Jul 2026 10:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784622614; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m09xP2eVOvf/ABP75jSTVRTHgDA66h9ZeoreFZaMOj8=;
	b=uf3nSZ1lOWLIWV8w2YLPOdAwB8A0PgEYngh2KtN1kWNwA5/WQmsE2J1r1w0FLlB1wXkKTA
	ZIXSh3X0VwjHdKZlb2NeshGh8SdfyR16+t0Q6yTIWd9JOCpoCP4cw4PqUH+gqMi/KPnVH0
	4yNWyvxWJ9LllfQz7B0kxfEoMyeepfLZh3bFVJrUsh3eWj4EJmHrQI58AmZqmbxwbvsfqi
	SGJpTgtwyEGiCw+IVYzdtNa6XahG4PbADtAtxdbfIWEGQJ44lS+gl0yvA5/aSVsg/Wtxva
	ONdsxfs4oc/rsfZ3NnQmIqXUSUZ6RPuKKTi+MK3DEMV28fVGUZMGeMcUUMKQBA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
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
Subject: [PATCH v4 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Tue, 21 Jul 2026 10:29:50 +0200
Message-ID: <20260721082952.215691-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721082952.215691-1-herve.codina@bootlin.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..17fd5f749344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23025,6 +23025,13 @@ S:	Maintained
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
2.55.0

