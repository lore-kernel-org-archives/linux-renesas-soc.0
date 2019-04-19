Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32595C282E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08935222CC
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfDSSWY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:24 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfDSSWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:23 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AFE9C25B82E;
        Sat, 20 Apr 2019 00:34:21 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B5F0FE21AF6; Fri, 19 Apr 2019 16:34:19 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.2
Date:   Fri, 19 Apr 2019 16:34:18 +0200
Message-Id: <cover.1555654474.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v5.2.


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v5.2

for you to fetch changes up to b266731b76d5c33c0f6d781c449e43ad9991fb70:

  ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in shmobile_defconfig (2019-04-12 14:16:10 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v5.2

shmobile and multi_v7 defconfigs
* Enable support for CFI NOR FLASH

shmobile defconfig
* Enable USB [EO]HCI HCD PLATFORM and PHY_RCAR_GEN3_USB2
* Refresh for v5.1-rc1

----------------------------------------------------------------
Biju Das (2):
      ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
      ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in shmobile_defconfig

Geert Uytterhoeven (3):
      ARM: shmobile: defconfig: Refresh for v5.1-rc1
      ARM: shmobile: defconfig: Enable support for CFI NOR FLASH
      ARM: multi_v7_defconfig: Enable support for CFI NOR FLASH

 arch/arm/configs/multi_v7_defconfig |  4 ++++
 arch/arm/configs/shmobile_defconfig | 13 +++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)
