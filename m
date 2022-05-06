Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5991DC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 May 2022 09:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390690AbiEFJhF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 6 May 2022 05:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390730AbiEFJg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:36:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6A86A010
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by michel.telenet-ops.be with bizsmtp
        id TMYL270131UVucw06MYMkG; Fri, 06 May 2022 11:32:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJw-0038XD-GT; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJv-00AekN-SE; Fri, 06 May 2022 11:32:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas ARM SoC updates for v5.19
Date:   Fri,  6 May 2022 11:32:14 +0200
Message-Id: <cover.1651828611.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
References: <cover.1651828600.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.19-tag1

for you to fetch changes up to 7bc53f59fbcad34599c99d07d6be1ff01849d457:

  ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel (2022-05-05 12:32:40 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.19

  - Drop commas after sentinels.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: Drop commas after dt_compat sentinels
      ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 2 +-
 arch/arm/mach-shmobile/setup-emev2.c               | 2 +-
 arch/arm/mach-shmobile/setup-r7s72100.c            | 2 +-
 arch/arm/mach-shmobile/setup-r7s9210.c             | 2 +-
 arch/arm/mach-shmobile/setup-r8a73a4.c             | 2 +-
 arch/arm/mach-shmobile/setup-r8a7740.c             | 2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c             | 2 +-
 arch/arm/mach-shmobile/setup-r8a7779.c             | 2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c           | 4 ++--
 arch/arm/mach-shmobile/setup-sh73a0.c              | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
