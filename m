Return-Path: <SRS0=mEDe=4O=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083E0C4BA0E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD98024688
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBZKwu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 05:52:50 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:49076 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbgBZKwu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 05:52:50 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 7Nsk220075USYZQ01NsknC; Wed, 26 Feb 2020 11:52:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uJ2-0002Ml-3E; Wed, 26 Feb 2020 11:52:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uJ2-0004n1-0U; Wed, 26 Feb 2020 11:52:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.6
Date:   Wed, 26 Feb 2020 11:52:36 +0100
Message-Id: <20200226105236.18368-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.6-tag1

for you to fetch changes up to 21b388dca138b0fc540c76b065bc83281762a9b4:

  ARM: dts: r8a7779: Remove deprecated "renesas, rcar-sata" compatible value (2020-02-24 14:04:21 +0100)

----------------------------------------------------------------
Renesas Fixes for v5.6

  - Restore R-Car M3-W support,
  - Drop deprecated compatible value to ease DT binding conversion to
    json-schema.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: defconfig: Replace ARCH_R8A7796 by ARCH_R8A77960
      ARM: dts: r8a7779: Remove deprecated "renesas, rcar-sata" compatible value

 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 arch/arm64/configs/defconfig   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
