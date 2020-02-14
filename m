Return-Path: <SRS0=OQe3=4C=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC34EC2BA83
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Feb 2020 08:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C8D4217F4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Feb 2020 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581669637;
	bh=VeVTSVVq1j6p1cYgc5SP3Au3Kfc0JqBYRvRrugMe/2U=;
	h=Subject:From:Date:To:List-ID:From;
	b=Nadec7L8GKz/FjT+4vMtsrGWI6t3vZLbf8rNkPbkncMpLYu56nu0YA1HzT8kHj0M7
	 WvQ9yxZSMGup/JIqzAF1DAJ2tIxgD6nybDpfEah2sBBcZndNMZpfKX2xUPgmo3S36X
	 ZFzxcJMrHZy1oso9NbE7soBEgNYD//BlGs6ERWCU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgBNIkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Feb 2020 03:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:37488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgBNIkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 03:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581669636;
        bh=VeVTSVVq1j6p1cYgc5SP3Au3Kfc0JqBYRvRrugMe/2U=;
        h=Subject:From:Date:To:From;
        b=Ajh9mA8dV8J1A2/HzgfaQ3DxwyZItxN07LhQEq3YEPIOALYQMQrxaCayyrjlMBBQ/
         HLCZ09qSK4vGRl/klekzuzwGH0EIf1XmwqVNePKJ2+Da+1+ydsvBJRaDThWSz4im3x
         mLry4guK0lGhMWLs+PXPyLEhwdSzhd8aHxHXKg6g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158166963682.21515.17114819503405953087.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 14 Feb 2020 08:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] dt-bindings: display: renesas: du: Document optional reset properties (2020-02-14T08:26:23)
  Superseding: [v4] dt-bindings: display: renesas: du: Document optional reset properties (2019-10-16T15:12:15):
    [v4] dt-bindings: display: renesas: du: Document optional reset properties


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
