Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE30BC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Feb 2022 13:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241352AbiBYNaW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Feb 2022 08:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiBYNaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 08:30:21 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997B82028AF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:29:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
        by michel.telenet-ops.be with bizsmtp
        id zRVm260010mlTBr06RVmBj; Fri, 25 Feb 2022 14:29:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNafJ-00221w-Ka; Fri, 25 Feb 2022 14:29:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNafJ-00E330-2W; Fri, 25 Feb 2022 14:29:45 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.18 (take three)
Date:   Fri, 25 Feb 2022 14:29:37 +0100
Message-Id: <cover.1645795643.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

The following changes since commit 6a3b10e5c312cae4c1fc7a27bf9a030360999351:

  ARM: dts: renesas: Align GPIO hog names with dtschema (2022-02-24 13:51:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.18-tag3

for you to fetch changes up to 1ef36224ad6283cb1430cd5029470f9c53f6a915:

  arm64: dts: renesas: spider: Complete SCIF3 description (2022-02-25 14:00:39 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.18 (take three)

  - Pin control support for the R-Car S4-8 SoC on the Spider development
    board.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f0: Add pinctrl device node
      arm64: dts: renesas: spider: Complete SCIF3 description

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  6 ++++++
 2 files changed, 29 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
