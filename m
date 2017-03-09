Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36143 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbdCIEVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 23:21:14 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVQgdZyn0YGYCWEwnhvkxKMGG_T0vDL5ir=vC-pvLOY6A@mail.gmail.com>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897097336.16106.17118406255063350893.sendpatchset@little-apple> <CAMuHMdVQgdZyn0YGYCWEwnhvkxKMGG_T0vDL5ir=vC-pvLOY6A@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 9 Mar 2017 13:20:56 +0900
Message-ID: <CANqRtoQ0uBVPxSLkDu35Hw-YcL+=0QdAw7JzWpg6p2ya5vZRoA@mail.gmail.com>
Subject: Re: [PATCH v3 09/09] iommu/ipmmu-vmsa: Hook up r8a7795 DT matching code
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
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wed, Mar 8, 2017 at 10:58 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Wed, Mar 8, 2017 at 12:02 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Tie in r8a7795 features and update the IOMMU_OF_DECLARE
>> compat string to include the updated compat string.
>>
>> TODO:
>>  - Consider making use of iommu_fwspec_add_ids() for uTLB handling
>>      Needed to coexist with non-OF R-Car Gen2 somehow...
>>  - Break out stuff useful for R-Car Gen2 from this series
>>      Fix up the Gen2 IPMMU support code
>>        and/or
>>      Fold more stuff into the multi-arch series
>>  - Add support for sysfs and iommu_device_link()/unlink()
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
>> --- 0018/drivers/iommu/ipmmu-vmsa.c
>> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-03-08 19:11:53.600607110 +0900
>
>> @@ -1043,6 +1048,17 @@ static struct iommu_group *ipmmu_find_gr
>>         return group;
>>  }
>>
>> +static bool ipmmu_slave_whitelist(struct device *dev)
>> +{
>> +       /* By default, do not allow use of IPMMU */
>> +       return false;
>> +}
>> +
>> +static const struct soc_device_attribute soc_r8a7795[] = {
>> +       { .soc_id = "r8a7795", },
>
> If/when the whitelist is/becomes device/revision specific, you probably want
> to store a  pointer to the *_slave_whitelist() function in the .data member?

Yeah, for sure. It is a bit early to tell exactly how the code will
look like at this point, but I think it will become more clear in the
future. Just want to send out a new version of r8a7796 IPMMU support
and some r8a7795 DT integration to get a coherent working set of patch
series out of the door first.

>> +       { /* sentinel */ }
>> +};
>> +
>>  static int ipmmu_of_xlate_dma(struct device *dev,
>>                               struct of_phandle_args *spec)
>>  {
>> @@ -1053,6 +1069,18 @@ static int ipmmu_of_xlate_dma(struct dev
>>         if (!of_device_is_available(spec->np))
>>                 return -ENODEV;
>>
>> +       /* Failing in ->attach_device() results in a hang, so make
>> +        * sure the root device is installed before going there
>> +        */
>> +       if (!__ipmmu_find_root()) {
>> +               dev_info(dev, "Unable to locate IPMMU root device\n");
>
> dev_err?

Good idea. Will fix.

>> +               return -ENODEV;
>> +       }
>> +
>> +       /* For R-Car Gen3 use a white list to opt-in slave devices */
>> +       if (soc_device_match(soc_r8a7795) && !ipmmu_slave_whitelist(dev))
>> +               return -ENODEV;

This will have to be updated for r8a7796 somehow as well.

Thanks for your help!

Cheers,

/ magnus
