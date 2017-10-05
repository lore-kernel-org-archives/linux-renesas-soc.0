Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33981 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbdJEJ0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 05:26:55 -0400
Date: Thu, 5 Oct 2017 11:26:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: gr-peach: Enable MTU2 timer pulse unit
Message-ID: <20171005092624.GW26369@verge.net.au>
References: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
 <1507193900-23801-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdV+eXxXE-oa5mQ9h0SQg+a8hMkx+SD0HVzNhKd4sBm1cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+eXxXE-oa5mQ9h0SQg+a8hMkx+SD0HVzNhKd4sBm1cA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 05, 2017 at 11:02:30AM +0200, Geert Uytterhoeven wrote:
> On Thu, Oct 5, 2017 at 10:58 AM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > MTU2 multi-function/multi-channel timer/counter is not enabled for
> > GR-Peach board. The timer is used as clock event source to schedule
> > wake-ups, and without this enabled all sleeps not performed through busy
> > waiting hang the board.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
