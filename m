Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59799 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWJfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:35:38 -0500
Date: Mon, 23 Jan 2017 10:35:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Add more register documentation
Message-ID: <20170123093532.GI31651@verge.net.au>
References: <1484917448-8320-1-git-send-email-geert+renesas@glider.be>
 <9d12d719-0866-a454-88e2-d51a695085cd@cogentembedded.com>
 <CAMuHMdWzsLANJBHzw8kcf0zEWRCJxr5w2nBzgkSutq=rNftMsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWzsLANJBHzw8kcf0zEWRCJxr5w2nBzgkSutq=rNftMsw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 23, 2017 at 10:11:20AM +0100, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Fri, Jan 20, 2017 at 5:21 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 01/20/2017 04:04 PM, Geert Uytterhoeven wrote:
> >
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 40
> >> +++++++++++++++++++++++++----------
> >>  1 file changed, 29 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c
> >> b/arch/arm/mach-shmobile/pm-rcar-gen2.c
> >> index dd9ac366868f4336..6ed9aa19c4d34766 100644
> >> --- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
> >> +++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
> >> @@ -20,14 +20,30 @@
> >
> > [...]
> >>
> >> +static inline u32 phys_to_sbar(phys_addr_t addr)
> >> +{
> >> +       return (((addr) >> 8) & 0xfffffc00);
> >
> >
> >   It's not a macro -- innermost parens not needed...
> 
> Thanks, outermost neither ;-)

Geert, I'm assuming you will respin this.
Let me know if that is not the case.
