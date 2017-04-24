Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42305 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166305AbdDXH6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 03:58:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 5/5] arm64: dts: r8a7795-salvator-x: Enable PWM
Date: Mon, 24 Apr 2017 10:59:30 +0300
Message-ID: <2637169.nvyUM18Pqy@avalon>
In-Reply-To: <20170424074901.GB2047@verge.net.au>
References: <1492608293-12435-1-git-send-email-ulrich.hecht+renesas@gmail.com> <CAO3366zJmCvNLkW4SjG2VbZjBPq8jxGq5fyBY7iMbp+mHhsg3Q@mail.gmail.com> <20170424074901.GB2047@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Monday 24 Apr 2017 09:49:01 Simon Horman wrote:
> On Fri, Apr 21, 2017 at 09:26:04AM +0200, Ulrich Hecht wrote:
> > On Thu, Apr 20, 2017 at 7:51 PM, Geert Uytterhoeven wrote:
> > > And we already have a correct v3 from you in patchwork:
> > > https://patchwork.kernel.org/patch/8711801/
> > 
> > Whoops...
> > 
> > In my defense, that was over a year ago. Simon, any reason this didn't
> > make it in?
> 
> Given it was over a year ago I hope you can understand that I don't recall
> why this wasn't accepted. It is entirely possible that it was an oversight
> on my part in which case I apologise - I am not a machine and I make
> mistakes.
> 
> I see that patches 3/5 and 4/5 also need updating.
> Could you repost them along with this patch with the review comments
> addressed? I will try not to let them slip through the cracks again.

How about using pwm1 for backlight as done in "[PATCH v2 09/13] arm64: dts: 
r8a7795: salvator-x: Add panel backlight support" ?

-- 
Regards,

Laurent Pinchart
