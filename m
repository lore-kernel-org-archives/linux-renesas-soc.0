Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72A0C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6811820879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:56:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fHl/uRdI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6811820879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbeLNL4z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 06:56:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33394 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNL4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 06:56:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 307B225BE78;
        Fri, 14 Dec 2018 22:56:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544788612; bh=fQCJqoC1CKU11SNYyxiX9t58NkI1+ODZ6AbMwIZ4FTM=;
        h=From:To:Cc:Subject:Date:From;
        b=fHl/uRdIdF3Uo3RNJ5Q1V+09Xg8PZZOVfMLY2hkPCTlzOHQH49gqXqEx69OFNkXTA
         2OBzSf4kTNUr+odrTZE9uBeqd6mNOyVlOKjJB1cCyKSKHwD3q8booTAunWa2R/E02O
         8WNzP/hQQnvQQpeUiE22bObBSQh5s9oC+viVUnXo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 993E79403C3; Fri, 14 Dec 2018 12:56:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL v2 0/3] Renesas ARM64 Based SoC Defconfig Updates for v4.21
Date:   Fri, 14 Dec 2018 12:56:47 +0100
Message-Id: <20181214115647.12391-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.21.

As requested I have revised the series to enablement of ASoC simple SCU
sound card support to do so as a module rather than a built-in.


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-v2-for-v4.21

for you to fetch changes up to 72c636469a3606f8aa69d9208d614f78d99f2d25:

  arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE (2018-12-13 12:24:58 +0100)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.21 (v2)

* Enable in arm64 defconfig:
  - Renesas R-Car Gen3 PCIe PHY driver
  - Renesas R-Car thermal driver
  - ASoC simple SCU sound card support

Changes in v2
* Enable ASoC simple SCU sound card support as a module rather than a built-in

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE

Simon Horman (2):
      arm64: defconfig: Enable R-Car thermal driver
      arm64: defconfig: Enable scu-simple-card driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
