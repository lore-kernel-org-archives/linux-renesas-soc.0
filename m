Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 19 Dec 2016 09:31:01 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konrad Rzeszutek Wilk <konrad@darnok.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] swiotlb: Add swiotlb=noforce debug option
Message-ID: <20161219143101.GB29300@char.us.oracle.com>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
 <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
 <20161219133817.GA4358@localhost.localdomain>
 <CAMuHMdUdXiYOFxcWn-DbTTi8E7DUAGTbcnpBV2e17PQt7PzFhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdXiYOFxcWn-DbTTi8E7DUAGTbcnpBV2e17PQt7PzFhg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 19, 2016 at 02:57:00PM +0100, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Mon, Dec 19, 2016 at 2:38 PM, Konrad Rzeszutek Wilk
> <konrad@darnok.org> wrote:
> > On Fri, Dec 16, 2016 at 02:28:42PM +0100, Geert Uytterhoeven wrote:
> >> On architectures like arm64, swiotlb is tied intimately to the core
> >> architecture DMA support. In addition, ZONE_DMA cannot be disabled.
> >>
> >> To aid debugging and catch devices not supporting DMA to memory outside
> >> the 32-bit address space, add a kernel command line option
> >> "swiotlb=noforce", which disables the use of bounce buffers.
> >> If specified, trying to map memory that cannot be used with DMA will
> >> fail, and a rate-limited warning will be printed.
> >>
> >> Note that io_tlb_nslabs is set to 1, which is the minimal supported
> >> value.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > What is this based on? I can't apply it on my latest that I had
> > sent to Linus?
> 
> I rebased it on last Friday's linux-next, due to the recent move of
> kernel-parameters.txt.
> All the rest should be identical to your linux-next branch.
> 
> > Could you rebase this one please on:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-4.9
> 
> That one indeed doesn't have the move of kernel-parameters.txt.
> 
> > Or if alternatively that does not - then please rebase it on
> > b5cab0da75c292ffa0fbd68dd2c820066b2842de
> 
> However, my series already applies cleanly with git am on top of
> that commit?

Ah that does indeed work.

Which means I can't push it to Linus until rc2 at least.

Linus is sad when he sees git pulls that hadn't "soaked"
for two weeks in linux-next - and especially patches on top of
merges during the merge window.

> 
> Please let me know what to do. Thanks!

Building and testing them now.

Wish there was some travis script to do this.
