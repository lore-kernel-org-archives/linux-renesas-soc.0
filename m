Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdAWJ2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:28:08 -0500
Date: Mon, 23 Jan 2017 10:28:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: r8a7779: marzen: Fix sata device status
Message-ID: <20170123092803.GG31651@verge.net.au>
References: <1484585813-22534-1-git-send-email-geert+renesas@glider.be>
 <8b298878-672b-74fe-5196-99f8620889ac@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b298878-672b-74fe-5196-99f8620889ac@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 18, 2017 at 08:06:02PM +0300, Sergei Shtylyov wrote:
> On 01/16/2017 07:56 PM, Geert Uytterhoeven wrote:
> 
> >Device nodes representing I/O devices should be marked disabled in the
> >SoC-specific DTS, and overridden by board-specific DTSes where needed.
> >
> >Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>    Simon, I'm seeing this commit in the 'devel' branch but not seeing the
> new tag containing it... forgot to tag/push?

Hi Sergei,

sorry for not responding earlier, I have been ill.

Yes you are correct, I forgot to push.
renesas-devel-20170117-v4.10-rc4 should be there now.
