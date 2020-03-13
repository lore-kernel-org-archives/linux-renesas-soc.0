Return-Path: <SRS0=s2bI=46=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AA9C10DCE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Mar 2020 15:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32CBD206E2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Mar 2020 15:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMPnS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Mar 2020 11:43:18 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:49562 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMPnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 11:43:18 -0400
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id DrjG2202H5USYZQ01rjGAi; Fri, 13 Mar 2020 16:43:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0002sB-Eo; Fri, 13 Mar 2020 16:43:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0000RN-C7; Fri, 13 Mar 2020 16:43:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v5.7 (take two)
Date:   Fri, 13 Mar 2020 16:43:01 +0100
Message-Id: <20200313154304.1636-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.7.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.7 (take two)

    - LCD/touchscreen support for the iwg22d-sodimm board.

  [GIT PULL 2/3] Renesas ARM64 DT updates for v5.7 (take two)

    - Thermal support for R-Car M3-W+,
    - Support for the M3ULCB board with R-Car M3-W+,
    - CPUIdle support for R-Car M3-N and E3,
    - Display support for the HiHope RZ/G2M board,
    - A minor fix.

  [GIT PULL 3/3] Renesas DT binding updates for v5.7

    - Document support for the M3ULCB board with R-Car M3-W+.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
