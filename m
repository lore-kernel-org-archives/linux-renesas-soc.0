Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:35907 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755595AbdDFOhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Apr 2017 10:37:13 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id B49A54869CD
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Apr 2017 16:31:30 +0200 (CEST)
Date: Thu, 6 Apr 2017 16:31:20 +0200
From: jmondi <jacopo@jmondi.org>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: Add current sense
 amplifiers
Message-ID: <20170406143120.GA22962@w540>
References: <1490694282-9439-1-git-send-email-geert+renesas@glider.be>
 <20170328121633.GA20146@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170328121633.GA20146@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert, Simon,

On Tue, Mar 28, 2017 at 02:16:38PM +0200, Simon Horman wrote:
> On Tue, Mar 28, 2017 at 11:44:42AM +0200, Geert Uytterhoeven wrote:
> > Add device nodes for two Maxim max961x current sense amplifiers
> > sensing the VDD_0.8V and DVFS_0.8V lines.
> >
> > Based on a patch for r8a7796-salvator-x.dts by Jacopo Mondi.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Pending acceptance of the maxim,max9611 DT bindings.
>
> I have marked this as deferred accordingly.

Just to point out that in v5 I just sent out, bindings are different
and this patch needs an update.

Thanks
  j
