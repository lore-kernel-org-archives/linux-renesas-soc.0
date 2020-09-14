Return-Path: <SRS0=4bSJ=CX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE6C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Sep 2020 07:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87FFE206E9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Sep 2020 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600068048;
	bh=vgfU1IXyBc8+x9NdWcrZBRuMaWzJasHAL2Bf9jNVvb4=;
	h=Subject:From:Date:To:List-ID:From;
	b=GSQaXQGpjMb1dLGC6esZiOjm9cIT4qNapRTFUWgfWAGwqBC+gvm1B8+qy54tkNIic
	 IiDAKzHIiBYETlQchTT6Nzpu6YT5QTJFx7LtCOabw1/oAIW9IsT3CfQSXGergj+xOq
	 iFyZi9+Se2UaeU6L4w+hmUD6lt9lLW57mRhQe9/I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgINHUr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 03:20:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:50122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgINHUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 03:20:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600068046;
        bh=vgfU1IXyBc8+x9NdWcrZBRuMaWzJasHAL2Bf9jNVvb4=;
        h=Subject:From:Date:To:From;
        b=q/cO53Y0PGtXmgSgY77In4ga9hesBj4BNYgn7RISQCTmtzpAVApdR6pzpVpZEXWry
         w0sMGGOnENgrTtILS1Q8UDZvaHJfte1JZdWsEKKuclalaV1r5xxwWlIS59YY0X7s1Z
         uOAPf1Ael3Ic8VYdXs1gpii5IxtD+PgokU/X4rns=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160006804667.16733.6649954670115747521.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 14 Sep 2020 07:20:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] i2c: add slave testunit driver (2020-09-14T07:17:36)
  Superseding: [v1] i2c: add slave testunit driver (2020-09-11T07:16:57):
    [1/1] i2c: add slave testunit driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
