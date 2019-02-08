Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D0C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9302A20663
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JAJjBftu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfBHLNv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46291 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLNv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E2B0925BEE7;
        Fri,  8 Feb 2019 22:13:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624429; bh=aWZA4Fk6i1vrJDTx2cEwafCACYgBrCJ8vjTGeLftXzU=;
        h=From:To:Cc:Subject:Date:From;
        b=JAJjBftul55RjxOUux2VU4vtS88izR3aZWPpJPfWgOQcf4mbB9s7HmTpXtRXQpwQQ
         f6Ngl02jx5j1Rz3SjQIDLGpWmBc75tpkg2wC6Cnbfh+nmNce3Gja+MGrq16eOut+hI
         UjiFJ9AvQfn0ySp5HG1OwRB5Wnf99/sYaVw20c3k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3D0589401DB; Fri,  8 Feb 2019 12:13:47 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.1
Date:   Fri,  8 Feb 2019 12:13:35 +0100
Message-Id: <cover.1549621233.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v5.1.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v5.1

for you to fetch changes up to 03ff9677930064a495fcce269a0f6f1db5dd9dd9:

  ARM: multi_v7_defconfig: Enable support for RZ/A2 (2019-01-25 11:03:04 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v5.1

shmobile and multi_v7 defconfig
* Enable support for recently upstreamed RZ/A2 (r7s9210) SoC
* Enable NXP pcf85363 RTC which is used on RZ/G1C (r8a77470) based iWave SBC

shmobile defconfig
* Refresh for changes present in v5.0-rc1

----------------------------------------------------------------
Biju Das (2):
      ARM: shmobile: Enable NXP pcf85363 rtc in shmobile_defconfig
      ARM: multi_v7_defconfig: Enable NXP pcf85363 rtc

Geert Uytterhoeven (3):
      ARM: shmobile: defconfig: Refresh for v5.0-rc1
      ARM: shmobile: defconfig: Enable support for RZ/A2
      ARM: multi_v7_defconfig: Enable support for RZ/A2

 arch/arm/configs/multi_v7_defconfig |  3 +++
 arch/arm/configs/shmobile_defconfig | 48 ++++++++++++++++++-------------------
 2 files changed, 27 insertions(+), 24 deletions(-)
