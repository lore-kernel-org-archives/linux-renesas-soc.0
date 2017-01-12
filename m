Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35246 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbdALNrC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 08:47:02 -0500
Received: by mail-lf0-f52.google.com with SMTP id m78so13237805lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 05:47:01 -0800 (PST)
Subject: Re: [PATCH 1/2] dma-mapping: let arch know origin of dma range passed
 to arch_setup_dma_ops()
To: Arnd Bergmann <arnd@arndb.de>
References: <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <764334db-3400-58c6-cc4b-3f7ce66daa27@cogentembedded.com>
 <7d7dc402-e527-c581-0b1c-37713759db31@cogentembedded.com>
 <3013606.q8hexDUEqF@wuerfel>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com,
        linux-kernel@vger.kernel.org,
        Artemi Ivanov <artemi.ivanov@cogentembedded.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <a2e9953d-cf15-864d-a867-37786f30054b@cogentembedded.com>
Date: Thu, 12 Jan 2017 16:39:54 +0300
MIME-Version: 1.0
In-Reply-To: <3013606.q8hexDUEqF@wuerfel>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



>>>> Hmm, I think when the dma-ranges are missing, we should either enforce
>>>> a 32-bit mask, or disallow DMA completely. It's probably too late for
>>>> the latter, I wish we had done this earlier in order to force everyone
>>>> on ARM64 to have a valid dma-ranges property for any DMA master.
>>>
>>> This can be done over time.
>>>
>>> However the very idea of this version of patch is - keep working pieces
>>> as-is, thus for now setting enforce_range to false in case of no defined
>>> dma-ranges is intentional.
>>
>> What we can do is - check bus width (as it is defined in DT) and set
>> enforce_range to true if bus is 32-bit
>>
>>> What I should re-check is - does rcar dtsi set dma-ranges, and add it if
>>> it does not.
>>
>> It does not, will have to add.
>>
>> In DT bus is defined as 64-bit. But looks like physically it is 32-bit.
>> Maybe DT needs fixing.
> 
> I think we always assumed that the lack of a dma-ranges property
> implied a 32-bit width, as that is the safe fallback as well as the
> most common case.

Yes we assumed that, but that was combined with blindly accepting wider
dma_mask per driver's request.  Later is being changed.

> AFAICT, this means you are actually fine on rcar, and all other
> platforms will keep working as we enforce it, but might get slowed
> down if they relied on the unintended behavior of allowing 64-bit
> DMA.

Yesterday Robin raised issue that a change starting to enforce default
dma_mask will break existing setups - i.e. those that depend in 64bit
DMA being implicitly supported without manually declaring such support.

In reply to that, I suggested this version of patchset that should keep
existing behavior by default.

I'm fine with both approaches regarding behavior on hw that I don't have
- but I'm not in position to make any decisions on that.
