Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:57286 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751765AbdDRONS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 10:13:18 -0400
Date: Tue, 18 Apr 2017 15:13:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>, panand@redhat.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Geoff Levand <geoff@infradead.org>,
        Dave Young <dyoung@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        James Morse <james.morse@arm.com>,
        Mark Salter <msalter@redhat.com>, bauerman@linux.vnet.ibm.com,
        sgoel@codeaurora.org, David Woodhouse <dwmw2@infradead.org>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>, arm@kernel.org
Subject: Re: [PATCH 2/2] arm64: Fix power-of-ten vs. power-of-two prefixes in
 comments etc.
Message-ID: <20170418141312.GD27592@e104818-lin.cambridge.arm.com>
References: <20170328065130.16019-2-takahiro.akashi@linaro.org>
 <1491207492.6020.8.camel@infradead.org>
 <20170404054144.GG16309@linaro.org>
 <e275e8c8b8d81d97b6a28b860820a27c.squirrel@twosheds.infradead.org>
 <20170404073504.GI16309@linaro.org>
 <1491291844.6218.25.camel@infradead.org>
 <20170404092604.GB14898@arm.com>
 <1492085938.20068.6.camel@infradead.org>
 <20170416231223.GA31693@verge.net.au>
 <CAMuHMdXTgCEesv3imtnzs6Mcnkp22KW_rx0Jiv3_zce7bR3AVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXTgCEesv3imtnzs6Mcnkp22KW_rx0Jiv3_zce7bR3AVQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 17, 2017 at 01:54:49PM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 17, 2017 at 1:12 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Apr 13, 2017 at 01:18:58PM +0100, David Woodhouse wrote:
> >> Less important than in user-visible messages, but still good practice as
> >> there's still no excuse for ARM64 code to look like it was written before
> >> 1996.
> >>
> >> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> >
> > Hi David,
> >
> > I'd be happy to take the Renesas portions of this change if they were
> > broken out into a separate patch. The reason I would prefer a separate
> > patch is to avoid the possibility of conflicts, even trivial ones.
> 
> s/possibility/reality/, unless this series goes in before v4.12-rc1.

Maybe the arm-soc guys can take both patches on top of the other series
they pull, in which case, for both patches:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
