Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:32861 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbcKNP4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 10:56:20 -0500
Date: Mon, 14 Nov 2016 09:56:17 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 09/11] ARM: shmobile: document SK-RZG1E board
Message-ID: <20161114155617.tlx5dh5aa3rsvctt@rob-hp-laptop>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <4775558.KSi1d1GNCP@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4775558.KSi1d1GNCP@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 05, 2016 at 01:02:25AM +0300, Sergei Shtylyov wrote:
> Document the SK-RZG1E device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> SK-RZG1E board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - fixed the subject;
> - added Geert's tag.
> 
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
