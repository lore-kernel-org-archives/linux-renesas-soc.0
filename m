Return-Path: <SRS0=N9RI=3M=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F8CC2D0DB
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Jan 2020 12:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 249A3217F4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Jan 2020 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579782036;
	bh=RHbKuYGlSigNjMh41rVS0fN/qouuFvEljJ14SeCrgBk=;
	h=Subject:From:Date:To:List-ID:From;
	b=WQpT/0y6cgBHaDWQllAqOF6dyj99ogSOcqf6UfFO3uRJ+wVQXY5cpAoII4laTicUv
	 7aUB3m+MR7bvskE7Tk3kDVtanN1aT0pPzIrx1LEaA9rQC9TYMdTtVDp+yiXOiKcW+y
	 q+d0BxdxF55aU5KUsVlb9SGNA6a3iCkjDcUNtMUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgAWMUg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Jan 2020 07:20:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:35070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgAWMUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 07:20:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579782035;
        bh=RHbKuYGlSigNjMh41rVS0fN/qouuFvEljJ14SeCrgBk=;
        h=Subject:From:Date:To:From;
        b=O0dgbQJxVeCf8w9J9kSnpbrwu36VdLnx9ZJ08fSU9sct4+n2SG1nv/6YTbDiqGMnt
         DMYOKwlN9wfBvMWcsTDWH8UxK8Pq1n+l474IQkfiTWrHVdxO/rp1WlmddYdibj2jvb
         SVmRgwJp740yc6DmBglfhpevnK6zQx7xS1hvlZkY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157978203540.32678.11478426371307465190.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 23 Jan 2020 12:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-23T12:07:14)
  Superseding: [v1] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-17T10:54:05):
    [1/2] dt-bindings: usb: generic-ehci: add a quirk property to avoid stuck
    [2/2] usb: host: ehci-platform: add a quirk to avoid stuck


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
