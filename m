Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47729 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbdJIHPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:15:55 -0400
Date: Mon, 9 Oct 2017 09:15:36 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 18/18] arm64: dts: ulcb-kf: hog USB3 hub control gpios
Message-ID: <20171009071535.GB17360@verge.net.au>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737444-23544-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdUqvdQZXrsf_p0rTUfKicvWBNPjk+Dt-ke_tSwmU1O=7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqvdQZXrsf_p0rTUfKicvWBNPjk+Dt-ke_tSwmU1O=7A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 20, 2017 at 03:50:15PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 7, 2017 at 12:37 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > This adds gpio hogs for USB3 hub on ULCB Kingfisher board to power up and
> > remove from reset the hub
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied. There was some fuzz when doing so. Please check that what
I have applied is correct after I have pushed the next branch of the
renesas tree later today.
