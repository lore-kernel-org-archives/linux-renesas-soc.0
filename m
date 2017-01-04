Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 4 Jan 2017 13:25:19 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] swiotlb: Convert swiotlb_force from int to enum
Message-ID: <20170104182519.GA30554@char.us.oracle.com>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
 <1481894922-28828-3-git-send-email-geert+renesas@glider.be>
 <20170104175716.GD31066@e104818-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170104175716.GD31066@e104818-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 04, 2017 at 05:57:17PM +0000, Catalin Marinas wrote:
> On Fri, Dec 16, 2016 at 02:28:41PM +0100, Geert Uytterhoeven wrote:
> > Convert the flag swiotlb_force from an int to an enum, to prepare for
> > the advent of more possible values.
> > 
> > Suggested-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - New.
> > ---
> >  arch/arm64/mm/dma-mapping.c    |  3 ++-
> >  arch/arm64/mm/init.c           |  3 ++-
> >  arch/x86/kernel/pci-swiotlb.c  |  2 +-
> >  arch/x86/xen/pci-swiotlb-xen.c |  2 +-
> >  drivers/xen/swiotlb-xen.c      |  4 ++--
> >  include/linux/swiotlb.h        |  7 ++++++-
> >  include/trace/events/swiotlb.h | 16 +++++++++-------
> >  lib/swiotlb.c                  |  8 ++++----
> >  8 files changed, 27 insertions(+), 18 deletions(-)
> 
> If this hasn't been queued somewhere yet, for arm64:

It is on swiotlb git tree.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
