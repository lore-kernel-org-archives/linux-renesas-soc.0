Return-Path: <SRS0=Azr1=CC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC1FC433E1
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Aug 2020 19:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9194C20578
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Aug 2020 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598296842;
	bh=ucbPxgkrZa94be1vjg29ECZqewT3ZWtU+TJBo5iyDaw=;
	h=Subject:From:Date:To:List-ID:From;
	b=KenEyvD96/S5JtqMTt2sVQ/6bkT5sORwhthBq2LIsbPRFEY6tlSdrzAKqACczoznl
	 xwFbDpMR4Puvu1qAG3amHXikv8AW4Tz2oHHV8CW0R/KQJ0fJZk4rxmZpQLVX5nwWXT
	 D3/SWrTPC0jdAfeJ59K+0rSpvS+TY4I+bmK9OdxA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHXTUm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Aug 2020 15:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgHXTUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 15:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598296841;
        bh=ucbPxgkrZa94be1vjg29ECZqewT3ZWtU+TJBo5iyDaw=;
        h=Subject:From:Date:To:From;
        b=BO63+ojTL1vMdMOT7F9/vBm/w9hbDLeQWYIkVJPruvR+a1fs+Wh613EJ0YC3fUhwy
         UpZ6nVzwQh+PGg81420EkMAP78YAJn0jQwdhzFNsgN1zgVHUpu0ifDm7AzappMIqqy
         68q9vzOD9r0nzbjginv/W/U2rz412yCrNJ/6OkHg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159829684110.16581.15599470725484929926.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 24 Aug 2020 19:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-08-24T19:04:04)
  Superseding: [v2] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-08-03T11:39:10):
    [v2,1/3] dt-bindings: media: ov772x: Document endpoint properties
    [v2,2/3] media: i2c: ov772x: Add support for BT656 mode
    [v2,3/3] media: i2c: ov772x: Add test pattern control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
