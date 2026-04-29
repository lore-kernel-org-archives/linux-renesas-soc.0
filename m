Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29623A8FF7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463465; cv=none; b=cFbQJ1MZKAdV267LoOMvz2fVRRALsSWK6wsvQv8z+k87pd1blRiAmjTSPqMWA8C6PprtHLFLCAyVIKhGUJ+GgwY4Yi1E/u5R6q6kh2E2IJotuF7Zlbz48kDEoxhgq+BHL8t3dlr+KF9ZuTLbRl9DPQPDdGPyfG0S2K2jprZOerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463465; c=relaxed/simple;
	bh=Tb8wmZ61gI+OmJBJtdJsHhw25HlvMNagXkHEhHkQ9QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R0GqXHOtmS7IB1QZn+ApkWqccmx16p4DBYNKky1Nw2WoH9D86nj5EKzU9XHBjHCPkOcoKjjT0UHnswUoGtKm3kt6XA8gRAiEJ9puFZpoi1XT3OfXkJ0p4FjjELk6n7MSTIazB/sZUl3UgzXghdIRhT7FxoegPV/REe6B6xNyASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K8yAvEqX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K8yAvEqX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22EF61A33DA;
	Wed, 29 Apr 2026 11:51:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9F59601DF;
	Wed, 29 Apr 2026 11:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D761F10728DD6;
	Wed, 29 Apr 2026 13:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=K9cyTrwGnbpvlaM7HmRvj0LaO77nlDUw9QrZtOu/MfI=;
	b=K8yAvEqXPwZQpBxD51rr0w1yO4u1Hpvw9zjL0YVYpxdXsAJeBvsCI3Xr2XaLpCRUB9axRt
	1zzAiHIjBAHQpkZzGGNaftGq6+kjjmpOggW3Sb753VqUn5AQw0WfCH/yvhQrPDpLJAX9sp
	HD8nlYiihXJECDhgeAQwIt3/BMc2h4er9UM1qeNXbrbSLL1grT6K09nrTUDlhKYkC191j8
	zlQweeBlCa3mOKFQ5pMCSscJTls5ejn73DZlG8loYT/siZh2yhpHo/K6qzTXUgbxjT9uB+
	IYpyABd98GOn0MzD0gPLUyzNS0Hc6ZTn97D6rR34mWwLwC21efJcwTsYHULZ0A==
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
Subject: [PATCH v2 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Wed, 29 Apr 2026 13:50:19 +0200
Message-ID: <20260429115054.158160-1-herve.codina@bootlin.com>
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
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rzn1.c              | 442 ++++++++++++++++++
 6 files changed, 568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.53.0

