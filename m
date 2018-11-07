Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57616 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbeKGU5L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:57:11 -0500
Date: Wed, 7 Nov 2018 12:27:10 +0100
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
Message-ID: <20181107112710.4gyeirduvfoh7ezp@verge.net.au>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
 <20181107104134.j2agucwh6kxhrknl@verge.net.au>
 <20181107105949.GC24024@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107105949.GC24024@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 07, 2018 at 11:59:49AM +0100, jacopo mondi wrote:
> Hi Simon,
> 
> On Wed, Nov 07, 2018 at 11:41:34AM +0100, Simon Horman wrote:
> > On Tue, Nov 06, 2018 at 11:35:31AM +0100, Jacopo Mondi wrote:
> > > Versioned VIN groups can appear on different sets of pins. Using the
> > > VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
> > > an optional 'version' argument.
> > >
> > > Use the 'version' argument for said macro to fix naming of versioned
> > > groups for R-Car SoCs that defines them.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> 
> I'm going to split this patch for each SoC to ease backporting, as
> Geert suggested. Provided the single patches content is the same as
> here, can I retain your R-b tag?

Yes, sure.
