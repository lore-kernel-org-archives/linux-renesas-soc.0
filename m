Return-Path: <SRS0=C960=2I=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A9EC43603
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 18 Dec 2019 02:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C01221835
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 18 Dec 2019 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576635637;
	bh=dMoTs6se/zRMeONhl50dXi/tym8koXET4v9YFUo++6E=;
	h=Subject:From:Date:To:List-ID:From;
	b=zelbzi3zCszseYHD1aJXpyvucRuByE/DKNzEZP1BcUiZwu5gvXOcwfp6sKmGIRCgG
	 D6fiYeX8cWAp9J6FsXmEjXZbyc3eCdDDT+REv+WAN2dAaXNMdAQtw9CqPjVwF10rWh
	 bAslJBur9x1OMiueLQYDtCRqNLDo1bq2BLkfYVAA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLRCUh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 Dec 2019 21:20:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbfLRCUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 21:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576635636;
        bh=dMoTs6se/zRMeONhl50dXi/tym8koXET4v9YFUo++6E=;
        h=Subject:From:Date:To:From;
        b=S/A8gTCJrwy6d0RgYWoWC31SqYNc+/U8LOj5+YQL0kZKIe6CTXag6/iRK/A1FJgLf
         M7xeRAOZI3faWhEUG3/TVoHYYsbUsrLay9nbvLwdGCNI9/siqpyvappBlbkMw/t4zp
         beWRQ5ljXSPqNeBz1PVyv38CXbUUqp0grDe5hiw0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157663563657.10392.3715739690910117681.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Dec 2019 02:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] SH: Convert ins[bwl]/outs[bwl] macros to inline functions (2019-12-18T02:08:35)
  Superseding: [v2] SH: Convert ins[bwl]/outs[bwl] macros to inline functions (2019-12-17T07:51:16):
    [v2] SH: Convert ins[bwl]/outs[bwl] macros to inline functions


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
