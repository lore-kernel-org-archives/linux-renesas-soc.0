Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E0C282E2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 924B1222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfDSSW7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:59 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfDSSW4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:56 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B751425BEE2;
        Sat, 20 Apr 2019 00:35:10 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id AED15E21AF6; Fri, 19 Apr 2019 16:35:08 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v5.2
Date:   Fri, 19 Apr 2019 16:35:07 +0200
Message-Id: <cover.1555683298.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v5.2.


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.2

for you to fetch changes up to 115bbc30c6d2d7c8eddf87f88c1b7033522d47d2:

  ARM: shmobile: fix a leaked reference by adding missing of_node_put (2019-03-18 10:32:36 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v5.2

* Power Management
  - Fix a leaked reference by adding missing of_node_put

* R-Car M2-W (R8A77910) based Porter board
  - Enable regulator quirk

----------------------------------------------------------------
Marek Vasut (1):
      ARM: shmobile: porter: enable R-Car Gen2 regulator quirk

Wen Yang (1):
      ARM: shmobile: fix a leaked reference by adding missing of_node_put

 arch/arm/mach-shmobile/pm-rcar-gen2.c              | 1 +
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
