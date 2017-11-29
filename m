Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58737 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdK2I0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 03:26:41 -0500
Date: Wed, 29 Nov 2017 09:26:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4] ARM: dts: r8a7794: Add SMP support
Message-ID: <20171129082636.zwbwetif6vuxxfww@verge.net.au>
References: <1511876341-8639-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511876341-8639-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 02:39:01PM +0100, Geert Uytterhoeven wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Add the device tree node for the Advanced Power Management Unit (APMU).
> Use the "enable-method" prop to  point out that the APMU should be used
> for the SMP support.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Dependency 3fd45a136ff61bb5 ("ARM: shmobile: rcar-gen2: Make sure
> CNTVOFF is initialized on CA7/15") is part of v4.15-rc1.

Hi Geert,

sorry if this is a bit of a sore topic but I'd like to ask what sort of
testing this patch has seen. Are there any regressions in the area of
CPU hotplug, suspend to RAM and so on...
