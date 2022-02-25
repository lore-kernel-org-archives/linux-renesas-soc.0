Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0CBC4332F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbiBYKZP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Feb 2022 05:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiBYKZN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 05:25:13 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C881DDFEF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 02:24:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
        by albert.telenet-ops.be with bizsmtp
        id zNQe260040mlTBr06NQeiP; Fri, 25 Feb 2022 11:24:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNXm9-0020ky-JM; Fri, 25 Feb 2022 11:24:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNXm8-00DHXV-Nc; Fri, 25 Feb 2022 11:24:36 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v5.18 (take two)
Date:   Fri, 25 Feb 2022 11:24:32 +0100
Message-Id: <cover.1645784465.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.18.

It consists of two parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.18 (take two)

    - Document the use of the renesas-soc IRC channel,
    - Watchdog support for the R-Car S4-8, RZ/N1D, and RZ/G2LC SoCs on the
      Spider, RZN1D-DB, and RZ/G2LC SMARC EVK development boards,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/2] Renesas driver updates for v5.18 (take two)

    - RZ/G2L and RZ/V2L need PM and PM_GENERIC_DOMAINS,
    - Introduce ARCH_RZG2L family for RZ/G2L, RZ/G2LC, RZ/G2UL and RZ/V2L
      SoCs.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
