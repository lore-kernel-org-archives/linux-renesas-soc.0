Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:33487 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933485AbeCEJn2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 04:43:28 -0500
Received: by mail-wr0-f177.google.com with SMTP id v18so15856415wrv.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Mar 2018 01:43:27 -0800 (PST)
Subject: Re: [RFC][PATCH] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180226101718.5353-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdU=S2RbnzkGcyHd9iNke4tiY8D8P9XnFdSoJD5TN3oOaA@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7eab13e5-f305-4db2-3ea1-04abb489e134@gmail.com>
Date: Mon, 5 Mar 2018 08:22:52 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU=S2RbnzkGcyHd9iNke4tiY8D8P9XnFdSoJD5TN3oOaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/28/2018 09:43 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Mon, Feb 26, 2018 at 11:17 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Rather than hard-coding the quirk topology, which stopped scaling,
>> parse the information from DT. The code looks for all compatible
>> PMICs -- da9036 and da9210 -- and checks if their IRQ line is tied
>> to the same pin. If so, the code sends a matching sequence to the
>> PMIC to deassert the IRQ.
> 
> Note that not all R-Car Gen2 boards have all regulators described in DT yet.
> E.g. gose lacks da9210. So that has to be fixed first.

Argh, yes.

-- 
Best regards,
Marek Vasut
