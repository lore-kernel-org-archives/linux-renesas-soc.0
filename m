Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1E8C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFBF220863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XSERQEuj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfBHLOj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:39 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:39 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8AEF925BF1B;
        Fri,  8 Feb 2019 22:14:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624469; bh=t7pF3Oh5waApUVCuODmGLuPf+exKgHfsZ67h9jN6qvI=;
        h=From:To:Cc:Subject:Date:From;
        b=XSERQEujJFarMvH70gxralkeMPd89HFN9OXNMhfx4VdrUPVYr0P7/f4aaiJsnXKh9
         9+Fdy+VRfHGf+sseLRL5hswAy9NbC2FE0/g4GdoeCjEok8Qmzpa+5fKfmzKT0qv8jT
         +4McqOZgGKBl2m8U7eNKGSKcPmT5FTZlaksEMCAI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E97E29401DB; Fri,  8 Feb 2019 12:14:27 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
Date:   Fri,  8 Feb 2019 12:14:24 +0100
Message-Id: <cover.1549622472.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v5.1.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.1

for you to fetch changes up to 5347a0203709d5039a74d7c94e23519eee478094:

  ARM: shmobile: Fix R-Car Gen2 regulator quirk (2019-01-07 13:24:07 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v5.1

* Correct shared IRQ handling of R-Car Gen2 Regulator quirk
* Add missing dts files to MAINTAINERS

----------------------------------------------------------------
Marek Vasut (1):
      ARM: shmobile: Fix R-Car Gen2 regulator quirk

Simon Horman (1):
      ARM: shmobile: Add missing dts files to MAINTAINERS

 MAINTAINERS                                        | 2 ++
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 +++++
 2 files changed, 7 insertions(+)
