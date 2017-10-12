Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58230 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751340AbdJLLvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 07:51:13 -0400
Date: Thu, 12 Oct 2017 13:51:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: gr-peach: Add ETHER pin group
Message-ID: <20171012115108.qx7vphaki42sb7mj@verge.net.au>
References: <1507538915-16566-1-git-send-email-jacopo+renesas@jmondi.org>
 <1507538915-16566-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdXZia=upoOF3kprnrKfv2W_yrPXf018Woir9qQRRjUyUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZia=upoOF3kprnrKfv2W_yrPXf018Woir9qQRRjUyUA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 11, 2017 at 01:50:38PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Mon, Oct 9, 2017 at 10:48 AM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add pin configuration subnode for ETHER pin group.
> 
> Thanks for the update!
> BTW, it would be good to have version numbers in the email subjects
> ("git format-patch -v2").

Nice, I did not know about the -v option.
Instead I've been using --subject all this time.

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
