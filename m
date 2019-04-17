Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URG_BIZ,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4619C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 16:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BE7D20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 16:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbfDQQbM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 12:31:12 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:33717 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729641AbfDQQbM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 12:31:12 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 390C63C00DD;
        Wed, 17 Apr 2019 18:31:08 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QaQmeuVOmT1p; Wed, 17 Apr 2019 18:31:00 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D4A1F3C00C0;
        Wed, 17 Apr 2019 18:31:00 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 17 Apr
 2019 18:31:00 +0200
Date:   Wed, 17 Apr 2019 18:30:57 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <Christian.Gromm@microchip.com>
CC:     <andrey.shvetsov@k2l.de>, <roscaeugeniu@gmail.com>,
        <driverdev-devel@linuxdriverproject.org>,
        <linux-renesas-soc@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <vladimir.barinov@cogentembedded.com>,
        <external.sudipi@jp.adit-jv.com>, <tfranzen@de.adit-jv.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        <George_Davis@mentor.com>, Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v4 12/12] staging: most: Documentation: update driver
 documentation
Message-ID: <20190417163057.GA12556@vmlxhi-102.adit-jv.com>
References: <20190415212116.GA3568@vmlxhi-102.adit-jv.com>
 <1555508882.2878.12.camel@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1555508882.2878.12.camel@microchip.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

We really appreciate your feedback. Thanks for that.

For us going the vanilla way roughly means backporting to v4.14:
 - v5.1-rc5 MOST state (easy/straightforward)
 - MOST patches from either
   https://github.com/CogentEmbedded/meta-rcar/
   or https://github.com/microchip-ais/meta-medialb-rcar
 - A number of patches from mld-1.8.0

From the above list, the last step looks a bit more painful, but we
will try to deal with that.

If there are any mainline-relevant fixes developed on the way, we hope
to find some time to submit them to you and get feedback.

Best regards,
Eugeniu.

On Wed, Apr 17, 2019 at 01:45:41PM +0000, Christian.Gromm@microchip.com wrote:
> On Mo, 2019-04-15 at 23:21 +0200, Eugeniu Rosca wrote:
> > External E-Mail
> > 
> > 
> > Hello Christian, hello Andrey,
> > cc: Vladimir Barinov
> > cc: linux-renesas-soc
> > 
> > Our team currently has the requirement of adding MOST support to
> > the v4.14-based R-Car3 kernel [1], matching the level of features
> > and interfaces of mld-1.8.0 [2] release.
> > 
> > Based on a quick check [3], the mld-1.8.0 release contains 221 non-
> > merge
> > non-mainline commits. It seems like at least some (most?) of them
> > have
> > been reworked during upstreaming and are now part of vanilla, thanks
> > to
> > your efforts.
> > 
> > Since you've actively participated in pushing the out-of-tree drivers
> > to mainline, could you please share your gut feeling whether the
> > current mainline state of the MOST subsystem matches the mld-1.8.0
> > release in terms of features and interfaces?
> > 
> 
> No, it doesn't. The version upstream does not have all the bells
> and whistles the mld-1.8.0 version has, yet. Focus of the latest
> mainline commits was on the driver model and the switch to configfs.
> 
> > At first glance, such mld-1.8.0 functionalities like "flexible PCM
> > rate support" [4], as well as a number of dim2 sysfs entries [5-8]
> > appear to be missing in v5.1-rc5. Could you please feedback if these
> > have been deliberately dropped or didn't make their way for another
> > reason? What would be your recommendation between going the mld-1.8.0
> > and going the v5.1-rc5 way for MOST?
> > 
> 
> The functionalities you're referring to have _not_ intentionally been
> dropped. They will find their way into mainline. If there are urgent
> feature requests, we could prioritize them.
> 
> Bottom line is, the upstream version is the one you should be using,
> as it is going to replace the mld-1.x branch. This is exactly what we
> will soon be doing for AGL by the way.
> 
> thanks,
> Chris
