Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36555 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbeKGWt0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 17:49:26 -0500
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
To: Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20181107085056.GB31092@kunai>
 <7154affe-751a-7cb4-48ea-3d4d6f467ac8@gmail.com>
 <20181107130810.GA18223@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f7d99456-f68f-7880-f22e-8bd47a546e82@gmail.com>
Date: Wed, 7 Nov 2018 14:19:01 +0100
MIME-Version: 1.0
In-Reply-To: <20181107130810.GA18223@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/07/2018 02:08 PM, Wolfram Sang wrote:
> 
>> Nope. I tried that patchset on M3N again yesterday and got error -84
>> while initing the eMMC, so I need to look into that first. Then I'll
>> try it on E3.
> 
> Hmmm, we tried M3N at the hackfest and it worked great there.
> 
> First idea: are you sure you have all depending patch series applied as
> well?
> 
> @Niklas: Have you/can you push a publich branch out with everything
> included.

We discussed this on IRC already, which is why I need to look into that.
The HS200 works well on the M3N though.

-- 
Best regards,
Marek Vasut
