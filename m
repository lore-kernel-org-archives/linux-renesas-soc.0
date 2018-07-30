Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37128 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbeG3MyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 08:54:16 -0400
Received: by mail-wm0-f65.google.com with SMTP id n11-v6so13301383wmc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 04:19:45 -0700 (PDT)
Subject: Re: [PATCH V5] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180611121513.9673-1-marek.vasut+renesas@gmail.com>
 <20180613110647.ygg66nu36pcf6kpn@verge.net.au>
 <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a12bfba7-a7ff-413e-799c-f10e8dac78f5@gmail.com>
Date: Mon, 30 Jul 2018 13:19:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUsBNU-1y+_UfX6GKSC11pOB_BUhPKO-axUiO+BfgqVmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/13/2018 01:21 PM, Geert Uytterhoeven wrote:
> Hi Simon,

Hi,

> On Wed, Jun 13, 2018 at 1:06 PM Simon Horman <horms@verge.net.au> wrote:
>> On Mon, Jun 11, 2018 at 02:15:13PM +0200, Marek Vasut wrote:
>>> Rather than hard-coding the quirk topology, which stopped scaling,
>>> parse the information from DT. The code looks for all compatible
>>> PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
>>> to the same pin. If so, the code sends a matching sequence to the
>>> PMIC to deassert the IRQ.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Cc: Simon Horman <horms+renesas@verge.net.au>
>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
>>
>> This looks fine to me but I will wait to see if there are other reviews
>> before applying.
>>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Note that applying it now will break gose, as its DTS doesn't describe all
> regulators yet.

https://patchwork.kernel.org/patch/10548919/ should fix this.
https://patchwork.kernel.org/patch/10548923/ for Silk.

-- 
Best regards,
Marek Vasut
