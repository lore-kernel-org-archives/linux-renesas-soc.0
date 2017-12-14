Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:43238 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752777AbdLNPQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 10:16:41 -0500
Date: Thu, 14 Dec 2017 15:16:49 +0000
From: Will Deacon <will.deacon@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: arm64: unhandled level 0 translation fault
Message-ID: <20171214151649.GA4527@arm.com>
References: <CAMuHMdXh_6FaV-SFGWxcBb1-NNGYngDrYnnWA=9Y6xmRAkcxqg@mail.gmail.com>
 <CAMuHMdWH=3kRmwjDHsTzUVmB7=s5cnY16Ujfroe_B6dawGSDfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWH=3kRmwjDHsTzUVmB7=s5cnY16Ujfroe_B6dawGSDfw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Dec 14, 2017 at 03:34:50PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 12, 2017 at 11:20 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > During userspace (Debian jessie NFS root) boot on arm64:
> >
> > rpcbind[1083]: unhandled level 0 translation fault (11) at 0x00000008,
> > esr 0x92000004, in dash[aaaaadf77000+1a000]
> > CPU: 0 PID: 1083 Comm: rpcbind Not tainted
> > 4.15.0-rc3-arm64-renesas-02176-g14f9a1826e48e355 #51
> > Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
> 
> This is a quad Cortex A57.

It's so bizarre that nobody else is running into this!

> > pstate: 80000000 (Nzcv daif -PAN -UAO)
> > pc : 0xaaaaadf8a51c
> > lr : 0xaaaaadf8ac08
> > sp : 0000ffffcffeac00
> > x29: 0000ffffcffeac00 x28: 0000aaaaadfa1000
> > x27: 0000ffffcffebf7c x26: 0000ffffcffead20
> > x25: 0000aaaacea1c5f0 x24: 0000000000000000
> > x23: 0000aaaaadfa1000 x22: 0000aaaaadfa1000
> > x21: 0000000000000000 x20: 0000000000000008
> > x19: 0000000000000000 x18: 0000ffffcffeb500
> > x17: 0000ffffa22babfc x16: 0000aaaaadfa1ae8
> > x15: 0000ffffa2363588 x14: ffffffffffffffff
> > x13: 0000000000000020 x12: 0000000000000010
> > x11: 0101010101010101 x10: 0000aaaaadfa1000
> > x9 : 00000000ffffff81 x8 : 0000aaaaadfa2000
> > x7 : 0000000000000000 x6 : 0000000000000000
> > x5 : 0000aaaaadfa2338 x4 : 0000aaaaadfa2000
> > x3 : 0000aaaaadfa2338 x2 : 0000000000000000
> > x1 : 0000aaaaadfa28b0 x0 : 0000aaaaadfa4c30
> >
> > Sometimes it happens with other processes, but the main address, esr, and
> > pstate values are always the same.
> >
> > I regularly run arm64/for-next/core (through bi-weekly renesas-drivers
> > releases, so the last time was two weeks ago), but never saw the issue
> > before until today, so probably v4.15-rc1 is OK.
> > Unfortunately it doesn't happen during every boot, which makes it
> > cumbersome to bisect.
> >
> > My first guess was UNMAP_KERNEL_AT_EL0, but even after disabling that,
> > and even without today's arm64/for-next/core merged in, I still managed to
> > reproduce the issue, so I believe it was introduced in v4.15-rc2 or
> > v4.15-rc3.
> >
> > Once, when the kernel message above wasn't shown, I got an error from
> > userspace, which may be related:
> > *** Error in `/bin/sh': free(): invalid pointer: 0x0000aaaadd970988 ***
> 
> With more boots (10 instead of 6) to declare a kernel good, I bisected this
> to commit 9de52a755cfb6da5 ("arm64: fpsimd: Fix failure to restore FPSIMD
> state after signals").
> 
> Reverting that commit on top of v4.15-rc3 fixed the issue for me.

Thanks for persevering with the bisect. We'll get this fixed ASAP, but we'll
be relying on you to test the patch we come up with.

Cheers,

Will
