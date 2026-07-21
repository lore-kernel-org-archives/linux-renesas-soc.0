Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B03B5318;
	Tue, 21 Jul 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622612; cv=none; b=j+4XYn+2ahBlTGiqJ1RN3ZM8ZfgzUouw5dBDoAk85EFrAv9bvMVQdVoL/WyprIxq4lBW3QMtqHywbib62YQ9MX2YRZ9j9MuwQkAGMUXhmECsxfmYwT/uLcJ+aepDzYvIZNVSxxfn1derZbFggEMDYaiYmPmNtE9cU2P7ryBwKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622612; c=relaxed/simple;
	bh=DxNIKm8bLWAW8LKD1H0iz+gpSp6UFtaOuDodGegDPR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n8zOikQDJ2bzDu2wIkI9K0LCQApr6bDZeRU9BZzDPuqxwCiCgAncNyoToRyxerQqz2CARk/IzjZzmr+Ve+7BqKN+xpW6SWKNZJJksBS6UCFCVhtdb3vemEPydaTyOFIzi++iw8mhpBWqHfCVnNYi11GeugO8DTyFrBpLmyf3WFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uDmgPIa3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uDmgPIa3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7957E4E40E98;
	Tue, 21 Jul 2026 08:30:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C31860368;
	Tue, 21 Jul 2026 08:30:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F47A11BD1290;
	Tue, 21 Jul 2026 10:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784622605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XRzxxs//+IBSkR9M7GepoCQ0geVUsXiXtarl9/rGVAk=;
	b=uDmgPIa3i7K+ctjpdZdVUXWH5uPmIeaIBjU5VSm+E9E7xxWTOpNaavqAQWO6I4+EQ3+vnU
	CXLymmEgJt0hRuBxr/Rs//WLruud4IEye0QQ1lZxvQztuejXlVPk80AOS2TUeMT3tjeg7z
	mhfRHYiHxvEARsyaE/AAu3vYX4g/vAamirxhjv4z5MIIQSOdpNcqDQrqDDBV+ezREuWmWZ
	Ia2Z2y/EWn7FkVQV9Gj6lcGA1tDFQFRVoLQ+fqvOixvNgFK/netKzsoEq7ERBEA301kExH
	itfhXFnWmOCh+pWpKlSNa0SaQq8vYsikmmLvzhSFzrVujHBhOr+CbDA1Z0K46A==
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
Subject: [PATCH v4 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Tue, 21 Jul 2026 10:29:46 +0200
Message-ID: <20260721082952.215691-1-herve.codina@bootlin.com>
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

Changes v3 -> v4
  v3: https://lore.kernel.org/all/20260717095552.767475-1-herve.codina@bootlin.com/

  Patches 1, 3 and 4:
   No changes.

  Patch 2:
   Took into account Shashiko's feedback
    - Remove CLOCK_SOURCE_SUSPEND_NONSTOP flag
    - Fix CPU ids checks against number of 32-bit timers (avoid
      out-of-bound accesses)
    - Enable IRQ in CPU hotpluig startup function
    - Add CPU hotplug teardown function and disable IRQ in this
      function.
    - Adapt probe() to avoid IRQ handled by CPU hotplug startup/teardown
      been enabled by default.

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
 drivers/clocksource/timer-rzn1.c              | 487 ++++++++++++++++++
 6 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.55.0

