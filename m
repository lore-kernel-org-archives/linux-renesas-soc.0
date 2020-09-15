Return-Path: <SRS0=pR6V=CY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87329C433E2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 12:42:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44EB32068D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Sep 2020 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600173735;
	bh=5q7wuNtLEFxDyjq9xFjoNOod1VAuMkmKctUQeXmKVXk=;
	h=Subject:From:Date:To:List-ID:From;
	b=M2Swe8U9efTdd29uWYaIqRgLQzQRILu09fuV13ysVPHuIvbYvzkhmHjHOJfnbWdCj
	 q0Id2KxV7V73Odysrubzo+eumwidfeLqahrjrcxXQ1QFGtF2Jt2WhfiVDptANAf2fY
	 H4tYpYog4npDqMi0UeTov/h6JYK34VUSdErFCTJ8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgIOMlT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:41:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgIOMkv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 08:40:51 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600173644;
        bh=5q7wuNtLEFxDyjq9xFjoNOod1VAuMkmKctUQeXmKVXk=;
        h=Subject:From:Date:To:From;
        b=kyGuSjUtZXvuAoxXB1mBoltEYcvtildXBXYE7xi08GC0rqr3jI2Ux4y9G1CfRI0o9
         rfvETT/mkyWXDoR2iqpg1NX7hQ9ZRSdzqz7c0ZfqpIsZizyaOesQrR+y4PKiPWR0Ac
         6sUDXntyf8q+2UQHLjxiYTtJidaCwcc0mcAun6L4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160017364399.18947.16019959079244470992.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 15 Sep 2020 12:40:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: i2c: max9286: Fix async subdev size (2020-09-15T12:39:14)
  Superseding: [v1] media: i2c: max9286: Fix async subdev size (2020-09-14T15:57:49):
    media: i2c: max9286: Fix async subdev size


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
