Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46327 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbeIGN45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:56:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id 203-v6so11670580ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Sep 2018 02:16:55 -0700 (PDT)
Subject: Re: [PATCH] ethernet: renesas: convert to SPDX identifiers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <875zziqdem.wl-kuninori.morimoto.gx@renesas.com>
 <d55d4d25-9966-cf34-7258-97009a9fa5ce@cogentembedded.com>
 <CAMuHMdVJ+3cX5hMntJ=YJwA48gju+PEcsh-NQmpDRMCnAVG=zw@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e31177ec-0846-8ec8-58b7-9a01e8122cad@cogentembedded.com>
Date: Fri, 7 Sep 2018 12:16:52 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJ+3cX5hMntJ=YJwA48gju+PEcsh-NQmpDRMCnAVG=zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/7/2018 12:11 PM, Geert Uytterhoeven wrote:

>> On 9/7/2018 5:02 AM, Kuninori Morimoto wrote:
>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> This patch updates license to use SPDX-License-Identifier
>>> instead of verbose license text.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>    drivers/net/ethernet/renesas/Kconfig    | 1 +
>>>    drivers/net/ethernet/renesas/Makefile   | 1 +
>>>    drivers/net/ethernet/renesas/ravb_ptp.c | 6 +-----
>>>    3 files changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
>>> index f3f7477..bb0ebdf 100644
>>> --- a/drivers/net/ethernet/renesas/Kconfig
>>> +++ b/drivers/net/ethernet/renesas/Kconfig
>>> @@ -1,3 +1,4 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>>    #
>>>    # Renesas device configuration
>>>    #
>>
>>      There was no license at all on this file...
> 
> So it's licensed under GPL-2.0.
> Cfr. e.g. commit 7328c8f48d1895b3 ("PCI: Add SPDX GPL-2.0 when no license
> was specified")

    OK, but then does the patch description match what is being done?

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
