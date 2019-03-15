Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AABC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98417218A5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="EhIVbzL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfCOKOn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 06:14:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfCOKOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 06:14:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9BA8425B80E;
        Fri, 15 Mar 2019 21:14:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552644880; bh=EDaTraQUe/nxV27Y0SzK6cfhk2gyoaPY4a0/02AhxkU=;
        h=From:To:Cc:Subject:Date:From;
        b=EhIVbzL7A0meyrKtFGGuRv0Yaa6tbyuuqcwrstmQ4rB7ySfXoM87KAvz1VqRBoYnX
         pDhipeEQ5R19i/nbxK7sC63C/kzHVwLX1JZ/lnCmy9ThedFVsGQ4u4RnkG2wnp1Xl4
         EV51Q8NoM/g49mjT9UpDrhCOXRuHQbFYC+Mf4hyo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6ACF89402F1; Fri, 15 Mar 2019 11:14:38 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v5.1
Date:   Fri, 15 Mar 2019 11:14:35 +0100
Message-Id: <cover.1552644639.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v5.1.

This pull request is based on
"[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v5.1",
which was taged as renesas-arm64-dt-for-v5.1 and you have already pulled.

The reason for this base is that the fix for RZ/G2E (r8a774c0) resolves a
problem introduced in ARM64 Based SoC DT Updates for v5.1.

The fix for E3 (r8a77990) resolves a problem introduced in v5.0.


The following changes since commit 3e279a1d44d73aea9ce428ae68e76bf85117031a:

  arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of SDHI3 (2019-01-23 09:45:41 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.1

for you to fetch changes up to c21cd4ae82e169b394139243684aaacf31bfcdf8:

  arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels (2019-02-25 10:37:55 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v5.1

R-Car Gen3 E3 (r8a77990) and RZ/G2E (r8a774c0) SoCs:
* Correct SCIF5 DMA channels

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels

Takeshi Kihara (1):
      arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 7 +++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)
