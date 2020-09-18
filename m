Return-Path: <SRS0=cDZa=C3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D378C43466
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 12:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 244992311A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 12:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgIRMsS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Sep 2020 08:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIRMsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9A8C061788
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id VQo22300N4C55Sk01Qo2Y8; Fri, 18 Sep 2020 14:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-000259-Em; Fri, 18 Sep 2020 14:48:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00043s-Dg; Fri, 18 Sep 2020 14:48:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM SoC updates for v5.10
Date:   Fri, 18 Sep 2020 14:47:58 +0200
Message-Id: <20200918124800.15555-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918124800.15555-1-geert+renesas@glider.be>
References: <20200918124800.15555-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.10-tag1

for you to fetch changes up to 919c385dde9cdd4775688205e29fc53131a6b3ff:

  ARM: shmobile: rcar-gen2: Make rcar_gen2_{timer_init, reserve}() static (2020-09-10 19:01:26 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.10

  - Make two local functions static.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Make rcar_gen2_{timer_init, reserve}() static

 arch/arm/mach-shmobile/rcar-gen2.h       | 2 --
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
