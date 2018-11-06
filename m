Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 6 Nov 2018 09:57:45 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT
 support
Message-ID: <20181106155745.GA500@bogus>
References: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 26 Oct 2018 09:36:13 +0100, Biju Das wrote:
> Document SoC specific compatible strings for r8a77470. No driver change
> is needed as the fallback strings will activate the right code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against linux-next
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
