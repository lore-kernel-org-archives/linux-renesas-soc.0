Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78980C55ABD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Nov 2020 15:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 297FD22264
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Nov 2020 15:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgKMPMh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgKMPMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 10:12:37 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C90C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2020 07:12:37 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id rrCa2300Z4C55Sk06rCaeb; Fri, 13 Nov 2020 16:12:36 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdakc-0028FL-E4; Fri, 13 Nov 2020 16:12:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdakb-00GSrk-VE; Fri, 13 Nov 2020 16:12:33 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.10
Date:   Fri, 13 Nov 2020 16:12:29 +0100
Message-Id: <20201113151229.3924165-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.10-tag1

for you to fetch changes up to 7de8bfaa095fcbc2db2952d4b561be102a41c2a6:

  arm64: dts: renesas: r8a774e1: Add missing audio_clk_b (2020-11-09 11:47:35 +0100)

----------------------------------------------------------------
Renesas fixes for v5.10

  - Add missing audio clock on RZ/G2H.

Thanks for pulling!
----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: dts: renesas: r8a774e1: Add missing audio_clk_b

 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
