Return-Path: <SRS0=X99v=C5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F3EC43465
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Sep 2020 14:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 039B521531
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Sep 2020 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600610450;
	bh=kz11Ua7lF2MH8trbpcoacb1A9zLGITrZ9YDSv3KZTIw=;
	h=Subject:From:Date:To:List-ID:From;
	b=FR2WG8ltvcA62KAoLiN1JWACahbojqPVPiOJ2PRbn4gf937fS91VY8a5Nrihu/vXw
	 SLLp1LvdRqEikgVMmy9fMpg7jkNVZ0DAGETzVu2+m1Jknf7jrwd/KlcSgTz5FpetdW
	 sLkOB34nddHObmnMdAfJmiIgMloqnOM7r1ouDpd0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgITOAt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 20 Sep 2020 10:00:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgITOAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 10:00:49 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600610449;
        bh=kz11Ua7lF2MH8trbpcoacb1A9zLGITrZ9YDSv3KZTIw=;
        h=Subject:From:Date:To:From;
        b=vKlzVQfs9nbORjlBtPxZRbO/tuMFrWefZaBsiTRGbMJUZsrnITS3Hzxb6tAM3wS8q
         o1JhDQLZfb+oAANQn5mzHJSAcdoaz9YsJRxM0IQA4yYm8l5Za/SMIp/L/Dn9077a1g
         gWaQRenTp6RLnL6NlyFFONrVlCizPsMuie76/gM0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160061044932.11588.10572241166541172864.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 20 Sep 2020 14:00:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] Remodel HD3SS3220 device nodes (2020-09-20T13:48:59)
  Superseding: [v3] Remodel HD3SS3220 device nodes (2020-08-24T14:10:48):
    [v3,1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
    [v3,2/5] dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
    [v3,3/5] usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
    [v3,4/5] arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
    [v3,5/5] arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out of hd3ss3220 device


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
