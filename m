Return-Path: <SRS0=ISJR=Y7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A9EC43331
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Nov 2019 20:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D8A2166E
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Nov 2019 20:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573158050;
	bh=xOtvzl2oJcQXfueASU29sBzmm3kImw8gErMXrh+tHo4=;
	h=Subject:From:Date:To:List-ID:From;
	b=S+X5kQjOCEn1DUt7bHPeJp8XFW1Y2XKP5a/E6qh9K4GqJeGYy2dntGvWqSOvXhoeZ
	 h9n0Xnx5a+VdhGk9ThKUA5qMizpng5SHF3p+ZIi6fL42u7Hz8Uo+GOXEPcTiin/G+a
	 lpC/Si/9eln9HmkpqsTCC0IfjwQfT3WmW272Hdeg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfKGUUu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Nov 2019 15:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbfKGUUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:20:49 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573158049;
        bh=xOtvzl2oJcQXfueASU29sBzmm3kImw8gErMXrh+tHo4=;
        h=Subject:From:Date:To:From;
        b=J11n3xGF5JNE4rZBWzhdI6aRqlxHjiJ+7oPmY20XAfcX5MwDpmH/Ypk5Zbovp8Bit
         PX9/LAvOpK5Scph/gXKndapFoI6zD5XtTbKeA2pL2SGdno20/57SJ688VQt2pKtzWs
         oEwQzjIU4VXi2Zt1Wo8RnPJrudAdvvOSGx2FFMBI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157315804921.23440.15618578058573219731.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 07 Nov 2019 20:20:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] Add LCD panel support to iwg20d (2019-11-07T20:10:56)
  Superseding: [v2] Add LCD panel support to iwg20d (2019-11-04T16:57:59):
    [v2,1/4] drm/bridge: Repurpose lvds-encoder.c
    [v2,2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
    [v2,3/4] ARM: dts: iwg20d-q7-common: Add LCD support
    [v2,4/4] ARM: shmobile_defconfig: Enable support for panels from EDT


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
