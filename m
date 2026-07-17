Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A2331A43
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282229; cv=none; b=jwxM6FGmrhhg+L/9BjgrHCTJjNUaCotdg9HLNZClzZ+2cC3MsRZPl7KYDqsJe3DX0VqhJaL5FMFk+jFa2Hgpg3DrPvza7IwerPRLSV4HNz290ruZpiCPp6gaskk1TnNXmLjBeg3UPnz7x/fvfjMqw/zz9NNJLjOHantbPkZha/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282229; c=relaxed/simple;
	bh=U6CMa3lM7Ap7B4TS5y39YAIZO59I87442jKHh4c82hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s+8b4XHywks62eMp3akeaXvVsBBe/UANORmk7l5zix2ANkzFv72VDFEpcPQGzLQP3JLVBB5Z8s54PG5wBzfnbzoktZDKHziMJiYVgxalCUMEfOlFVkivmd9D1kai0vHg4epu40dqGF6RTerDiofL+pTi+yfJLHW8utkZzG5Utik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hSyWmcc9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hSyWmcc9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D01C4E40E15;
	Fri, 17 Jul 2026 09:57:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 645C260361;
	Fri, 17 Jul 2026 09:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFDC211BD03DD;
	Fri, 17 Jul 2026 11:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784282223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ee26/0llGySjo91ifY2zVma5IW0cIkD+f0iUkfsjaBM=;
	b=hSyWmcc9aVfNH3FLMx1vHqtDGoK7fj0hr3HIxWBnbrpauu7Hyj10YmGP6zF8WLVpcfUn4F
	Dn4SwtVywuvaQnpr1D+EpSdbzIU854dFZDS7Xt7+YYsILmD8KqK55Kn8WXwUz6mZCWap/P
	c5wGwdhkUBLVC/VrE8+RRpcADM4J3ID+TH2QS4J/L4jvSGYm+PZWRBYvE5bqn8sEH+8VvE
	Dymy3DeQaf4V3Olb4nm1nqvz1bPQSN3WL/5mzGAbjMrcWpjNPZYf94cfUFkoMM/yEq9yHm
	1Jy705rR/jxikqkkP0+Re72mmrktssrdpx5rwTMpkaysDSjITb9nc/Dg2kETcA==
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
Subject: [PATCH v3 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Fri, 17 Jul 2026 11:55:45 +0200
Message-ID: <20260717095552.767475-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
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

Changes v2 -> v3
  v2: https://lore.kernel.org/all/20260429115054.158160-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1.

  Patch 1, 3 and 4:
    - Add 'Reviewed-by: Geert Uytterhoeven'

  Patch 2:
    - Fix typos in commit log.
    - Split Kconfig 'depends on' in 2 lines.
    - Fix indentation, space and alignment in code.
    - Fix dev_err_probe() conversion format.
    - Introduce rzn1_timer_setup_timers() and rzn1_timer_register_clkevt()
      to avoid code duplication in rzn1_timer_probe_{first,other}()
    - Add '.suppress_bind_attrs = true'.

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260331152616.197031-1-herve.codina@bootlin.com/

  Rebase on top of v7.1-rc1.

  Patch 1:
    - Drop minItems related to interrupts property
    - Add 'Reviewed-by: Krzysztof Kozlowski'

  Patches 2, 3 and 4:
    No changes

Herve Codina (Schneider Electric) (4):
  dt-bindings: timer: Add the Renesas RZ/N1 timer
  clocksource/drivers: Add support for the Renesas RZ/N1 timers
  ARM: dts: r9a06g032: Add support for timers
  MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

 .../bindings/timer/renesas,rzn1-timer.yaml    |  74 +++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      |  34 ++
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rzn1.c              | 455 ++++++++++++++++++
 6 files changed, 582 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.55.0

