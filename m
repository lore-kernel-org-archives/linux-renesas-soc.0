Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34049 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751057AbdJMTI2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 15:08:28 -0400
Date: Fri, 13 Oct 2017 14:08:26 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car M3-W,
 V3M, D3 support
Message-ID: <20171013190826.2hhvgifxdlbmj4mw@rob-hp-laptop>
References: <1507290692-23062-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507290692-23062-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 01:51:32PM +0200, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for Externel Devices
> (INTC-EX) in the Renesas M3-W (r8a7796), V3M (r8a77970), and D3
> (r8a77995) SoCs.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.txt          | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
