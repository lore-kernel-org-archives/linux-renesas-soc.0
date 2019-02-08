Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A9CC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEA9C20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="aWHOhdEq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfBHLNB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46104 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfBHLNB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C9C9A25BE72;
        Fri,  8 Feb 2019 22:12:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624379; bh=Z5tMtDWgfXmx+v6S7ruUU3Oxwb8SFCFZzp23jj7rHh4=;
        h=From:To:Cc:Subject:Date:From;
        b=aWHOhdEqtOr9nlXfjprmRxH5hi8tPtSWc7vQfAxJNk/U3bnPdEK/UE1HWVcHgYfY6
         kkxJj6Mct/4MCXVdQRT6Xa5+dgV/5FMqUDx03b9a1J6BlEGg9R8kbrM+LPE1uD7myb
         vAc/T3/Q6GzqZW2U53cLK2hAYl2bOovR7UKwWJdM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1EAA99401DB; Fri,  8 Feb 2019 12:12:57 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v5.1
Date:   Fri,  8 Feb 2019 12:12:47 +0100
Message-Id: <cover.1549622798.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v5.1.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v5.1

for you to fetch changes up to b8c3667a892a2ef2a2a5f91dfc2e3e3f0225185e:

  arm64: defconfig: select Kingfisher Sound related configs (2019-01-07 14:54:31 +0100)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v5.1

Enable:
* PCM3168A support which is required for audio on Kingfisher daughterboards
* R-Car thermal support
* Gen3 PCIe PHY support

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE

Kuninori Morimoto (1):
      arm64: defconfig: select Kingfisher Sound related configs

Simon Horman (1):
      arm64: defconfig: Enable R-Car thermal driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
