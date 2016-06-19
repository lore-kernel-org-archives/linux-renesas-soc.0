Return-Path: <devicetree-owner@vger.kernel.org>
Date: Sun, 19 Jun 2016 10:06:55 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <damm+renesas@opensource.se>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/13] devicetree: bindings: Renesas APMU and SMP
 Enable method
Message-ID: <20160619150655.GA31189@rob-hp-laptop>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466072862-28030-2-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 16, 2016 at 12:27:30PM +0200, Geert Uytterhoeven wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add DT binding documentation for the APMU hardware and add "renesas,apmu"
> to the list of enable methods for the ARM cpus.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v4:
>   - s/reigsters/registers/,
>   - Use "renesas,<soctype>-apmu" instead of "renesas,apmu-<soctype>",
> 
> v3:
>   - s/Until/Unit/g,
> 
> v2:
>   - No changes.
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  .../devicetree/bindings/power/renesas,apmu.txt     | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt

Acked-by: Rob Herring <robh@kernel.org>
