Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47749 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751735AbdJIHQP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:16:15 -0400
Date: Mon, 9 Oct 2017 09:15:52 +0200
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
Subject: Re: [PATCH v2 16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
Message-ID: <20171009071551.GD17360@verge.net.au>
References: <1505398774-4852-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdVxVzhKnO=JXQpyCipfqgtrWA+rOA3jGAaC7OVpTVGyrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVxVzhKnO=JXQpyCipfqgtrWA+rOA3jGAaC7OVpTVGyrQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 20, 2017 at 03:28:37PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > This supports PCA9548 I2C switch on I2C2 bus on ULCB Kingfisher board
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
