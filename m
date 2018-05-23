Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:43366 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932696AbeEWLyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 07:54:14 -0400
Received: by mail-wr0-f196.google.com with SMTP id r13-v6so13614287wrj.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 May 2018 04:54:13 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180523114340.10216-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVCPEChhbHsc1Tcp-zkBY5v8Mz+8qq-v3GVFifL_uLyeA@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cfd4d292-b80a-d8c1-028c-93e3337aef2a@gmail.com>
Date: Wed, 23 May 2018 13:54:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVCPEChhbHsc1Tcp-zkBY5v8Mz+8qq-v3GVFifL_uLyeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/23/2018 01:52 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Wed, May 23, 2018 at 1:43 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add PMIC nodes to Porter and connect CPU DVFS supply. There is
>> one DA9063L and one DA9210 on Porter, the only difference from
>> the other boards is that DA9063L is at I2C address 0x5a rather
>> than 0x58 .
> 
> Ah, so porter needs the regulator quirk, too.

Most of the boards do in fact, they just miss the regulator nodes.
Silk to from what I can test locally.

>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut
