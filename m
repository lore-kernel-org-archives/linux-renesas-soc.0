Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DA352003;
	Tue, 19 May 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186969; cv=none; b=U7IcKJYjczoDXu6j9QqUfKwshM4Pps+5e7UfErlvvuIBx428LxIraNWeYDtJxAG7MytYcFJspsbURmlLOHZWuTTDWL/ZfHHWwlf5tdOOQuwl3HmBLV6ZZ8HOOO29hOnWhye5so7ibFCaWKCcuwxvobPS7gZpMisx8krcwjy7eb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186969; c=relaxed/simple;
	bh=GHLGeOXfajLSwh91ObeupCCnaHKN48SnXB4fGejZD0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRtVEP0c+DE2eAgDJhA/N5dcGtR1Vv5BvXmhKKP6+shFB8q9Kw5KKVpCdyte4IKy4T3LvSystGH2PHMQhcEqWl3Sxfl3LV/KyQksjhHqNZd98ef8EkhUE/HRh898DxgYrrYj0enIW48vD6BPspLMa+us3XruDH5e0PDrlHHHijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACE4C2BCB3;
	Tue, 19 May 2026 10:36:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.2
Date: Tue, 19 May 2026 12:35:57 +0200
Message-ID: <cover.1779185457.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.2.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v7.2

    - Add Multifunctional Interface (MFIS) mailbox and product register
      support for R-Car X5H,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/2] Renesas DTS updates for v7.2

    - Add GPU support for R-Car M3-W(+)-based ULCB and Salvator-X(S)
      development boards,
    - Add Ethernet, OPP table, interrupt, pin control, and watchdog
      support for the RZ/G3L SoC and the RZ/G3L SMARC SoM board,
    - Add Coresight support for the R-Mobile A1 and APE6 SoCs, and the
      Armadillo-800 EVA and APE6EVM development boards,
    - Miscellaneous fixes and improvements.

Note that the first PR includes DT binding definitions for R-Car X5H,
which are shared by driver and DT source files.

Note that the second PR (1) is based on v7.1-rc3, as PowerVR GPU
enablement has a dependency on commit 26735dfdd8930d9e ("pmdomain: core:
Fix detach procedure for virtual devices in genpd"), and (2) includes:
  - Renesas SoC fixes for v7.1, which are already present in
    soc/for-next, but not yet in v7.1-rc4,
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - DT binding definitions for the RZ/G3L SoC, which are shared by the
    pin control subsystem and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
