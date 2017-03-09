Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVrNMY41k2arM_sZc3cWh+Ac0anRzRLuk8B3PDi8v+i2g@mail.gmail.com>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897092335.16106.10892669490439039957.sendpatchset@little-apple> <CAMuHMdVrNMY41k2arM_sZc3cWh+Ac0anRzRLuk8B3PDi8v+i2g@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 9 Mar 2017 12:55:02 +0900
Message-ID: <CANqRtoQsf4i8URyAYP3Rv-io8WJi_tGMOPvwfbFf4NhoZnwF=g@mail.gmail.com>
Subject: Re: [PATCH v3 04/09] iommu/ipmmu-vmsa: Make use of IOMMU_OF_DECLARE()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wed, Mar 8, 2017 at 10:52 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Wed, Mar 8, 2017 at 12:02 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Hook up IOMMU_OF_DECLARE() support in case CONFIG_IOMMU_DMA
>> is enabled. The only current supported case for 32-bit ARM
>> is disabled, however for 64-bit ARM usage of OF is required.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se
>
> While I'm not such a big fan of *_OF_DECLARE() (it doesn't support deferred
> probing, which is needed for any device with dependencies, like clocks and
> power domains), what's the rationale for not using IOMMU_OF_DECLARE()
> on arm32, and thus the need for setup_done?

ARM32 could (and should) be converted over to IOMMU_OF_DECLARE(), but
it is just a matter of timing. If we try to do it before ARM32 is
converted over to CONFIG_IOMMU_DMA=y then we have to handle all the
hairy legacy implementation details of IOMMU support in case of
CONFIG_IOMMU_DMA=n _and_ deal with just moving over the init order
bits to OF. Testing and keeping all the combinations working is a lot
of work.

I prefer to kill two birds with one stone and do a larger feature jump
and move over ARM32 to same state of ARM64 (with OF init) once
CONFIG_IOMMU_DMA=y is ready for 32-bit ARM. Just changing the init
order bits to OF while keeping legacy CONFIG_IOMMU_DMA=n code is
introducing potential errors with not much upside. Unless there is
some other reason to do it that I can't see that is. =)

Cheers,

/ magnus
