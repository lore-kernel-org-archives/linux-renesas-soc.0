Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 21 Sep 2017 18:10:20 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: timer: renesas,cmt: Fix SoC-specific
 compatible values
Message-ID: <20170921231020.jehitdqvlpkxw6dp@rob-hp-laptop>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
 <1505742407-31576-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505742407-31576-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 18, 2017 at 03:46:41PM +0200, Geert Uytterhoeven wrote:
> While the new family-specific compatible values introduced by commit
> 6f54cc1adcc8957f ("devicetree: bindings: R-Car Gen2 CMT0 and CMT1
> bindings") use the recommended order "<vendor>,<family>-<device>", the
> new SoC-specific compatible values still use the old and deprecated
> order "<vendor>,<device>-<soc>".
> 
> Switch the SoC-specific compatible values to the recommended order while
> there are no upstream users of these compatible values yet.
> 
> Fixes: 7f03a0ecfdc786c1 ("devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings")
> Fixes: 63d9e8ca0dd4bfa4 ("devicetree: bindings: Deprecate property, update example")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
