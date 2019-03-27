Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=FAKE_REPLY_C,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7645C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 18:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7C6420657
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 18:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390491AbfC0SgI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 14:36:08 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:33196 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388266AbfC0SgH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 14:36:07 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3D7603C00DD;
        Wed, 27 Mar 2019 19:36:05 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QCEFbpOapV3K; Wed, 27 Mar 2019 19:35:58 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 334513C00C4;
        Wed, 27 Mar 2019 19:35:58 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.435.0; Wed, 27 Mar
 2019 19:35:57 +0100
Date:   Wed, 27 Mar 2019 19:35:55 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, <wsa@the-dreams.de>,
        <geert@linux-m68k.org>, <linux-renesas-soc@vger.kernel.org>
CC:     <linux-serial@vger.kernel.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        <magnus.damm@gmail.com>, <greg@kroah.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
Message-ID: <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Renesas Open Source team,

We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and the
latter contains this patch [2] by virtue of rcar-3.9.0 commit [3], which
mirrors v4.18-rc1 commit [4] in mainline.

JFYI, quite far away in the delivery chain, we've received below report:

> With this patch [2-4] there are reports about broken data
> communication with 115200 baud with SXM module. Reverting
> this patch results in successful communication, again.

While this scarce information barely helps anybody, I thought that
sharing it with you might be beneficial in case you collect several
reports linked to this specific commit in future, meaning it potentially
adds a regression.

Also, if you are aware of any userland changes that might be
required/assumed by this patch or in case you have any alternative
ideas how to avoid reverting this patch, your feedback would be very
appreciated.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/tag/?h=rcar-3.9.3
[2] https://patchwork.kernel.org/patch/10322809/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=e395fc813539
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63ba1e00f178

Best regards,
Eugeniu.
