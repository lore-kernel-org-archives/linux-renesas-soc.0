Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXu=0L9GOB+4DWvSTnXZEeyw551JiJ0uro9eECDx4fX-Q@mail.gmail.com>
References: <149752254550.21887.15183665699230243235.sendpatchset@little-apple>
 <149752258917.21887.4347773581840409774.sendpatchset@little-apple> <CAMuHMdXu=0L9GOB+4DWvSTnXZEeyw551JiJ0uro9eECDx4fX-Q@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 16 Jun 2017 19:10:09 +0900
Message-ID: <CANqRtoRCewNxhf+BbBDQ1Skp_81xQ48p6ckTgFf+jnckyD6+Cw@mail.gmail.com>
Subject: Re: [PATCH 04/04] iommu/ipmmu-vmsa: Replace local utlb code with
 fwspec ids
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sricharan R <sricharan@codeaurora.org>,
        Will Deacon <will.deacon@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Jun 16, 2017 at 4:18 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Jun 15, 2017 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> Now when both 32-bit and 64-bit code inside the driver is using
>> fwspec it is possible to replace the utlb handling with fwspec ids
>> that get populated from ->of_xlate().
>
> Thanks for your patch!

Thanks for the feedback!

>> --- 0013/drivers/iommu/ipmmu-vmsa.c
>> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-06-15 18:32:27.580607110 +0900
>
>>  static int ipmmu_of_xlate(struct device *dev,
>>                           struct of_phandle_args *spec)
>>  {
>> -       return ipmmu_init_platform_device(dev);
>> +       iommu_fwspec_add_ids(dev, spec->args, 1);
>
> Does it hurt if iommu_fwspec_add_ids() is called multiple times, as this is
> done before the "Initialize once - xlate() will call multiple times" check?

The function needs to be called several times to populate the ids, so
that the "initialize once" check happens later is intentional and
correct. Perhaps a bit unclear though...

>> +
>> +       return ipmmu_init_platform_device(dev, spec);
>>  }

Cheers,

/ magnus
