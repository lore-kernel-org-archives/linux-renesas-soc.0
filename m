Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968DBC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5007420879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 11:57:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MKsKmtcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5007420879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbeLNL5F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 06:57:05 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33437 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNL5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 06:57:05 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 63A3025BEEE;
        Fri, 14 Dec 2018 22:57:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544788622; bh=TBWDS+aSutTRIbhPftQS3+m1K5ao0ikORLBoGeEau6c=;
        h=From:To:Cc:Subject:Date:From;
        b=MKsKmtcqCnwUpOQHD7vT+KSiByDBa5QEy+YZ4QmJD9ZK8ggl0tjpTx4Q5Yl3n+anw
         npgqHxBarBL/+p7DiUeAoMG80Ex7I4p/mnxbzsccxCnGyeZ46WmTQX+sOMb54RLJuD
         h5OlN8U5KbqQzI1LcmcNnICezoraySHHgS4X3CVw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C1B019403C3; Fri, 14 Dec 2018 12:57:00 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v4.20
Date:   Fri, 14 Dec 2018 12:56:59 +0100
Message-Id: <cover.1544705534.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC fixes for v4.20.

This pull request is based on the previous round of
such requests, tagged as renesas-fixes-for-v4.20,
which you have already accepted.


The following changes since commit eab53fdfd60a84b0cc514d4f1f5d79226c76df01:

  arm64: dts: renesas: condor: switch from EtherAVB to GEther (2018-11-05 15:08:44 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes2-for-v4.20

for you to fetch changes up to 6f61a2c8f1f6163c7e08c77c5f71df0427e4d2f6:

  arm64: dts: renesas: draak: Fix CVBS input (2018-12-13 13:47:30 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Fixes for v4.20

* R-Car D3 (r8a77995) SoC based Draak board
  - Correct CVBS input to allow probing of the VIN

----------------------------------------------------------------
Laurent Pinchart (1):
      arm64: dts: renesas: draak: Fix CVBS input

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
