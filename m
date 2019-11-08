Return-Path: <SRS0=gMtt=ZA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C633C5DF60
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Nov 2019 07:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EAA5214DB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Nov 2019 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573197649;
	bh=7HRDnGx7Uw5PS3Za7+4kH+6TOn6xe5xWvs+uW3fM3P4=;
	h=Subject:From:Date:To:List-ID:From;
	b=0VFo1BubuMCLEilx+Ky114C4KciT9xXphpQ3XIAsLmzW0te7CVIQ5bOeN8T/e1HPD
	 owHYIlh9CbhRCuu9/KeVze2RSIH/YwqMLWL6hGMu06VXSxA4HFsXzPfWmkHXHHo4YW
	 3QAnUYET8F6/vyGFFYMl+nA93gQvLUtFdLcVzUXc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfKHHUt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Nov 2019 02:20:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:42852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfKHHUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 02:20:49 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573197648;
        bh=7HRDnGx7Uw5PS3Za7+4kH+6TOn6xe5xWvs+uW3fM3P4=;
        h=Subject:From:Date:To:From;
        b=mkBSri+nd2WcCQuNIrEBPNZwOnQLVFiTbzk86Ht5uqag9L/Gw0DMAXzGuP5vy5RIp
         pl4PvshDbOwG0oVyjkh5V2X4UjkOHWbUBvfE2vUBkDgJL9eohD9MA2wIciq6p9RsUV
         KBbPVuBnjN/4Fo4QK9JCXRCKMq3g+3kLPl01DBGc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157319764866.13317.6573322036988637920.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 08 Nov 2019 07:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] clk: clk-gpio: propagate rate change to parent (2019-11-08T07:17:18)
  Superseding: [v2] clk: clk-gpio: propagate rate change to parent (2019-11-08T07:09:24):
    [v2] clk: clk-gpio: propagate rate change to parent


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
