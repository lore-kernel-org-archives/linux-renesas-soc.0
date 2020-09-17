Return-Path: <SRS0=E5el=C2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B74AC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 15:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF9B206B2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600357872;
	bh=SrM2M9h/JplR5gTxpDVuBYqyXCbERICSREnrU583F/g=;
	h=Subject:From:Date:To:List-ID:From;
	b=kpWjT/IgBUF6BO2EZ4k7fj4vPBJkjP773/yDBbIW6O8U3GOQwu+4zRQryPQJdY0gB
	 oJPeYpSB3j5Gr7D77J5b/xKgBc9q+OfZbeYU3e9iUpo0zWpYaS639EflDgM0mnbOuo
	 xrmjpjWqNKQuoLA9YeNFpL/wjFd7iXl0ujIhqT6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgIQPu6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 11:50:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727833AbgIQPuy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 11:50:54 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600357247;
        bh=SrM2M9h/JplR5gTxpDVuBYqyXCbERICSREnrU583F/g=;
        h=Subject:From:Date:To:From;
        b=hBK9Z4h6tv8b7WbaUTe8Y5ilqbEMjQs4WEIDo4qZ/adDF2MmlN1g7Umhy6T3dhYuW
         asICrhvUYDXW63v9DNLr21vgN5IdiuyzqLX5Mks5pPdHqU9nQXo5CNjN2A4fBx65uQ
         BQeb9uB/ws0SyjQbnuLELWVqFMxLxWFqahGAN7A4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160035724744.17034.10800446199720849886.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 15:40:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] thermal: Kconfig: Update description for RCAR_GEN3_THERMAL config (2020-09-17T15:21:41)
  Superseding: [v1] thermal: Kconfig: Update description for RCAR_GEN3_THERMAL config (2020-09-11T10:01:48):
    thermal: Kconfig: Update description for RCAR_GEN3_THERMAL config


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
