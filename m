Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F202C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 646E520989
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="p9T7qKSK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfA3KSp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:18:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39506 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfA3KSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:18:45 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6BE7225B813;
        Wed, 30 Jan 2019 21:18:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548843522; bh=TJn1ve2SUMfaw4zfPFjSaFoAzuQ/yMXdY0pUJSNP65s=;
        h=From:To:Cc:Subject:Date:From;
        b=p9T7qKSKUP60l9Rt5v2WhX8Dq8tnd0NJN96vgSGIXPYlRoAnu2/tCvMI/nRMtYlmJ
         AichbP6iTajqtztyVn0lBATIgno8iilwGk56YjRQAP5NtThtm8sa1VaxSYuG79I+P+
         BjiPQMNb1I2hBUB1c3bN89xFzQ0+x/Yk1DlIpy4A=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A7E2294043D; Wed, 30 Jan 2019 11:18:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Third Round of Renesas ARM Based SoC Fixes for v5.0
Date:   Wed, 30 Jan 2019 11:18:37 +0100
Message-Id: <cover.1548843393.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these third round of Renesas ARM based SoC fixes for v5.0.

This pull request is based on the previous round of
such requests, tagged as renesas-fixes2-for-v5.0,
which I have already sent a pull-request for.


The following changes since commit 05c8478abd485507c25aa565afab604af8d8fe46:

  arm64: dts: renesas: r8a77965: Enable DMA for SCIF2 (2019-01-17 14:22:23 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes3-for-v5.0

for you to fetch changes up to 6a6a797625b5fe855bf60c798561896e311d58ce:

  ARM: dts: r8a7743: Convert to new LVDS DT bindings (2019-01-23 10:00:15 +0100)

----------------------------------------------------------------
Third Round of Renesas ARM Based SoC Fixes for v5.0

* Convert to new LVDS DT bindings fixing a regression introduced in v4.17

----------------------------------------------------------------
Biju Das (1):
      ARM: dts: r8a7743: Convert to new LVDS DT bindings

 arch/arm/boot/dts/r8a7743.dtsi | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)
