Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20161031175252.GA6952@char.us.oracle.com>
References: <1477928704-10611-1-git-send-email-geert+renesas@glider.be>
 <1477928704-10611-3-git-send-email-geert+renesas@glider.be> <20161031175252.GA6952@char.us.oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 19:57:11 +0100
Message-ID: <CAMuHMdXFCVP2L-1jdzxbA6JD2Pm4accCyc57fFXt=g7VgAv53Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] swiotlb: Add swiotlb=nobounce debug option
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Corbet <corbet@lwn.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Konrad,

On Mon, Oct 31, 2016 at 6:52 PM, Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
> On Mon, Oct 31, 2016 at 04:45:04PM +0100, Geert Uytterhoeven wrote:
>> On architectures like arm64, swiotlb is tied intimately to the core
>> architecture DMA support. In addition, ZONE_DMA cannot be disabled.
>>
>> To aid debugging and catch devices not supporting DMA to memory outside
>> the 32-bit address space, add a kernel command line option
>> "swiotlb=nobounce", which disables the use of bounce buffers.
>> If specified, trying to map memory that cannot be used with DMA will
>> fail, and a warning will be printed (rate-limited).
>
> I would make the 'swiotlb_force' an enum. And then instead of this
> being 'nobounce' just do the inverse of 'force', that is the
> 'noforce' would trigger this no bounce effect.
>
> So:
>
> enum {
>         NORMAL,         /* Default - depending on the hardware DMA mask and such. */
>         FORCE,          /* swiotlb=force */
>         NO_FORCE,       /* swiotlb=noforce */

Fine for me, but swiotlb_force is exported to platform code. Hence all users
should be updated?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
