Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34461 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdFHMx7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 08:53:59 -0400
Received: by mail-lf0-f45.google.com with SMTP id v20so17652222lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jun 2017 05:53:58 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170420185132.258111787@cogentembedded.com>
 <20170424061217.GC14843@verge.net.au>
 <4937ae78-8800-1a11-547b-2269d063d45a@cogentembedded.com>
 <CAMuHMdUDO-+F_fOf4Z1ZPdZhs_MBn8J6ig-Pn4K0oMvv-EM2gw@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fdebbddc-f6d6-c340-b643-e0f6c61a4b8d@cogentembedded.com>
Date: Thu, 8 Jun 2017 15:53:55 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUDO-+F_fOf4Z1ZPdZhs_MBn8J6ig-Pn4K0oMvv-EM2gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 06/07/2017 08:52 PM, Geert Uytterhoeven wrote:

>>>>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>>>> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC
>>>> node
>>>> and then describing the pins for SCIF0 and Ether devices declared
>>>> earlier.
>>>> These patches depend on the R8A7743 PFC suport in order to work properly.
>>>
>>>
>>> Thanks. I have marked these as deferred pending acceptance of the PFC
>>> driver changes. Please repost or otherwise let me know when dependency
>>> is satisfied.
>>
>>    FYI, Linus W. has pulled the R8A774x PFC patches for 4.13:
>>
>> https://www.spinics.net/lists/linux-renesas-soc/msg14824.html
>
> But Simon has to wait for v4.13-rc1 to apply the DTS parts, to avoid
> regressions in renesas/devel.

    Indeed, now that pinctrl_bind_pins() causes really_probe() to fail!
The 1st patch in the series should be safe to apply still...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
