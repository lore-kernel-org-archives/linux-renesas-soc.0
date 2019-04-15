Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=FAKE_REPLY_C,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC5DC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 21:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 942FC2087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 21:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfDOVVb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 17:21:31 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:49076 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbfDOVVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 17:21:31 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 070CC3C00C1;
        Mon, 15 Apr 2019 23:21:28 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RAzAevxOK1bX; Mon, 15 Apr 2019 23:21:20 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 0D6B13C00C0;
        Mon, 15 Apr 2019 23:21:20 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 15 Apr
 2019 23:21:19 +0200
Date:   Mon, 15 Apr 2019 23:21:16 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Christian Gromm <christian.gromm@microchip.com>,
        Andrey Shvetsov <andrey.shvetsov@k2l.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <driverdev-devel@linuxdriverproject.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        <external.sudipi@jp.adit-jv.com>, <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v4 12/12] staging: most: Documentation: update driver
 documentation
Message-ID: <20190415212116.GA3568@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1554297595-31767-13-git-send-email-christian.gromm@microchip.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Christian, hello Andrey,
cc: Vladimir Barinov
cc: linux-renesas-soc

Our team currently has the requirement of adding MOST support to
the v4.14-based R-Car3 kernel [1], matching the level of features
and interfaces of mld-1.8.0 [2] release.

Based on a quick check [3], the mld-1.8.0 release contains 221 non-merge
non-mainline commits. It seems like at least some (most?) of them have
been reworked during upstreaming and are now part of vanilla, thanks to
your efforts.

Since you've actively participated in pushing the out-of-tree drivers
to mainline, could you please share your gut feeling whether the
current mainline state of the MOST subsystem matches the mld-1.8.0
release in terms of features and interfaces?

At first glance, such mld-1.8.0 functionalities like "flexible PCM
rate support" [4], as well as a number of dim2 sysfs entries [5-8]
appear to be missing in v5.1-rc5. Could you please feedback if these
have been deliberately dropped or didn't make their way for another
reason? What would be your recommendation between going the mld-1.8.0
and going the v5.1-rc5 way for MOST?

Best regards,
Eugeniu.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/
[2] https://github.com/microchip-ais/linux/releases/tag/mld-1.8.0
[3] git rev-list --no-merges --count  \
    $(git merge-base linux/master mld-1.8.0)..mld-1.8.0
    221
[4] https://github.com/microchip-ais/linux/commit/8821bad23ff2
    ("staging: most: aim-sound: add flexible PCM rate support")
[5] https://github.com/microchip-ais/linux/commit/5030f77717a1d7
    ("staging: most: dim2: add sysfs property dci/node_position")
[6] https://github.com/microchip-ais/linux/commit/3a840d7b504552
    ("staging: most: dim2: add sysfs property dci/node_address")
[7] https://github.com/microchip-ais/linux/commit/0494ccb4bc5f39
    ("staging: most: dim2: add sysfs property dci/ni_state")
[8] https://github.com/microchip-ais/linux/commit/3198a5c5f0663
    ("staging: most: dim2: add sysfs property dci/mep_eui48")
