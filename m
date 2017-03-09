Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d7db1ada-863a-ab92-7936-47d0306eaa8f@arm.com>
References: <148885660307.28553.995847796823338863.sendpatchset@little-apple>
 <148885666392.28553.6653211200015255398.sendpatchset@little-apple> <d7db1ada-863a-ab92-7936-47d0306eaa8f@arm.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 9 Mar 2017 12:44:27 +0900
Message-ID: <CANqRtoSE3nE5d9tGWwbowDkFAbXSQRBzjtBoACmR0BwQB5SK-Q@mail.gmail.com>
Subject: Re: [PATCH v7 06/07] iommu/ipmmu-vmsa: ARM and ARM64 archdata access
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Wed, Mar 8, 2017 at 9:48 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 07/03/17 03:17, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Not all architectures have an iommu member in their archdata, so
>> use #ifdefs support build with COMPILE_TEST on any architecture.
>
> I have a feeling I might be repeating myself, but ipmmu_vmsa_archdata
> looks to be trivially convertible to iommu_fwspec, which I strongly
> encourage, not least because it would obviate bodges like this.

Yeah, I think it should be possible to use iommu_fwspec for this
purpose. The question is when to do it. =)

I actually looked into it recently, but then realised that for this to
work then due to code sharing I need to make use of iommu_fwspec on
both 32-bit and 64-bit ARM. So it requires rework of the existing
IPMMU for 32-bit ARM (including hairy legacy CONFIG_IOMMU_DMA=n code).
I was actually thinking of doing some rework of 32-bit ARM IPMMU code
anyway (I suspect iommu_device_* conversion caused breakage) and it
probably has to happen on top of current -next. I would also like to
start reducing burden of forward porting all these patches, and
stirring up the ground does not really help much there...

Cheers,

/ magnus
