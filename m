Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f170.google.com ([74.125.82.170]:36506 "EHLO
        mail-ot0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752861AbeCEVIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 16:08:41 -0500
Date: Mon, 5 Mar 2018 15:08:39 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car M3-N
 support
Message-ID: <20180305210839.25q72wkoubsuceg7@rob-hp-laptop>
References: <1519658712-22910-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519658712-22910-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 26, 2018 at 04:25:12PM +0100, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for Externel Devices
> (INTC-EX) in the Renesas M3-N (r8a77965) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
