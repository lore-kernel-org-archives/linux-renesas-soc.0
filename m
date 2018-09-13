Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:45498 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbeIMPUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 11:20:40 -0400
Subject: Re: of_dma_request_slave_channel() failed ?
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vinod <vkoul@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        dmaengine@vger.kernel.org
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
 <20180912155057.GJ6062@sirena.org.uk>
 <CAMuHMdVnoLTYEvtJ3AY0hFxGqtw-kVE0vWtA74ewJkxkirogYA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2b5e7838-5c5f-b993-1a9c-38208c2b4d24@arm.com>
Date: Thu, 13 Sep 2018 11:11:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVnoLTYEvtJ3AY0hFxGqtw-kVE0vWtA74ewJkxkirogYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13/09/18 10:00, Geert Uytterhoeven wrote:
[...]
> The main issue is that if of_dma_find_controller() fails, a DMA slave driver
> cannot distinguish between dmac not yet probed successfully, and dmac
> driver not present.

...which is in fact the exact same problem that the IOMMU code has - 
might it make sense to give of_dma_request_slave_channel() similar 
(optional?) driver_deferred_probe_check_state() logic, i.e. "if my DMAC 
driver's not shown up by this point, assume it's not built-in and go on 
without it". Of course it is somewhat easier for IOMMU drivers as 
there's zero chance of those popping up as modules later on.

> However, as we rely more and more on probe deferral, this will cause more
> issues in the future.
> 
> I guess the proper solution is to take into account dependencies described
> in DT before probing devices, i.e. devices with phandles should always be
> probed after the targets of these phandles?
> Complication:
>    - Circular dependencies,
>    - Optional phandle targets (dmacs, oops).

Yeah, a proper dependency graph would be ideal, but it's certainly not 
trivial. There was an interesting proposal a couple of years ago of a 
half-way approach where various phandle-chasing routines could actively 
try to probe the target, but I think that got stymied on the fact that a 
single OF node may represent multiple different driver-level providers, 
so it's tricky to tell whether the *right* dependency has been satisfied 
without detailed knowledge of the individual bindings and driver 
implementations. That's probably still an issue for other approaches 
too, sadly.

Robin.
