Return-Path: <SRS0=hqPp=TJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C8FC04AB1
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 12:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4F0721479
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 12:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfEIMGw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 May 2019 08:06:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49106 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfEIMGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 08:06:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C777925AD6F;
        Thu,  9 May 2019 22:06:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CD3E09403F2; Thu,  9 May 2019 14:06:47 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: r8a7795: Add IPA support and dynamic power coefficient
Date:   Thu,  9 May 2019 14:06:39 +0200
Message-Id: <20190509120641.20001-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

1) Setup a thermal zone driven by SoC temperature sensor.
   Create passive trip points and bind them to CPUFreq cooling
   device that supports power extension.

2) Describe dynamic power coefficient of CPUs

Changes since v2:
* Break power coefficient changes into separate patch.

Dien Pham (1):
  arm64: dts: renesas: r8a7795: Create thermal zone to support IPA

Simon Horman (1):
  arm64: dts: renesas: r8a7795: Add dynamic power coefficient

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 54 ++++++++++----------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

-- 
2.11.0

