Return-Path: <SRS0=699y=VN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37321C76196
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jul 2019 15:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D8862173C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jul 2019 15:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="QO3qeQWy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387908AbfGPPBV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Jul 2019 11:01:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:31238 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfGPPBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 11:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563289278;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=9MyPAKL8aOMdkgUeGxkG2hiV9y7ijQeVQyamlGPGLLY=;
        b=QO3qeQWyHJxVgBQZPDpp80BewuEM6TjAePXInpVW9mkt6awrrltsOJqPnHW2scc2os
        eBZvhFbJbx0nhS+hF3vChH+sBXWex8+7RPQq+jJy1ELxW0dkGBiMGXeYM5JIOj1S0bm5
        Msa2c25Tzcu6478Ko1vNygrerLd/wsdfFvCDgCiZXb42utGvwzepqErVPn+srxV965fu
        o7jbhwJxQfbW2ZJDnrcvBHsQKfX3qkcOVDVC7vzxrLfcuwp1z0tZsydmWDmSOfJYaLkJ
        SGJRP7ZrJPtEFf1j/+kX6xefhkQKmpE6tYzgCtrXPycwgPmU6iIjzZFNjwYPlBxVczzA
        z1XA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dYd7rJSdw="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v6GF1Cd5G
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jul 2019 17:01:12 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        yamada.masahiro@socionext.com, geert@linux-m68k.org,
        ulf.hansson@linaro.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 0/2] mmc: tmio: remove Gen2+ workaround and fix up
Date:   Tue, 16 Jul 2019 17:01:02 +0200
Message-Id: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

The second patch in this series removes a workaround that forced eMMC devices
always on and that is no longer required.

Removing it does expose a bug, however, that leads to a clock imbalance due
to the clock being enabled by both PM and the hardware driver. (See
https://www.spinics.net/lists/linux-mmc/msg54009.html for discussion.)
This bug is taken care of by the first patch.

Tested on r8a7790 (Lager), r8a7795 and r8a7796 (Salvator-X) with SD and
eMMC, before and after suspend.

CU
Uli


Ulrich Hecht (2):
  mmc: tmio: leave clock handling to PM if enabled
  mmc: tmio: remove obsolete PM workaround

 drivers/mmc/host/tmio_mmc_core.c | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

-- 
2.7.4

