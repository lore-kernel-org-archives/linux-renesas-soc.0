Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:34419 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752098AbcITPDV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 11:03:21 -0400
Received: by mail-vk0-f43.google.com with SMTP id o139so34854140vka.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Sep 2016 08:03:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3759bb9c-c482-4fae-d588-7c946ebeecae@arm.com>
References: <20160920124144.8629.22575.sendpatchset@little-apple> <3759bb9c-c482-4fae-d588-7c946ebeecae@arm.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 21 Sep 2016 00:03:15 +0900
Message-ID: <CANqRtoQ_3PNobXuSd9hxMw2uZepErLoVadXbq6G4UZXnrPiEpA@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: Update ->add_device() return value
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

Thanks for your feedback!!

On Tue, Sep 20, 2016 at 10:18 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> Hi Magnus,
>
> On 20/09/16 13:41, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Update the IPMMU driver to return -ENODEV when adding devices
>> not hooked up a particular IPMMU instance.
>>
>> Currently the ->add_device() callback implementation in the IPMMU
>> driver returns -ENODEV for devices with no "iommus" property,
>> however the function ipmmu_find_utlbs() may return -EINVAL.
>
> If there were no "iommus" property at all, of_parse_phandle_with_args()
> should return -ENOENT - that probably does want to be caught and passed
> back as -ENODEV to imply an untranslated device. On the other hand,
> -EINVAL would stem from the existence of the property, but in a somehow
> erroneous manner - other than the "args.np != mmu->dev->of_node" check
> (which could legitimately fail and be safely ignored if there are
> multiple IOMMUs in the system), any other reason implies a DT error
> which probably shouldn't be papered over.

Regarding -ENOENT to -ENODEV, I agree but I believe this case is
already handled. The ->add_device() callback seems to be using
of_count_phandle_with_args() to check for the presence of "iommus"
property before calling ipmmu_find_utlbs(). So for the case with no
"iommus" property at all it is returned as -ENODEV as you suggest.

The ->add_device() callback has the ret variable initialised to
-ENODEV by default. In case there is only one IPMMU device on the
ipmmu_device list and it matches the struct device passed to the
ipmmu_add_device() function then all is fine. However when there are
more than one IPMMU device on the ipmmu_device list then
ipmmu_find_utlbs() may return -EINVAL. Judging by the code this seems
to happen when the order of the IPMMU devices on the "iommus" property
does not match the IPMMU order on the ipmmu_device list.

Hm, I wonder if all this should be replaced with ->xlate() somehow?

Thanks,

/ magnus
