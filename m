Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35491 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751462AbeCIR0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 12:26:08 -0500
Received: by mail-lf0-f67.google.com with SMTP id z128-v6so8028740lff.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 09:26:07 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: renesas: condor: add EtherAVB pins
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
 <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
 <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b1450eb7-4635-804a-ed8b-34d6c1942fa4@cogentembedded.com>
Date: Fri, 9 Mar 2018 20:26:03 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 03/09/2018 03:44 PM, Geert Uytterhoeven wrote:

>> Add the (previously omitted) EtherAVB pin data to the Condor board's
>> device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> According to the Condor schematics, the KSZ9031RNXVB is wired to
> GEther by default. So I guess you are using a modified board?

  Artemy told me they haven't been able to bring up the GEther (due to wrong
base address?), so they resoldered the reisitors. He also told me there are now
versions of the board that wire the PHY to EtherAVB. Go figure...

[...]

MBR, Sergei
