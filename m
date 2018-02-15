Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36178 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754963AbeBOIwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 03:52:01 -0500
Received: by mail-lf0-f67.google.com with SMTP id t79so33029236lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 00:52:00 -0800 (PST)
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY
 IRQ
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
 <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
 <CAMuHMdX3XZSwvAT74fVhWw9GoxVmpdXoqR03=u0QC3FEB==X=w@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9003179f-379d-0576-37bf-1b08700ebd41@cogentembedded.com>
Date: Thu, 15 Feb 2018 11:51:58 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX3XZSwvAT74fVhWw9GoxVmpdXoqR03=u0QC3FEB==X=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 2/14/2018 1:02 PM, Geert Uytterhoeven wrote:

>> Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
>> have the GPIO support (previously phylib had to resort to polling).
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> You've dropped my:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Sorry, I was too hasty to resubmit. :-/

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
