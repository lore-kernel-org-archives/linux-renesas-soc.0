Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA763A59BA;
	Mon,  1 Jun 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319905; cv=none; b=PG0/jjZ5ty3/kBBdle3lPrBVzuL+gcubc9byLMsAWrbCUQ1GynE2qoAxiZlbDQJUVKAJ/QEt6oDAlvljOhNEr+G7HBCTKKXMPbTMfLgD4S75Zow8QuqV94CORvlWUcn1J6SysMy056vr4i/k/b1BwP6VbJvOqNUefewMJKJozX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319905; c=relaxed/simple;
	bh=xtW7MHSyVQTDffqf8urdClzqjxKBnw+r+YwAvUxjf9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jg3htVA5NJ6tDg6NSSc17ciTLOBfsmOvG1cO+YixFHYQ3nO6EBcSo+iiDq+13ddOVcHvlcjolkseu7xb/YTQYThpql4mweZWE3lo4AWJBqmZHJibANpSlaT75VKoHO+xc4QXtTD8YG/g/D640AYFJCXpIQazHcBT42/c8sraLK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2914B1F00893;
	Mon,  1 Jun 2026 13:18:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:17 +0200
Message-ID: <cover.178031911driver8.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v7.2.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)

    - Identify the R-Car M3Le SoC,
    - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

  [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)

    - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
      SoCs and their EVK boards,
    - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
    - Add support for the R-Car M3Le SoC and the Geist development board,
    - Specify ethernet PHY reset timings on various R-Car boards,
    - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
    - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
      R-Car X5H SoC and Ironhide development board,
    - Add serial DMA support for the RZ/G2L SoC,
    - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
      SMARC SoM and EVK boards,
    - Miscellaneous fixes and improvements.

Note that the second PR includes DT binding definitions for R-Car X5H,
which are shared by driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
