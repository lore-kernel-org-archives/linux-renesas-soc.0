Return-Path: <SRS0=6hTa=6H=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1418C55186
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Apr 2020 13:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF248208E4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Apr 2020 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587648040;
	bh=RIu67knlzcn81CWE+e8TOsZ03WGTJ5uOTwYFDx+4vrw=;
	h=Subject:From:Date:To:List-ID:From;
	b=Pn/9msAEFavwC/JjcIfRMiurCt8VaUoYfNQSOGE7lGDMfhDuQ4ufhii/bhU25rGAc
	 sPS16jn+7er5bYiHZ1MaPNbtcIE1LwlCHJSxsCByJXuD94h66h61B7CPKnpz6nSCSG
	 F9lpQCLAOQh9ekvmEYl3uj0Cr+zBtVmu7L/ulQuk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgDWNUk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Apr 2020 09:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbgDWNUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 09:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587648040;
        bh=RIu67knlzcn81CWE+e8TOsZ03WGTJ5uOTwYFDx+4vrw=;
        h=Subject:From:Date:To:From;
        b=w2dxn4z11LR3QTTyvuqFHgcRLaxvcd5h9ZwrRYh8j97DOo/bJergiaMX9X4NzqC/O
         4XltBq73lOexM1/Sw5NHK4s4ypoadlH86NBexDp7VyaWIOJMiXPeSEzKaEfbLnFFYd
         +9guBiuswmJrR3XfpJTZY9JA9xOx4iNvavyV4RlQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158764804027.10560.11551281193723298827.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 23 Apr 2020 13:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-23T13:04:30)
  Superseding: [v2] mmc: renesas_sdhi: avoid bad TAPs for Gen3 (2020-04-23T12:24:46):
    [v2,1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
    [v2,2/2] mmc: renesas_sdhi: Avoid bad TAP in HS400


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
