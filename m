Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7879407575
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970787; cv=none; b=t3kShcZS3h8ccryWKKYxkLi/GegA5iIsIFMMFay28n0RWALCWc/P45wiD+7G7pJv6gxLHf3b5F07kfeiFENPXUpz7Gsdk0713xaK6f5kPbO7ZQaqLyIioUCy8ym/ZSYE/n+7u7fq/RlZTq3dgrc4PaFU4zwAKNPluVzBWJ+MxO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970787; c=relaxed/simple;
	bh=UbTD2xpNxQh6RFVLz1w43v4B/VCICx5F8uT1Hq5d3SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3OMZfd49B++doDpVIdAXk8THFkXH2OjuIZmubn6AHCXo85+bzRiw3VmyDUot3hJsiy8VkKWtmnovga6cUuxe+EkQ0B6H5aJRHOhcONbuSpWszSnvQH9cu0jAfqr52FfFwcEyZUTI2VWZwk9ymbsNhWVUS5aGTR22k1HO5elXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zrGQqSY7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zrGQqSY7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9742C59953;
	Tue, 31 Mar 2026 15:26:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1715E6029D;
	Tue, 31 Mar 2026 15:26:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 008551045030A;
	Tue, 31 Mar 2026 17:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774970783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=41muPbnecMQF8dK5P7iqVZy69Fhn4+EvIcSFRQdlnqw=;
	b=zrGQqSY7OxiILfodHdaeHpyxlS0w340QR34fGQXFizLZlUr7tPSiXp85U16/P5kqaOthX2
	yzPqP7pSOlJZT1DomClA4n79XnnBHFFGxbVsZIWr8zRsD/n3YAyFsYst4N24XZVrYNN4rA
	6yc62htUeAeAgd2LGH8Ov619xlTq+uQdIMDzzLkE45ih2KB9kuNgdPn+K297P1UnAzK9IX
	FtwBYvCNDL85dU6XjJ/4YuKgnGLGJ3xevwBLVvkMhI+CZFngPRP08Lel9fW60fu+YXLGl8
	5z5w3RsMfkw3O6xvSWvgVpp7ZTc2bS4hW69iFUmokLrzoATiRo0G3KAG1BKAWA==
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
Subject: [PATCH 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Tue, 31 Mar 2026 17:26:11 +0200
Message-ID: <20260331152616.197031-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Renesas RZ/N1 SoCs family has two timers block controller
available.

Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
timers).

Each timer has its own interrupt, its own prescaler that can be used to
device the clock by 25 (timers block are fed with a 25 MHz clock) and
all timers can work in either one-shot or periodic mode.

This series adds support for those timers blocks.

Best regards,
Hervé

Herve Codina (Schneider Electric) (4):
  dt-bindings: timer: Add the Renesas RZ/N1 timer
  clocksource/drivers: Add support for the Renesas RZ/N1 timers
  ARM: dts: r9a06g032: Add support for timers
  MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

 .../bindings/timer/renesas,rzn1-timer.yaml    |  75 +++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      |  34 ++
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rzn1.c              | 442 ++++++++++++++++++
 6 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.53.0

