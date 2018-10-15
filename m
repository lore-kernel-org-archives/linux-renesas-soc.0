Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46516 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbeJPAmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 20:42:10 -0400
Date: Mon, 15 Oct 2018 11:56:06 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7744 CMT
 support
Message-ID: <20181015165606.GA16226@bogus>
References: <1537895896-25734-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537895896-25734-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 25, 2018 at 06:18:16PM +0100, Biju Das wrote:
> Document SoC specific compatible strings for r8a7744. No driver change
> is needed as the fallback strings will activate the right code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied.
