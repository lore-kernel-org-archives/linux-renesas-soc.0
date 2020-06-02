Return-Path: <SRS0=JjJY=7P=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF46C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Jun 2020 20:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93FC320734
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Jun 2020 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591128041;
	bh=GxA/iZE+NFdzjpjQkLNvQ5OyEPsKHqFGrQXC605wiuA=;
	h=Subject:From:Date:To:List-ID:From;
	b=C0+x4d5H4s1BT4bEdD/Vh+a2aOBoHJucq022Txo3PQH3Ug2yXrFCnkM4EkCeu+NKD
	 6yp3uGj4SDek1RjEa6qjplkwyuvIkziQGFTEdadrSfHo+b3c8MIaZH0727tXtxPzwu
	 3y/6IKuRfk94uj6KG6uT5Xk6B1JTgqLmC+S2AXi0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgFBUAl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Jun 2020 16:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgFBUAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 16:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591128041;
        bh=GxA/iZE+NFdzjpjQkLNvQ5OyEPsKHqFGrQXC605wiuA=;
        h=Subject:From:Date:To:From;
        b=nMPhzK9map4mHTorEpLSeI4pDH46adUaTNycF3jXA/e5r8j2KAllvpl4dlz5WfMA8
         dDs4VCsr2QkHAI8hCBvzrog7GfmYmQ4E6jV8LF2ykX5RygA1vNvEbESOUvXxmMCEOR
         0FUSwfnvoHoJqQ6pWdjd9CJo4Z2fQ+Qqb/dgGr/g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159112804101.15425.7529220128788208638.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 02 Jun 2020 20:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-06-02T19:50:16)
  Superseding: [v1] media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-05-23T08:13:34):
    media: vsp1: dl: Fix NULL pointer dereference on unbind


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
