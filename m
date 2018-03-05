Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38735 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751965AbeCEOjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 09:39:05 -0500
Received: by mail-lf0-f65.google.com with SMTP id i80so23465740lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Mar 2018 06:39:04 -0800 (PST)
Subject: Re: [PATCH v7 1/3] watchdog: renesas_wdt: Add suspend/resume support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Wim Van Sebroeck <wim@iguana.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <1519928243-28596-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1519928243-28596-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <6b8545fa-4f74-82df-76a2-8b0bbb44c67f@cogentembedded.com>
 <TY1PR06MB08952CAA1011D2DA8FCC268AC0DA0@TY1PR06MB0895.apcprd06.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <dab119aa-979b-3821-5b24-8ba11bfab61f@cogentembedded.com>
Date: Mon, 5 Mar 2018 17:39:00 +0300
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB08952CAA1011D2DA8FCC268AC0DA0@TY1PR06MB0895.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/05/2018 05:08 PM, Fabrizio Castro wrote:

>>> On R-Car Gen2 and RZ/G1 the watchdog IP clock needs to be always ON,
>>> on R-Car Gen3 we power the IP down during suspend.
>>>
>>> This commit adds suspend/resume support, so that the watchdog counting
>>> "pauses" during suspend on all of the SoCs compatible with this driver
>>> and on those we are now adding support for (R-Car Gen2 and RZ/G1).
>>
>>     Why these parens here?
> 
> it's due to the context, this patch belongs to the watchdog support series
> but it comes before the commit where we add driver support for R-Car Gen2
> and RZ/G1. Anyway, what we do works for R-Car Gen3 as well.
> 
> Would you prefer a different message?

   No -- looks like I had just misread the message.

> Thanks,
> Fab

[...]

MBR, Sergei
