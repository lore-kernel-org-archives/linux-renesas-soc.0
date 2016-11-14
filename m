Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:35263 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752905AbcKNPz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 10:55:59 -0500
Date: Mon, 14 Nov 2016 09:55:56 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] ARM: shmobile: r8a7745: basic SoC support
Message-ID: <20161114155556.4croyvedgacebukg@rob-hp-laptop>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <1611958.qRQu5pdJd3@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611958.qRQu5pdJd3@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 05, 2016 at 12:49:55AM +0300, Sergei Shtylyov wrote:
> Add minimal support for the RZ/G1E (R8A7745) SoC.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - added Geert's tag;
> - refreshed the patch.
> 
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  arch/arm/mach-shmobile/Kconfig                     |    4 ++++
>  arch/arm/mach-shmobile/setup-rcar-gen2.c           |    1 +
>  3 files changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
