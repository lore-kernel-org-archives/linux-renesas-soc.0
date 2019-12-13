Return-Path: <SRS0=ij62=2D=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C047C50700
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F95D24712
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576269688;
	bh=cLj2FQ+VUhgWA+T9dZlzNiCUPeJYUTGengOA01DbKfk=;
	h=Subject:From:Date:To:List-ID:From;
	b=Fky3SE9/zrCIVF5fBs6c0TrKKu+xzLkNIw+dN1tFepY5GZNAtpY/CvZv+q/c5eWDu
	 cgekYS6yT7aIzNOy3IET3AAXjk8aZVjO8uX7Z38KA1Cz3p3MNlBjkCGhIIBgoTKf5T
	 GY4YKoaeTJRTqxfnm4PBlW7fAUum3Omy1YtWr2UI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfLMUkl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 13 Dec 2019 15:40:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:44028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLMUkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 15:40:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576269640;
        bh=cLj2FQ+VUhgWA+T9dZlzNiCUPeJYUTGengOA01DbKfk=;
        h=Subject:From:Date:To:From;
        b=DTqkp1uKHwY+8sMRV0VSrH7rDsuPSM6APEQuZ2exG3VATP+XWCEQYox8CsXKhtGx3
         nuvKfFHOed6i4Xwmg6LMOPjXWOLsPWnLRXsNouDBhQFRpJJ7Tr3q1gGxlut4qydJBR
         /B6ncj6vliQ5zjyIh1Bsmu+qUVfaVV16yRfPnl3Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157626964000.26243.3675694973901363796.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 13 Dec 2019 20:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm: rcar-du: lvds: Get mode from state (2019-12-13T18:27:42)
  Superseding: [v1] drm: rcar-du: lvds: Get mode from state (2019-10-15T23:25:21):
    drm: rcar-du: lvds: Get mode from state


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
