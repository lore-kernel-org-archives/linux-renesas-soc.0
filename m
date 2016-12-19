Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 19 Dec 2016 08:38:19 -0500
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] swiotlb: Add swiotlb=noforce debug option
Message-ID: <20161219133817.GA4358@localhost.localdomain>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
 <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481894922-28828-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 16, 2016 at 02:28:42PM +0100, Geert Uytterhoeven wrote:
> On architectures like arm64, swiotlb is tied intimately to the core
> architecture DMA support. In addition, ZONE_DMA cannot be disabled.
> 
> To aid debugging and catch devices not supporting DMA to memory outside
> the 32-bit address space, add a kernel command line option
> "swiotlb=noforce", which disables the use of bounce buffers.
> If specified, trying to map memory that cannot be used with DMA will
> fail, and a rate-limited warning will be printed.
> 
> Note that io_tlb_nslabs is set to 1, which is the minimal supported
> value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

What is this based on? I can't apply it on my latest that I had
sent to Linus?

Could you rebase this one please on:

git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-4.9

Thanks?

Or if alternatively that does not - then please rebase it on
b5cab0da75c292ffa0fbd68dd2c820066b2842de

Thanks!
