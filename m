Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48894 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756391AbcJGNtl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 09:49:41 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: About Git Branch
Date: Fri, 07 Oct 2016 16:49:36 +0300
Message-ID: <3954256.fQG34braHX@avalon>
In-Reply-To: <SG2PR0401MB129670EE744A7854C40DD2FED8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB129670EE744A7854C40DD2FED8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Jithin,

On Friday 07 Oct 2016 09:15:09 Jithin T Raj wrote:
> hi Laurent,
>    I am sending this mail personal to you because I don't know  whether it
> is a stupid question that can be asked in to linux-renesas..

Regardless of whether the question is stupid or not, it should be sent to the 
mailing list. I've CC'ed it on this e-mail.

> I have seen your git branch  git://linuxtv.org/pinchartl/fbdev.git
> drm/du/adv7511..to make hdmi support  in koelsch..now I  am working v4.8 ..I
> have build image but I don't deployed it to koelsche. I have to check 
> whether it will  set hdmi out or not..before that i would like to ask one
> thing .can I use git://linuxtv.org/pinchartl/fbdev.git drm/du/adv7511

That branch is outdated, you shouldn't use it (I'm not even sure where you 
found it, as it doesn't exist in 
https://git.linuxtv.org/pinchartl/fbdev.git/).

Please use the mainline kernel, it should support HDMI output.

-- 
Regards,

Laurent Pinchart
