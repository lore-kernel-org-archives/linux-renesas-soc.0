Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CCDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE29E214DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PYgpncFW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfAJKSm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 05:18:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36404 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfAJKSm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 05:18:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 040D925B78D;
        Thu, 10 Jan 2019 21:18:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547115520; bh=Y23i0v7gKUPP3fAPAdy4Tng7j4v3/+uaD6kGZuLZxDQ=;
        h=From:To:Cc:Subject:Date:From;
        b=PYgpncFWpxQjTLw7sbBV/eNGAAtZJvpXa56ZiGZ0zIYgnV4irQNNeHa/2A5GF8VgK
         xaHglwCz7ZNuVYf7lZooMbmwA2cyf1P1kIueKnTvUDHZ49e8fLD/z54MDywkWOA9ht
         xZk4dnK5gY3FW3RXO30i2aN7i9H8+3Fdj2H0AzcI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 36B93940462; Thu, 10 Jan 2019 11:18:38 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v5.0
Date:   Thu, 10 Jan 2019 11:18:15 +0100
Message-Id: <cover.1547115367.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v5.0.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.0

for you to fetch changes up to a64597227d0de5610407fcc95dc835745a53f5d0:

  soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B} (2019-01-07 14:51:51 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v5.0

Renesas SoCs:
* Fix build regressions caused by move of Kconfig symbols

RZ/G2E (r8a774c0) SoC:
* Correct initialization order of 3DG-{A,B} in SYSC driver

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: shmobile: fix build regressions

Biju Das (1):
      soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B}

 drivers/soc/renesas/Kconfig         |  2 +-
 drivers/soc/renesas/r8a774c0-sysc.c | 23 ++++-------------------
 2 files changed, 5 insertions(+), 20 deletions(-)
