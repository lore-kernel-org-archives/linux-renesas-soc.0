Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC9DC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6393821872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="j5ZbslkH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfAXPL6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:11:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39003 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPL6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:11:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1E5A925B769;
        Fri, 25 Jan 2019 02:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342716; bh=4mcnUUvAhGKR3MnntaA01oAco2nxFEtKi5r6Z5fVDeU=;
        h=From:To:Cc:Subject:Date:From;
        b=j5ZbslkHxf5kJks8zVpLCaXB4i/MyAIH6RdsR+JtwMQZvAL3L1xjtPmUb56zDBgsm
         8+3QD0lVJqKcrqh+YwkelJqyxiAvyEUCHVC8ih0QEsU7DPLIR98TA+WT5iQcuD/zJY
         pV0y/J5f6RzQ340TDFCDprfW8zq3C4F/wEID/AiI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 499EA940471; Thu, 24 Jan 2019 16:11:54 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v5.0
Date:   Thu, 24 Jan 2019 16:11:52 +0100
Message-Id: <cover.1548165440.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC fixes for v5.0.

This pull request is based on the previous round of
such requests, tagged as renesas-fixes-for-v5.0,
which you have already accepted.


The following changes since commit a64597227d0de5610407fcc95dc835745a53f5d0:

  soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B} (2019-01-07 14:51:51 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes2-for-v5.0

for you to fetch changes up to 05c8478abd485507c25aa565afab604af8d8fe46:

  arm64: dts: renesas: r8a77965: Enable DMA for SCIF2 (2019-01-17 14:22:23 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Fixes for v5.0

Enable DMA for SCIF2 on R-Car M3-W (r8a7796) and M3-n (r8a77965), and
(RZ/G2M) r8a774a1 SoCs.

This is was omitted from patches enabling DMA for other SCIF devices on the
same SoCs due to missing documentation.  However, it is regarded as a fix
as arguably those patches claim to add this feature.

Per-SoC patches are provided to ease backporting of this fix as the kernel
version to be fixed is different for each SoC.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a774a1: Enable DMA for SCIF2
      arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
      arm64: dts: renesas: r8a77965: Enable DMA for SCIF2

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 3 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 +++
 3 files changed, 9 insertions(+)
