Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33823 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbdCIEiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 23:38:15 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUGnXiOu5oDJ-DE+KGDZEB11P6cwnwdTPwd1HVBT4TqbA@mail.gmail.com>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897090350.16106.1978549972946371705.sendpatchset@little-apple> <CAMuHMdUGnXiOu5oDJ-DE+KGDZEB11P6cwnwdTPwd1HVBT4TqbA@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 9 Mar 2017 13:29:55 +0900
Message-ID: <CANqRtoTF3NFReV-G3nfxMzLX2tVPnA=A_oNm+=eg_dRNsD546Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/09] iommu/ipmmu-vmsa: Add optional root device feature
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

On Wed, Mar 8, 2017 at 10:47 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Wed, Mar 8, 2017 at 12:01 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Add root device handling to the IPMMU driver by allowing certain
>> DT compat strings to enable has_cache_leaf_nodes that in turn will
>> support both root devices with interrupts and leaf devices that
>> face the actual IPMMU consumer devices.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
>> --- 0011/drivers/iommu/ipmmu-vmsa.c
>> +++ work/drivers/iommu/ipmmu-vmsa.c     2017-03-08 17:56:51.770607110 +0900
>
>> @@ -216,6 +219,44 @@ static void set_archdata(struct device *
>>  #define IMUASID_ASID0_SHIFT            0
>>
>>  /* -----------------------------------------------------------------------------
>> + * Root device handling
>> + */
>> +
>> +static bool ipmmu_is_root(struct ipmmu_vmsa_device *mmu)
>> +{
>> +       if (mmu->features->has_cache_leaf_nodes)
>> +               return mmu->is_leaf ? false : true;
>
> Expressions using the ternary operator are sometimes hard to read.
> In this case, you want negation, so why not use that?
>
> return !mmu->is_leaf;
>
>> +       else
>
> I'd drop the else.

Yeah, your suggestion makes the code easier to read. Will fix.

>> +               return true; /* older IPMMU hardware treated as single root */
>> +}
>> +
>> +static struct ipmmu_vmsa_device *__ipmmu_find_root(void)
>> +{
>> +       struct ipmmu_vmsa_device *mmu;
>> +       bool found = false;
>
> struct ipmmu_vmsa_device *root = NULL;

I used to have it initialized to NULL and not use any found variable
and only return the variable. But then I ran into the error case when
devices exist on the ipmmu_devices list however none of them are root.
I returned the last one on the list regardless if they were root or
not. So I updated the code to use the found variable, and because of
that I thought I could simply drop the NULL assignment.

>> +
>> +       spin_lock(&ipmmu_devices_lock);
>> +
>> +       list_for_each_entry(mmu, &ipmmu_devices, list) {
>> +               if (ipmmu_is_root(mmu)) {
>> +                       found = true;
>
> root = mmu;
>
>> +                       break;
>> +               }
>> +       }
>> +
>> +       spin_unlock(&ipmmu_devices_lock);
>> +       return found ? mmu : NULL;
>
> return root;

I agree it makes sense to use root as variable name, will fix. Not
sure about the NULL assignment though, can you enlighten me?

Cheers,

/ magnus
