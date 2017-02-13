Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39322 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdBMMJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 07:09:19 -0500
Date: Mon, 13 Feb 2017 13:09:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC v3 net] ravb: unmap descriptors when freeing rings
Message-ID: <20170213120912.GA24412@verge.net.au>
References: <1485282073-16662-1-git-send-email-horms+renesas@verge.net.au>
 <312867f0-f6dd-3c92-df09-fae72ea7405b@cogentembedded.com>
 <CAMuHMdVzN_6tfjD1eYBLzrpynupo6C2hnLv6mm5UzcdSNzWtyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzN_6tfjD1eYBLzrpynupo6C2hnLv6mm5UzcdSNzWtyQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 10, 2017 at 02:52:50PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 25, 2017 at 5:18 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 01/24/2017 09:21 PM, Simon Horman wrote:
> >
> >> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >>
> >> "swiotlb buffer is full" errors occur after repeated initialisation of a
> >> device - f.e. suspend/resume or ip link set up/down. This is because
> >> memory
> >> mapped using dma_map_single() in ravb_ring_format() and ravb_start_xmit()
> >> is not released.  Resolve this problem by unmapping descriptors when
> >> freeing rings.
> >
> >
> >    Could you look into the sh_eth driver which seems to have the same issue?
> 
> Indeed, after a few suspend/resume cycles on r8a7791/koelsch:
> 
> WARNING: CPU: 1 PID: 1699 at lib/dma-debug.c:517 add_dma_entry+0xfc/0x148
> DMA-API: exceeded 7 overlapping mappings of cacheline 0x0000000001a827e3

Thanks for confirming that. It matches my expectation after
reading of the sh_eth code.
